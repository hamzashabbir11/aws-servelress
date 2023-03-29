FROM lambci/lambda:build-python3.8
WORKDIR /tmp
RUN yum install -y \
        rpmdevtools \
        yum-utils
RUN yumdownloader \
        binutils \
        cairo \
        expat \
        fontconfig \
        freetype \
        glib2 \
        libglvnd \
        libglvnd-egl \
        libglvnd-glx \
        libpng \
        libuuid \
        libX11 \
        libXau \
        libxcb \
        libXext \
        libXrender \
        pango \
        pixman \
        libthai \
        fribidi \
        harfbuzz \
        graphite2 \
    && rpmdev-extract *rpm
WORKDIR /
RUN mkdir -p /opt/bin \
    && mkdir -p /opt/lib \
    && rm -rf /opt/lib/*
RUN cp -P /tmp/*/usr/bin/ld.bfd /opt/bin/ld \
    && cp -P /tmp/*/usr/bin/objdump /opt/bin/objdump \
    && cp -P -R /tmp/*/usr/lib64/* /opt/lib \
    && ln /opt/lib/libcairo.so.2 /opt/lib/libcairo \
    && ln /opt/lib/libpango-1.0.so.0 /opt/lib/libpango-1.0 \
    && ln /opt/lib/libpangocairo-1.0.so.0 /opt/lib/pangocairo-1.0 \
    && cd opt \
    && zip -r weasyprint_deps.zip .