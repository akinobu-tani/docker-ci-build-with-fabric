FROM docker:17.07-git

# install make python
RUN apk add --no-cache \
        make \
        py-pip

# install fabric
RUN set -eux; \
        apk add --no-cache --virtual .build-deps \
                gcc \
                python-dev \
                musl-dev \
                libffi-dev \
                openssl-dev \
        ; \
        pip install fabric; \
        apk del .build-deps; \
        fab --version
