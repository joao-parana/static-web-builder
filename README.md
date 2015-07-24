# static-web

#### Vou ensinar um truque pra vocês:

Veja o código abaixo:

    echo "•••• Running GO script '$1' ••••"

Use um editor como o VI, por exemplo:

    sudo vi /bin/golang-tip-to-run-as-a-shell-script 

Informe a senha de sudouser e insira este código nesta shell

Depois faça: 

    sudo chmod a+rx    /bin/golang-tip-to-run-as-a-shell-script

Teste assim: 

    golang-tip-to-run-as-a-shell-script TESTE

Com isso você poderá testar o programa **server.go** no seu host como se fosse um shell script

Rode no Terminal, para criar o executável para o Debian :

    docker build -t parana/static-web-builder . 
    docker run -v ~/Desktop/Development/static-web-builder/www:/www \
           parana/static-web-builder 

Agora criando o projeto que vai usar este executável:

    cd ~/Desktop/Development
    mkdir static-web
    cd static-web
    touch Dockerfile
    subl -a . 

Coloque o conteúdo abaixo no arquivo Dockerfile e salve.

    FROM busybox:ubuntu-14.04
    MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"
    ENV REFRESHED_AT 2015-07-24
    RUN mkdir /www
    ADD https://github.com/joao-parana/static-web-builder/raw/master/www/martini-debian-64 /www/martini-debian-64
    RUN chmod a+rx /www/martini-debian-64 && ls -lAt /www
    VOLUME ["/www/public"]
    EXPOSE 3000
    WORKDIR /www 
    ENTRYPOINT ["/www/martini-debian-64"]

Substitua os dados referentes a MAINTAINER, colocando seu nome e e-mail.

Para fazer o build para produção use outro projeto, por exemplo:

    cd ~/Desktop/Development
    cd static-web
    docker build -t parana/static-web .

Ou build e RUN com:

    docker build -t parana/static-web . 
    mkdir -p ~/Desktop/Development/static-web/www/public 
    docker run --rm \
           -v ~/Desktop/Development/static-web/www/public:/www/public \
           -p 3000:3000 \
           parana/static-web

Teste o site

    cd ~/Desktop/Development/static-web/www/public/
    echo 'Oi usuário do meu site' > index.html
    open http://$(docker-ip):3000

Crie uma conta no http://github.com gratuitamente

Crie o repositório static-web

Veja as instruções
execute:

    git init
    git add .
    git commit -m "Primeiro Commit"
    # Substitua joao-parana por seu ID no GitHub
    git remote add origin https://github.com/joao-parana/static-web.git
    git push -u origin master

Verifique na WEB o push do Dockerfile e README.md
