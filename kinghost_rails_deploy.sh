#!/bin/bash

#
# Script para deploy de Rails 3.2.17
# nos servidores compartilhados da Kinghost
# Desenvolvido por Gustavo Kuklinski (@tuxlinski)
# http://www.kuklinski.com.br
#
# Até o momento o Script apenas funciona caso você tenha mais de UMA aplicação
# criada pelo painel de controle!
#

clear
echo '------------------------------------------------------------------------'
echo 'Kinghost Rails 3.5 Deploy'
echo '------------------------------------------------------------------------'
echo 'Digite o PATH da sua aplicação local. Ex: /home/usuario/nome_da_app:'

# Caminho da sua aplicação local: Ex: /home/usuario/meu_rails_app
read localapp

echo 'Digite o nome da sua aplicação da Kinghost:'

# Nome da aplicação criada pelo painel de controle da Kinghost
read remoteapp

echo '------------------------------------------------------------------------'
#
# Ao acessar o SSH pela primeira vez poderá ocorrer de pedir 
# confirmação de uma chave RSA! - Digite 'yes' no terminal 
#
echo 'Entre com seus dados SSH.'
echo 'Usuário:'

# Nome de usuário SSH, o mesmo é utilizado no FTP
read sshUser

echo 'Host:'

# O nome do seu domínio. Ex: fulano.com (Sem o http:// nem www)
read sshHost

echo ''
echo 'Aguarde...'
echo 'Autencicando usuário e domínio...'
echo '------------------------------------------------------------------------'
echo 'Digite sua senha para acessar remotamente o servidor:'

# Remove a versão 2.3 do Rails instalada pelo painel de controle 
ssh $sshUser@$sshHost "
	cd apps_rails/$remoteapp; 
	rm -Rf *;
	exit;
"

echo '------------------------------------------------------------------------'
echo 'Preparando cópia dos arquivos...'
echo 'Digite sua senha para copiar os arquivos:'

# Copia seus arquivos para a pasta app_rails.
# IMPORTANTE! : 
# O nome do projeto tem que ser o mesmo do criado pelo painel de controle!
scp -r $localapp $sshUser@$sshHost:apps_rails/

echo 'Arquivos copiados.'
echo '------------------------------------------------------------------------'
echo 'Digite sua senha para realizar o Deploy da aplicação:'

# Realiza as tarefas de deploy:
# Acessa a pasta do projeto
# Instala as gems padrões do Gemfile(inclusive de terceiros!) na pasta 'ventor/bundle'
# Executa as migrações do banco de dados
# Recompila os ASSETS(arquivos CSS, Javascript e Imagens)
# Reinicia o servidor
ssh $sshUser@$sshHost "
	cd apps_rails/$remoteapp;
	bundle install --path ventor/bundle;
	bundle exec rake db:migrate RAILS_ENV='production' --trace;
	bundle exec rake assets:precompile RAILS_ENV='production' --trace
	touch tmp/restart.txt;
	exit;
"
echo '------------------------------------------------------------------------'
echo ''
echo 'Deploy realizado!'
echo ''
echo '-------------------------------------------------------------------------'
echo 'Caso ocorra algo errado, leia as mensagens e as emcaminhe para o suporte.'
echo '-------------------------------------------------------------------------'
