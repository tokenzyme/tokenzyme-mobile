# Tokenzyme Mobile

The Flutter client for **Tokenzyme**, a permissionless token launchpad for EVM chains.
Launch a token, trade it against a bonding curve, and follow it through to its DEX
migration — from Android or iOS, signing with your own wallet.

Built with Flutter, Riverpod, flutter_hooks, graphql_flutter, web3dart and Reown
AppKit.

> [!TIP]
> **New to the project?** Start with
> [tokenzyme-core / ARCHITECTURE.md](https://github.com/tokenzyme/tokenzyme-core/blob/main/ARCHITECTURE.md).
> It covers all five Tokenzyme repositories, how data flows between them, and how to
> bring the whole stack up locally. This README covers only the mobile client.

## Table of contents

- [How it fits together](#how-it-fits-together)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Generated code](#generated-code)
- [Building for release](#building-for-release)
- [Contributing](#contributing)
- [Security](#security)
- [License](#license)

## How it fits together

Reads and writes take different paths.

**Writes go straight to the chain.** Launching a token and buying or selling against
the bonding curve are transactions built with `web3dart`, signed in the user's wallet
through Reown AppKit, and submitted to the network. The backend is never in that path
and cannot censor, forge or front-run a trade.

**Reads come from the backend.** Token lists, trade history, holders and comments are
queried over GraphQL from [`tokenzyme-core`](https://github.com/tokenzyme/tokenzyme-core),
which serves data materialized by
[`tokenzyme-indexer`](https://github.com/tokenzyme/tokenzyme-indexer).

**Live updates arrive over two WebSockets.** Trades and price changes come from the
indexer on `INDEXER_URL`; comments come from core on `CORE_URL`. See
`lib/hooks/use_socket_event.dart`.

> [!IMPORTANT]
> **The price chart is not native.** `lib/views/token/tabs/info/chart.dart` loads
> `<APP_URL>/tokens/<address>/chart` from
> [`tokenzyme-app`](https://github.com/tokenzyme/tokenzyme-app) inside a
> `webview_flutter` view. Charts here depend on the web client being deployed and
> reachable at `APP_URL`, and chart bugs are usually fixed in that repository, not
> this one.

## Project structure

```
lib/
├── constants/    spacing, radii and other design tokens
├── exceptions/   typed failures (e.g. ContractCallException)
├── extensions/   Dart/Flutter extensions, including the theme extension
├── graphql/      .graphql documents + generated .graphql.dart — see below
├── hooks/        wallet, balances, contract calls, socket events
├── providers/    Riverpod providers (theme, slippage, eth price)
├── utils/        env parsing, blockchain helpers, formatting, storage
├── views/        screens, one directory per feature area
├── widgets/      shared widgets
└── main.dart     entrypoint — loads .env, initializes AppKit
```

Conventions worth knowing:

- **Riverpod + flutter_hooks.** Screens are `HookConsumerWidget`. Shared async state
  lives in `lib/providers/providers.dart`; per-screen logic lives in hooks.
- **`always_specify_types` is enforced** (see `analysis_options.yaml`). Write
  `String foo = ...`, not `var foo = ...`. This is stricter than typical Dart style —
  match the surrounding code.
- **Single quotes** for strings.
- ABIs are loaded from `assets/` at runtime by `lib/utils/blockchain.dart`.

## Getting started

Requirements: Flutter with Dart SDK 3.6+, plus Xcode and/or the Android SDK.

You also need [`tokenzyme-core`](https://github.com/tokenzyme/tokenzyme-core) and
[`tokenzyme-indexer`](https://github.com/tokenzyme/tokenzyme-indexer) running, a chain
to point at, and — for charts — [`tokenzyme-app`](https://github.com/tokenzyme/tokenzyme-app)
served at `APP_URL`. The
[architecture guide](https://github.com/tokenzyme/tokenzyme-core/blob/main/ARCHITECTURE.md#running-the-whole-stack-locally)
walks through the full sequence.

```bash
flutter pub get

# Copy the environment template and fill it in
cp .env.template .env

flutter run
```

Every variable is documented inline in [`.env.template`](./.env.template) and every one
is required — `lib/utils/env.dart` throws at startup if any is missing.

| Variable | Notes |
| --- | --- |
| `CORE_URL` | GraphQL API and comments WebSocket. |
| `INDEXER_URL` | Trades and price WebSocket. |
| `APP_URL` | Where the web client is served. The chart WebView loads from here. |
| `REOWN_PROJECT_ID` | Create your own at [dashboard.reown.com](https://dashboard.reown.com). |
| `NETWORK`, `LAUNCHPAD_ADDRESS` | Must match each other and the backend. The address is your own deployment — see [tokenzyme-contracts](https://github.com/tokenzyme/tokenzyme-contracts#deploying). |

> [!WARNING]
> `.env` is declared as a Flutter **asset** in `pubspec.yaml`, which means it is packaged
> into the app bundle and can be extracted from any published APK or IPA. Everything in
> it is effectively public. Never put a private key, an API secret or a signing
> credential there.

```bash
flutter analyze   # static analysis, using analysis_options.yaml
```

> [!NOTE]
> There is no test suite yet. See [CONTRIBUTING.md](./CONTRIBUTING.md#on-tests).

Running on an emulator or simulator? `localhost` will not reach your machine's
services. Use `10.0.2.2` on the Android emulator, or your LAN IP.

## Generated code

Three things in this repository are generated or copied, and none of them update
themselves.

### GraphQL types

```bash
dart run build_runner build --delete-conflicting-outputs
```

`graphql_codegen` reads the `.graphql` documents in `lib/graphql/` against
`lib/graphql/schema.graphql` and emits the matching `.graphql.dart` files. Scalar
mappings live in `build.yaml`.

`lib/graphql/schema.graphql` is a **manual copy** of core's schema. When core's GraphQL
API changes, refresh it from a running instance before regenerating — otherwise codegen
happily produces types for a schema that no longer exists.

The same command also runs `riverpod_generator` and `json_serializable` for the
`.g.dart` files.

### Contract ABIs

`assets/launchpad_abi.json` and `assets/erc20_abi.json` are **manual copies** of the
ABIs produced by
[`tokenzyme-contracts`](https://github.com/tokenzyme/tokenzyme-contracts). After a
contract change, copy the new ABI over the old one. Nothing detects the drift —
`web3dart` will simply fail to find the function at runtime.

## Building for release

Application ID and bundle identifier are both `com.tokenzyme`. Change them before
publishing a fork.

Android signing reads `android/release.properties`, which is git-ignored along with
`*.jks`. Create it with `storeFile`, `storePassword`, `keyAlias` and `keyPassword`.
Without it, the release build type is simply not configured — the debug build still
works.

```bash
flutter build appbundle    # Play Store
flutter build ipa          # App Store
```

`bin/build_android_apks.sh` wraps `bundletool` to produce installable APKs from an app
bundle. It prompts for the keystore path and passwords rather than reading them from a
file, and needs `BUNDLE_TOOL_PATH` pointing at your `bundletool.jar`.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md). Contributions are welcome — please open an
issue before starting on anything substantial.

## Security

Do **not** open a public issue for a vulnerability. Follow the disclosure process in
[SECURITY.md](./SECURITY.md).

## Related repositories

| Repository | Role |
| --- | --- |
| [tokenzyme-contracts](https://github.com/tokenzyme/tokenzyme-contracts) | The on-chain protocol. |
| [tokenzyme-core](https://github.com/tokenzyme/tokenzyme-core) | GraphQL API. |
| [tokenzyme-indexer](https://github.com/tokenzyme/tokenzyme-indexer) | Indexes contract events; streams live updates. |
| [tokenzyme-app](https://github.com/tokenzyme/tokenzyme-app) | React web client. Also serves the chart embedded here. |
| [tokenzyme-mobile](https://github.com/tokenzyme/tokenzyme-mobile) | This repository. |

## License

Licensed under the [Apache License 2.0](./LICENSE). See [NOTICE](./NOTICE) for
attribution requirements.

### Trademarks

The license covers the source code. It does **not** grant rights to the "Tokenzyme"
name, logo, app icon, or other brand assets. If you fork this project, publish it under
your own name, identifier and branding — not as Tokenzyme.
