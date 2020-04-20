FROM alpine:latest as build-stage

ENV GOPATH /go

RUN apk add --no-cache --virtual=build-dependencies go git
RUN go get github.com/kahing/goofys && go install github.com/kahing/goofys

FROM alpine:latest

RUN apk add --no-cache nginx

COPY --from=build-stage /go/bin/goofys /usr/local/bin

RUN mkdir /run/nginx
COPY default.conf /etc/nginx/conf.d
COPY cors_support /etc/nginx/
COPY entrypoint.sh .

RUN chmod a+x entrypoint.sh

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["./entrypoint.sh"]
