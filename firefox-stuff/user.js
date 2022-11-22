// Middle mouse button stuff
user_pref("general.autoScroll", true);
user_pref("middlemouse.paste", false);

// Web notifications
user_pref("dom.webnotifications.enabled", false);

// Geolocation
user_pref("geo.enabled", false);

// Raw TCP socket support
user_pref("dom.mozTCPSocket.enabled", false);

// Leaking network/browser connection info via JS
user_pref("dom.netinfo.enabled", false);

// Don't download favicons
user_pref("browser.chrome.site_icons", false);

// WebRTC getUserMedia, screen sharing, audio capture, video capture
user_pref("media.navigator.enabled", false);
user_pref("media.navigator.video.enabled", false);
user_pref("media.getusermedia.screensharing.enabled", false);
user_pref("media.getusermedia.audiocapture.enabled", false);

// Beacons
user_pref("becaon.enabled", false);

// Clipboard stuff
user_pref("dom.evet.clipboardevents.enabled", false);
user_pref("dom.allo_cut_copy", false);
user_pref("clipboard.plainTextOnly", true);

// Speech recognition and synthesis
user_pref("media.webspeech.recognition.enable", false);
user_pref("media.webspeech.synth.enabledl", false);

// Pings
user_pref("browser.send_pings", false);

// Random APIs
user_pref("dom.gamepad.enabled", false);
user_pref("device.sensors.enabled", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.telephony.enabled", false);
user_pref("dom.network.enabled", false);
user_pref("dom.webaudio.enabled", false);
user_pref("dom.enable_performance", false);
user_pref("dom.enable_user_timing", false);
user_pref("dom.vibrator.enabled", false);
user_pref("dom.enable_resource_timing", false);
user_pref("dom.archivereader.enabled", false);
user_pref("dom.flyweb.enabled", false);
user_pref("browser.uitour.enabled", false);
user_pref("browser.tabs.firefox-view", false)

// Disable firefox accounts
user_pref("identity.fxaccounts.enabled", false);

// Security dialog when downloading stuff
user_pref("security.dialog_enable_delay", 0);

// Minimal WebGL
user_pref("webgl.min_capability_mode", true);
user_pref("webgl.disable-extensions", true);
user_pref("webgl.disable-fail-if-major-performance-caveat", true);
user_pref("webgl.enable-debug-renderer-info", false);
user_pref("pdfjs.enableWebGL", false);

// Spoof dual-core CPU
user_pref("dom.maxHardwareConcurrency", 2);

// WebAssembly
user_pref("javascript.options.wasm", false);

// Face detection
user_pref("camera.control.face_detection.enabled", false);

// GeoIP lookup
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.region", "US");
user_pref("browser.search.geoip.url", "");

// Locale
user_pref("intl.accept_languages", "en-US, en");
user_pref("intl.locale.matchOS", false);
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("javascript.use_us_english_locale", true);

// Domain names stuff
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.fixup.alternate.enabled", false);

// Online/offline connection state
user_pref("network.manage-offline-status", false);

// Strict URI origin policy
user_pref("security.fileuri.strict_origin_policy", true);

// asm.js
user_pref("javascript.options.asmjs", false);

// Video stats
user_pref("media.video_stats.enabled", false);

// Build ID
user_pref("general.buildID.override", "20100101");
user_pref("browser.startup.homepage_override.buildID", "20100101");
user_pref("extensions.lastAppBuildId", "20100101");

// Document specified fonts
// user_pref("browser.display.use_document_fonts", 0);
user_pref("browser.display.use_document_fonts", 1);

// Addons, plugins, extensions, themes etc.
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("lightweightThemes.update.enabled", false);
user_pref("plugin.state.flash", 0);
user_pref("plugin.state.java", 0);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
user_pref("shumway.disabled", true);
user_pref("plugin.state.libgnome-shell-browser-plugin", 0);
user_pref("plugins.click_to_play", true);
user_pref("extensions.update.enabled", true);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);

// Mozilla blocklist
user_pref("extensions.blocklist.enabled", true);
user_pref("services.blocklist.update_enabled", true);
user_pref("extensions.blocklist.url", "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/");

// WebIDE and remote debugging
user_pref("devtools.webide.enabled", false);
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters", false);
user_pref("devtools.debugger.remote-enabled", false);
user_pref("devtools.chrome.enabled", false);
user_pref("devtools.debugger.force-local", true);

