FROM alpine:3 AS download
WORKDIR /
RUN apk update \
 && apk add curl \
 && curl -sLo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl \
 && chmod 0755 /kubectl

FROM alpine:3
COPY --from=download /kubectl /usr/bin/kubectl
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
