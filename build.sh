#!/bin/sh
cd /www
ls -lA .
echo 'Iniciando instalação do Martini'
date
go get github.com/go-martini/martini
echo 'Removendo executável anterior'
rm -rf martini-debian-64 2> /dev/null
echo 'Iniciando compilação e linkedição do executável'
go build -a -installsuffix cgo -o martini-debian-64 .
date
echo 'Verificando executável gerado'
ls -lA martini-debian-64
echo 'Agora podemos usar este executável num ambiente Linux básico'
echo 'tal como o BusyBox (busybox:ubuntu-14.04) que ocupa menos de'
echo '6 Megabytes.'
echo 'Seu site deve ficar no diretório public ao lado do executável'
echo 'martini-debian-64'
