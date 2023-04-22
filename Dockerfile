FROM golang:latest as build

WORKDIR /app
COPY app/main.go .
RUN go build /app/main.go

FROM scratch
WORKDIR /app
COPY --from=build /app/main .
CMD ["/app/main"]
