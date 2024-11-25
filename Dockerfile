# -----------------------------------------------------------------------------
# socle
FROM alpine:3.20.1 As socle

RUN apk add go

WORKDIR /src

# -----------------------------------------------------------------------------
# builder Env
FROM socle as builder

RUN apk add make

CMD ["make"]


# -----------------------------------------------------------------------------
# Execution
FROM builder As executor

RUN ./first