#Conexão terminal Linux
#Execute no Terminal o comando abaixo para entrar no MySQL 
#/usr/bin/mysql -u root -p

#Dentro do MySQL Execute o que segue:
SET GLOBAL local_infile = true;

#Com o comando abaixo saia do MySQL
exit;

# Conecte novamente, agora inserido o novo comando
#/usr/bin/mysql --local-infile=1 -u root -p

#Etapa de Carregamento de Dados.
#O comando abaixo tem de ser realizado para cada "nomearquivo".
#E essa massa de dados será carregada em sua respectiva "nometabela".

LOAD DATA LOCAL INFILE '/home/nomeUsuario/nomeDiretorio/nomearquivo.csv'
INTO TABLE `nomeSchema`.`nomeTabela` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
