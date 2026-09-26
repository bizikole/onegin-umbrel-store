# Onegin Store for umbrelOS

Personal Community App Store for umbrelOS with a small home-media / homelab stack:

- TorrServer (YouROK MatriX)
- TorrServer MatriX UN (ByLampa)
- Lampa
- Homelable
- Stremio Server

## Automatic upstream updates

GitHub Actions checks upstream releases every 6 hours and updates the app manifests and image tags in this repository. The ByLampa Matrix UN container is rebuilt and published to GHCR when a new `.UN` release appears.

This automatically keeps the **store metadata** current. umbrelOS still controls installation/update of an installed app; when Umbrel shows an available update, you can apply it from the App Store.

## Add to umbrelOS

1. Open App Store.
2. Open Community App Stores.
3. Add this repository:

   `https://github.com/bizikole/onegin-umbrel-store`

4. Open Onegin Store.
