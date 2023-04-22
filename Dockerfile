# FROM golang:latest as build

# WORKDIR /app
# COPY app/main.go .
# RUN go build ./main.go

# FROM scratch
# COPY --from=build ./app/main.go ./app/main.go
# RUN chmod +x /app/main.go
# CMD ["./main.go"]

FROM golang:latest as build

WORKDIR /app
COPY app/main.go .
RUN go build /app/main.go

FROM scratch
WORKDIR /app
COPY --from=build /app/main .
CMD ["/app/main"]