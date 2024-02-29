echo Executando...

data_sistema=$(date +%Y%m%d)
hora_sistema=$(date +%H%M%S)

# Criar diretorios e copiar arquivos 
mkdir -p vendas/backup
cp ./dados_de_vendas.csv vendas/"dados-$data_sistema.csv"
cp ./dados_de_vendas.csv vendas/backup/"backup-dados-$data_sistema.csv"


# Inserir Data atual
echo Registros de venda [ $(date +%Y/%m/%d\ %H:%M) ] >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

echo >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

# Inserir Data Primeiro e Ultimo Registro
echo Data Primeiro Registro: $(sed -n '2p' ./dados_de_vendas.csv | cut -d "," -f 5) \ >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt 
echo Data Ultimo Registro: $(tail -n 1 ./dados_de_vendas.csv | cut -d "," -f 5) >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

# Inserir Total de Itens
# echo "Total Itens: $(($(wc -l < dados_de_vendas.csv)-1))" >> ./vendas/backup/relatorio.txt
# Retornar a quantidade de itens sem as linhas "id,produto,quantidade,preço,data"
total_linhas=$(wc -l < dados_de_vendas.csv)
total_items=0

for ((i=1; i<=$total_linhas; i+=1))
do
 linha=$(sed -n "$i"p ./dados_de_vendas.csv)
[[ $linha != "id,produto,quantidade,preço,data" ]] && ((total_items++))
done

echo "Total Itens: $total_items" >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

echo >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

# Inserir 10 Primeiros Registros
head -n 10 ./vendas/backup/"backup-dados-$(date +%Y%m%d).csv" >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

# Comprimir arquivo
zip -r vendas/backup/"backup-dados-$(date +%Y%m%d).zip" vendas/backup/"backup-dados-$(date +%Y%m%d).csv"
rm vendas/backup/"backup-dados-$(date +%Y%m%d).csv"
rm vendas/"dados-$(date +%Y%m%d).csv"

echo $(pwd) >> ./vendas/backup/relatorio-$data_sistema-$hora_sistema.txt

echo Fim do Script.
