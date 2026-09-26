# Onegin Store for umbrelOS

Personal Community App Store for umbrelOS with a small home-media / homelab stack:

- TorrServer
- Lampa
- Homelable
- Stremio Server

## Add to umbrelOS

1. Open **App Store**.
2. Open **⋯ → Community App Stores** (or **Settings → App Stores**, depending on umbrelOS version).
3. Add this GitHub repository URL.
4. Open **Onegin Store** and install the apps.

This is a personal community store, not an official Umbrel store.

## Notes

- TorrServer data is stored in the app data directory so settings/cache survive container recreation.
- Lampa is packaged as a static web client. The package downloads the upstream Lampa 1.4.1 portable release on first start and stores it in the app data directory.
- Homelable uses the upstream prebuilt GHCR images. Docker bridge networking is used for compatibility with Umbrel; MAC-address discovery is therefore not available from the container.
- Stremio Server exposes the upstream HTTP/HTTPS ports 11470/12470 for clients.


### Icons

Each app has a local 256×256 PNG icon and the manifest references it through the repository raw URL, which is compatible with Community App Stores.
