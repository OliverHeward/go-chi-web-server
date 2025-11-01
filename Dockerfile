From golang:alpine as builder

RUN go install github.com/air-verse/air@latest

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main ./cmd/server

EXPOSE 8080

CMD ["air", "-c", ".air.toml"]