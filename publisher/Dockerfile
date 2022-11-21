# Собираем в гошке
FROM golang:1.17.3 as build

ENV BIN_FILE /opt/gorabbit/publisher-app
ENV CODE_DIR /go/src/

WORKDIR ${CODE_DIR}

# Кэшируем слои с модулями
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . ${CODE_DIR}

# Собираем статический бинарник Go (без зависимостей на Си API),
# иначе он не будет работать в alpine образе.
ARG LDFLAGS
RUN CGO_ENABLED=0 go build \
        -o ${BIN_FILE} publisher/*.go

# На выходе тонкий образ
FROM alpine:3.15


ENV BIN_FILE "/opt/gorabbit/publisher-app"
COPY --from=build ${BIN_FILE} ${BIN_FILE}

CMD ${BIN_FILE}