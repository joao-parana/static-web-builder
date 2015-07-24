FROM golang:latest 

MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"

ADD build.sh /build.sh
RUN chmod a+rx /build.sh  &&  mkdir /app  
WORKDIR /app 

VOLUME ["/www"]

ENV CGO_ENABLED   0 
ENV GOOS          linux 

CMD ["/build.sh"]

# Run this command in a Shell
# docker build -t parana/static-web-builder -f Dockerfile.DEV . 
# docker run  -v ~/Desktop/Development/projeto-golang/martini/www:/www \
#        parana/static-web-builder