// Reports, telemetry and experiments
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("toolkit.coverage.opt-out", true);
user_pref("browser.ping-centre.telemetry", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("network.allow-experiments", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("security.ssl.errorReporting.automatic", false);

// Contextual containers
user_pref("privacy.userContext.enabled", true);

// Tracking protection
// privacy.resistFingerprinting is off because some addons, like canvasblocker,
// are sabotaged by it
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);
user_pref("extensions.webextensions.restrictedDomains", "");
//pref("privacy.resistFingerprinting.letterboxing", true);
//pref("privacy.resistFingerprinting.letterboxing.dimensions", "800x600, 1000x1000, 1600x900");

// Startup
user_pref("browser.startup.blankWindow", false);
user_pref("browser.aboutHomeSnippets.updateUrl", "");

// Normandy and stuff
user_pref("app.normandy.first_run", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("extensions.shield-recipe-client.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);

// Firefox Hello
user_pref("loop.enabled", false);
user_pref("loop.logDomains", false);

// Auto-update disabled because Linux <3
// Also more privacy
user_pref("app.update.auto", false);
user_pref("app.update.enabled", false);
user_pref("browser.search.update", false);

// Safebrowsing
user_pref("browser.safebrowsing.phishing.enabled", true);
user_pref("browser.safebrowsing.malware.enabled", true);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

// Pocket
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// Prefetching, predicting, speculations
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.predictor.enabled", false);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("browser.places.speculativeConnect.enabled", false);

// Onion resolving
user_pref("network.dns.blockDotOnion", true);

// Search suggestions
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.autoFill", false);
user_pref("browser.urlbar.autoFill.typed", false);
user_pref("browser.urlbar.autocomplete.enabled", false);

// Wrap long lines in source view
user_pref("view_source.wrap_long_lines", true);

// SSDP
user_pref("browser.casting.enabled", false);

// OpenH264
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.url", "");

// Captive portal detection
user_pref("captivedetect.canonicalURL", "");
user_pref("network.connectivity-service.enabled", false);
user_pref("network.captive-portal-service.enabled", false);

// CSP and SRI
user_pref("security.csp.enable", true);
user_pref("security.sri.enable", true);

// Referer headers
user_pref("network.http.referer.XOriginPolicy", 2);

// Cookies
user_pref("network.cookie.thirdparty.sessionOnly", true);
user_pref("network.cookie.cookieBehavior", 1);

// Permanent private browsing mode
user_pref("browser.privatebrowsing.autostart", true);
user_pref("extensions.allowPrivateBrowsingByDefault", true);

// Caching
user_pref("browser.cache.offline.enable", false);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.openWindows", true);
user_pref("browser.helperApps.deleteTempFileOnExit", true);
user_pref("browser.bookmarks.max_backups", 0);

// Downloading
user_pref("browser.download.folderList", 2);
user_pref("browser.download.useDownloadDir", true);

// New tab
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.url", "about:blank");
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtab.preload", false);
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.directory.source", "data:text/plain,{}");

// CSS
user_pref("layout.css.visited_links_enabled", false);

// Default browser
user_pref("browser.shell.checkDefaultBrowser", false);

// Network security
user_pref("network.stricttransportsecurity.preloadlist", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.OCSP.enabled", 1);
user_pref("security.OSCP.require", true);
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.ssl.enable_ocsp_must_staple", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.ssl.disable_session_identifiers", true);
user_pref("security.ssl.enable_false_start", false);
user_pref("security.tls.version.min", 3);
user_pref("security.tls.version.max", 4);
user_pref("security.tls.version.fallback-limit", 3);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("browser.ssl_override_behavior", 1);
user_pref("network.security.esni.enabled", true);

// Ciphers
user_pref("security.ssl3.rsa_null_sha", false);
user_pref("security.ssl3.rsa_null_md5", false);
user_pref("security.ssl3.ecdhe_rsa_null_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_null_sha", false);
user_pref("security.ssl3.ecdh_rsa_null_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_null_sha", false);
user_pref("security.ssl3.rsa_seed_sha", false);
user_pref("security.ssl3.rsa_rc4_40_md5", false);
user_pref("security.ssl3.rsa_rc2_40_md5", false);
user_pref("security.ssl3.rsa_1024_rc4_56_sha", false);
user_pref("security.ssl3.rsa_camellia_128_sha", false);
user_pref("security.ssl3.ecdhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha", false);
user_pref("security.ssl3.ecdh_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_aes_128_sha", false);
user_pref("security.ssl3.dhe_rsa_camellia_128_sha", false);
user_pref("security.ssl3.dhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_rc4_128_sha", false);
user_pref("security.ssl3.ecdh_rsa_rc4_128_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha", false);
user_pref("security.ssl3.ecdhe_rsa_rc4_128_sha", false);
user_pref("security.ssl3.rsa_rc4_128_md5", false);
user_pref("security.ssl3.rsa_rc4_128_sha", false);
user_pref("security.tls.unrestricted_rc4_fallback", false);
user_pref("security.ssl3.dhe_dss_des_ede3_sha", false);
user_pref("security.ssl3.dhe_rsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdh_rsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdhe_rsa_des_ede3_sha", false);
user_pref("security.ssl3.rsa_des_ede3_sha", false);
user_pref("security.ssl3.rsa_fips_des_ede3_sha", false);
user_pref("security.ssl3.ecdh_rsa_aes_256_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_aes_256_sha", false);
user_pref("security.ssl3.rsa_camellia_256_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256", true);
user_pref("security.ssl3.ecdhe_rsa_aes_128_gcm_sha256", true);
user_pref("security.ssl3.ecdhe_ecdsa_chacha20_poly1305_sha256", true);
user_pref("security.ssl3.ecdhe_rsa_chacha20_poly1305_sha256", true);
user_pref("security.ssl3.dhe_rsa_camellia_256_sha", false);
user_pref("security.ssl3.dhe_rsa_aes_256_sha", false);
user_pref("security.ssl3.dhe_dss_aes_128_sha", false);
user_pref("security.ssl3.dhe_dss_aes_256_sha", false);
user_pref("security.ssl3.dhe_dss_camellia_128_sha", false);
user_pref("security.ssl3.dhe_dss_camellia_256_sha", false);

// UI
user_pref("browser.aboutConfig.showWarning", false);
user_pref("devtools.theme", "dark");
user_pref("browser.uidensity", 1);
user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"urlbar-container\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\"],\"currentVersion\":16,\"newElementCount\":3}");
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);
user_pref("browser.quitShortcut.disabled", true);
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("ui.prefersReducedMotion", 1);
