FROM golang:1.19

ENV GO111MODULE=on
#ENV CGO_ENABLED=0

RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get -u github.com/cosmtrek/air
COPY ./.air.conf .

EXPOSE 8080 40000
CMD ["air"]
