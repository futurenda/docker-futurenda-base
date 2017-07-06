FROM scratch

ADD rootfs.tar.gz /

COPY lib/ld-2.24.so /lib64/ld-linux-x86-64.so.2
COPY lib/libc.so.6  /usr/lib/libc.so.6
COPY lib/libpthread-2.24.so /usr/lib/libpthread.so.0

# Add Tini
ENV TINI_VERSION v0.15.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini