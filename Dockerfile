ARG GO_VERSION=1.12

FROM golang:${GO_VERSION}-alpine AS builder


RUN apk add --no-cache ca-certificates git

WORKDIR /src


COPY ./go.mod ./go.sum ./

RUN go mod download

# Import the code from the context.
COPY ./ ./

# Run the compiled binary.
ENTRYPOINT ["/app"]
