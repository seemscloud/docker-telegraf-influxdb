FROM vectorized/console:latest

ENV PATH="/app:${PATH}"

COPY ./docker-entrypoint.sh .

ENTRYPOINT ["/bin/sh", "docker-entrypoint.sh"]