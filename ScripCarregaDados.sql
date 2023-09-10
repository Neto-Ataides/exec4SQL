# Conecte no MySQL via linha de comando
#/usr/bin/mysql -u root -p

# Execute:
SET GLOBAL local_infile = true;
#exit;

# Conecte novamente
#/usr/bin/mysql --local-infile=1 -u root -p

#Carregue os Dados com seguinte comando. O comando tem de ser realizado para cada arquivo que a será carregado em sua respectiva tabela

LOAD DATA LOCAL INFILE '/home/nomeUsuario/nomeDiretorio/arquivo.csv'
INTO TABLE `nomeSchema`.`nomeTabela` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
