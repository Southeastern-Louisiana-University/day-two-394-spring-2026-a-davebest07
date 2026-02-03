FROM ubuntu:22.04 AS build

WORKDIR /app

RUN apt update && apt install -y wget ca-certificates build-essential

RUN wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

COPY main.go .

RUN go build -o hello main.go



FROM alpine:latest

WORKDIR /app

COPY --from=build /app/hello .

ENTRYPOINT ["./hello"]
