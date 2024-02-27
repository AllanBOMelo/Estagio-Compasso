echo Executando...

mkdir -p vendas/backup
cp ./dados_de_vendas.csv vendas/"dados-$(date +%Y%m%d).csv"
cp ./dados_de_vendas.csv vendas/backup/"backup-dados-$(date +%Y%m%d).csv"

#date +%Y/%m/%d\ %H:%M >> relatorio.txt
#head -n 2 ./dados_de_vendas.csv | cut -d "," -f 5 >> relatorio.txt
#sed -n '2p' ./dados_de_vendas.csv | cut -d "," -f 5 >> relatorio.txt
echo Registros de venda [ $(date +%Y/%m/%d\ %H:%M) ] >> ./vendas/backup/relatorio.txt
echo Data Primeiro Registro: $(sed -n '2p' ./dados_de_vendas.csv | cut -d "," -f 5) >> ./vendas/backup/relatorio.txt 
echo Data Ultimo Registro: $(tail -n 1 ./dados_de_vendas.csv | cut -d "," -f 5) >> ./vendas/backup/relatorio.txt

#wc -l < dados_de_vendas.csv
echo "Total Itens: $(($(wc -l < dados_de_vendas.csv)-1))" >> ./vendas/backup/relatorio.txt

echo Fim do Script.
