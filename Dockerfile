FROM scratch
ADD rootfs.tar.xz /

ENV TINI_VERSION v0.15.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
RUN busybox

ENTRYPOINT ["/tini", "--"]
CMD ["sh"]
