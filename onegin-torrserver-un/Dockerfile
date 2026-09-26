FROM debian:bookworm-slim

ARG MATRIX_TAG=bylampa_MatriX.145.UN
ARG TARGETARCH

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && rm -rf /var/lib/apt/lists/* \
    && set -eux; \
       case "${TARGETARCH}" in \
         amd64) asset="TorrServer-linux-amd64" ;; \
         arm64) asset="TorrServer-linux-arm64" ;; \
         arm)   asset="TorrServer-linux-arm7" ;; \
         *) echo "Unsupported TARGETARCH=${TARGETARCH}" >&2; exit 1 ;; \
       esac; \
       curl -fL --retry 5 --retry-delay 2 \
         "https://github.com/bylampa/Matrix/releases/download/${MATRIX_TAG}/${asset}" \
         -o /usr/local/bin/TorrServer; \
       chmod +x /usr/local/bin/TorrServer

ENV TS_PORT=8090 \
    TS_PATH=/opt/ts/config \
    TS_TORRENTSDIR=/opt/ts/torrents \
    TS_DONTKILL=1

EXPOSE 8090
VOLUME ["/opt/ts"]

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["mkdir -p \"$TS_PATH\" \"$TS_TORRENTSDIR\"; exec /usr/local/bin/TorrServer --port \"$TS_PORT\" --path \"$TS_PATH\" --torrentsdir \"$TS_TORRENTSDIR\" --dontkill"]
