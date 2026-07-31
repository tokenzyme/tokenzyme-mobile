/// Branding and community links shown in the app.
///
/// FORKING THIS PROJECT? Replace every value in this file with your own. These are
/// Tokenzyme's name and community channels — shipping them in a fork points your users
/// at someone else's project, and the Apache-2.0 licence does not grant rights to the
/// Tokenzyme name or brand (see NOTICE).
///
/// The website URL is not here: it comes from APP_URL in .env, because the app also
/// loads the token chart from that host.
library;

/// Display name, used in the app bar and in the wallet-connection prompt.
const String appName = 'Tokenzyme';

/// Community links shown in the navigation drawer. Empty by default: this project
/// publishes none, and shipping someone else's channels is worse than shipping none.
/// Fill in your own and the entries appear; leave one empty and it stays hidden.
/// Telegram also drives the "Support channel" entry.
const String xUrl = '';
const String telegramUrl = '';
const String redditUrl = '';

/// Custom URL scheme the wallet redirects back to after signing.
///
/// This must match the scheme registered natively — `applicationId` in
/// android/app/build.gradle.kts and CFBundleURLSchemes in ios/Runner/Info.plist.
/// Changing it here alone will silently break the return trip from the wallet app.
const String appLinkScheme = 'com.tokenzyme://';
