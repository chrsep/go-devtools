FROM golang:1.19

ENV GO111MODULE=on
#ENV CGO_ENABLED=0

RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/cosmtrek/air@latest
COPY ./.air.conf .

EXPOSE 8080 40000
CMD ["air"]
