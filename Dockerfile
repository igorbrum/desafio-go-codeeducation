FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY ./src .

RUN go build -ldflags='-s -w' -o /usr/src/app main.go
RUN rm main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

CMD [ "./main" ]