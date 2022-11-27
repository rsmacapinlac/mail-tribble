FROM alpine:latest

LABEL maintainer="ritchie@macapinlac.com"

# RUN apk add openssl openssl-dev make lua5.3 lua-dev pcre pcre-dev alpine-sdk

RUN apk add --update git lua-dev gcc make openssl-dev pcre2-dev g++
RUN apk add --update curl vim

WORKDIR /root

RUN git clone https://github.com/lefcha/imapfilter.git
WORKDIR /root/imapfilter

RUN make all
RUN make install

#RUN wget https://github.com/lefcha/imapfilter/archive/master.zip
#RUN unzip master.zip
#RUN cd imapfilter-master
#RUN make && make install

RUN apk add rcm

RUN mkdir -p /dotfiles

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
