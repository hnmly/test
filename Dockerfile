FROM golang:1.22 AS builder

WORKDIR /app
COPY . .
RUN go build -o app main.go

FROM alpine
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]

