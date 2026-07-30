# Security Policy

## Reporting a vulnerability

**Do not open a public issue, pull request or discussion for a security
vulnerability.**

Report it through GitHub's [private vulnerability reporting](https://github.com/tokenzyme/tokenzyme-mobile/security/advisories/new)
— the **Security** tab, then **Report a vulnerability**. That opens a private
advisory only you and the maintainers can see.

Please include a description of the issue, its impact, and steps to reproduce.

### What to expect

| Stage | Target |
| --- | --- |
| Acknowledgement of your report | 72 hours |
| Initial assessment and severity triage | 7 days |
| Status update cadence while we work on a fix | every 7 days |

We will credit you in the advisory unless you ask us not to. There is no formal bug
bounty program at this time.

If the vulnerability is in the smart contracts rather than this client, report it
through [tokenzyme-contracts](https://github.com/tokenzyme/tokenzyme-contracts/blob/main/SECURITY.md)
instead — that is where the funds are.

## Supported versions

Only the `main` branch and the currently published build receive security fixes. There
are no long-term support branches.

## What matters most in a wallet-facing client

This app builds transactions that users sign with their own keys. That makes a narrow
set of bugs unusually serious.

**High severity — report these.** Anything that could cause a user to sign something
other than what the interface showed them:

- a transaction built with a different recipient, amount, token or contract address
  than the UI displayed;
- slippage bounds not applied, or applied to the wrong value;
- the launchpad address, chain ID or RPC endpoint being influenced by remote data
  rather than by `.env`;
- anything that lets remote content reach a signing flow — token metadata is
  attacker-controlled (see below);
- data written to `flutter_secure_storage` leaking, or the auth token being readable
  by another app.

**Not a vulnerability here.** The API serving wrong data is a
[core](https://github.com/tokenzyme/tokenzyme-core/blob/main/SECURITY.md) or
[indexer](https://github.com/tokenzyme/tokenzyme-indexer/blob/main/SECURITY.md)
concern. A trade settling unfavourably on-chain is a
[contracts](https://github.com/tokenzyme/tokenzyme-contracts/blob/main/SECURITY.md)
concern. Chart rendering is
[tokenzyme-app](https://github.com/tokenzyme/tokenzyme-app/blob/main/SECURITY.md) —
see the WebView note below.

## Trust model

**This client holds no private keys.** Signing happens in the user's wallet app
through Reown AppKit. The app never sees a seed phrase or a private key.

**`.env` ships inside the app bundle.** It is declared as a Flutter asset in
`pubspec.yaml`, so it is packaged into the APK and IPA and can be extracted by anyone
who downloads the app. Everything in it is public by construction. This is fine for
what it currently holds — backend URLs, the network, the launchpad address and the
Reown project ID, all of which are non-secret configuration. **Never add anything to
`.env` that would be harmful to disclose.** There is no mechanism in this app for
holding a secret.

**Signing keys are not in this repository.** Android release signing reads
`android/release.properties`, which is git-ignored along with `*.jks`, and
`bin/build_android_apks.sh` prompts for keystore passwords rather than reading them
from a file. Keep it that way — never commit a keystore or a properties file
containing one.

**The API is not authoritative about the chain.** Prices, balances and trade history
come from core. A compromised backend can display false numbers. Anything the user is
about to *sign* should be derived from on-chain state or from values the user entered,
not from an API response.

## The chart WebView

`lib/views/token/tabs/info/chart.dart` loads `<APP_URL>/tokens/<address>/chart` in a
`webview_flutter` view with `JavaScriptMode.unrestricted`.

That means:

- **`APP_URL` must be HTTPS in any real deployment.** Over plain HTTP, a network
  attacker can inject arbitrary JavaScript into a WebView running inside your app.
- `APP_URL` comes from `.env` and must never become remotely configurable.
- The WebView has no JavaScript channel back into Dart, and no wallet or signing
  capability is exposed to it. Keep it that way — do not add a `JavaScriptChannel` to
  this WebView without a very good reason and a careful review.

## Token metadata is attacker-controlled

Names, symbols, descriptions, logo URLs and social links come from whoever launched
the token on-chain, where only lengths and URL prefixes are validated. Impersonating an
existing project is trivial and nothing upstream prevents it. Treat all of it as
untrusted:

- validate the scheme before passing any token-supplied URL to `url_launcher` or a
  WebView;
- do not assume a logo URL points at an image;
- never let it influence a contract address, an amount, or a chain ID.

## Deployment notes

- Change the application identifier (`com.tokenzyme`) before publishing a fork.
- Use your own Reown project ID — it is tied to an account and its configured redirect
  URLs.
- Set `CORS_ORIGIN` on core and the indexer. Left unset in development, they accept any
  origin.
