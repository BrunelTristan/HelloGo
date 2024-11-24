# -----------------------------------------------------------------------------
# socle
FROM alpine:3.20.1 As socle

# -----------------------------------------------------------------------------
# builder Env
FROM socle as builder

RUN apk add make go

WORKDIR /src

CMD ["make"]


# -----------------------------------------------------------------------------
# Execution
FROM builder As executor

RUN ./first