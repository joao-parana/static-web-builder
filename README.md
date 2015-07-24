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

Agora criando o projeto:

    cd ~/Desktop
    mkdir static-web
    cd static-web
    touch Dockerfile
    subl -a . 

Run this command on Terminal, to build a binary for Debian :

    docker build -t parana/static-web-builder -f Dockerfile.DEV . && \
           docker run  -v ~/Desktop/Development/projeto-golang/martini/www:/www \
           parana/static-web-builder

Para fazer o build para produção:

    docker build -t parana/static-web .

Ou build e RUN com:

    docker build -t parana/static-web . && \
           docker run --rm -v ~/Desktop/Development/projeto-golang/martini/www:/www \
           -p 3030:3000 \
           parana/static-web

Crie uma conta no http://github.com gratuitamente

Crie o repositório static-web

Veja as instruções
execute:

    git init
    git add .
    git commit -m "Primeiro Commit"
    git remote add origin https://github.com/joao-parana/static-web.git
    git push -u origin master

Verifique na WEB o push do Dockerfile e README.md
