# Docker container containing toml2json

FROM alpine:3.6
LABEL maintainer="Jason Crowe <jcrowe@mozilla.com>"

ENV AwCliVersion=1.10.38

# Install container dependencies
#+ Cleanup apk cache files
RUN apk add --no-cache \
    py-pip \
    && rm -f /var/cache/apk/APKINDEX.* \
    && pip install awscli==${AwCliVersion}

ENTRYPOINT [ "aws" ]
