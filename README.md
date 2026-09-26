# Onegin Store for umbrelOS

Personal Community App Store for umbrelOS with a small home-media / homelab stack.

## Apps

- TorrServer (YouROK MatriX)
- TorrServer MatriX UN (ByLampa)
- Lampa
- Homelable
- Stremio Server

## Umbrel packaging

This store follows the official Umbrel Community App Store layout and uses Umbrel's `app_proxy` service. The proxy points to service names in the form `<app-id>_<service>_1`; the main web port is handled by the proxy instead of being published again from the application container. This avoids the service-routing problems that occur when a community app uses arbitrary container names.

The store also uses unique host-side app ports for Lampa and Homelable instead of port 80, because umbrelOS already uses its own web stack.

## Upstream updates

GitHub Actions checks upstream releases every 6 hours and commits new manifest/image versions when they change.

- TorrServer: GitHub releases
- Lampa: GitHub releases, requiring the `lampa-portable.zip` asset
- Homelable: GitHub releases and prebuilt GHCR tags
- Stremio Server: Docker Hub semver tags (`vX.Y.Z`)
- TorrServer MatriX UN: highest ByLampa `MatriX.*.UN` GitHub release

The next umbrelOS refresh will then show the changed app version as an available update.

## Ports

| App | Umbrel port | Container port |
|---|---:|---:|
| Lampa | 38100 | 80 |
| Homelable | 38101 | 80 |
| TorrServer | 8090 | 8090 |
| TorrServer MatriX UN | 8091 | 8090 |
| Stremio Server | 11470 | 11470 |
| Stremio Server HTTPS | 12470 | 12470 |

