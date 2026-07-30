## What does this change?

<!-- Describe the change and why it is needed. Link the issue it addresses.
     Screenshots or a screen recording help for anything visual. -->

Closes #

## Type of change

- [ ] Bug fix
- [ ] New feature
- [ ] Documentation
- [ ] Tooling / CI

## Scope

- [ ] Touches a transaction-signing flow — **expect closer review**
- [ ] Touches the chart WebView — see [SECURITY.md](../SECURITY.md#the-chart-webview)
- [ ] Requires a matching change in `tokenzyme-core` or `tokenzyme-indexer`
- [ ] Adds a platform permission or changes native configuration

## Tested on

- [ ] Android
- [ ] iOS

## Checklist

- [ ] `flutter analyze` passes
- [ ] The app builds and runs
- [ ] Types are explicit — `always_specify_types` is enforced, including on generics
- [ ] Configuration is read through `lib/utils/env.dart`, not `dotenv.env[...]` directly
- [ ] New environment variables are documented in `.env.template` and added to the CI workflow
- [ ] Generated code was regenerated with `dart run build_runner build --delete-conflicting-outputs` rather than hand-edited, and is committed
- [ ] If a contract changed: `assets/*_abi.json` was refreshed
- [ ] If core's schema changed: `lib/graphql/schema.graphql` was refreshed before regenerating
- [ ] No keystore, `release.properties` or other credential is included
- [ ] Token-supplied URLs have their scheme validated before being opened
- [ ] This is not a security fix (those go through private disclosure — see SECURITY.md)
