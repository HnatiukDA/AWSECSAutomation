FROM golang:1.20.5-bullseye AS builder

ARG VERSION=dev

WORKDIR /go/src/app
COPY main.go .
RUN go mod init main \
    && go mod tidy

RUN go build -o main -ldflags="-s -w -X=main.version=${VERSION}" main.go

FROM debian:bullseye-slim
COPY --from=builder /go/src/app/main /go/bin/main
ENV PATH="/go/bin:${PATH}"
CMD ["main"]