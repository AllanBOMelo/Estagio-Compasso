echo Executando...

# Criar diretorios e copiar arquivos 
mkdir -p vendas/backup
cp ./dados_de_vendas.csv vendas/"dados-$(date +%Y%m%d).csv"
cp ./dados_de_vendas.csv vendas/backup/"backup-dados-$(date +%Y%m%d).csv"


# Inserir Data atual
echo Registros de venda [ $(date +%Y/%m/%d\ %H:%M) ] >> ./vendas/backup/relatorio.txt

echo >> ./vendas/backup/relatorio.txt

# Inserir Data Primeiro e Ultimo Registro
echo Data Primeiro Registro: $(sed -n '2p' ./dados_de_vendas.csv | cut -d "," -f 5) \ >> ./vendas/backup/relatorio.txt 
echo Data Ultimo Registro: $(tail -n 1 ./dados_de_vendas.csv | cut -d "," -f 5) >> ./vendas/backup/relatorio.txt

# Inserir Total de Itens
echo "Total Itens: $(($(wc -l < dados_de_vendas.csv)-1))" >> ./vendas/backup/relatorio.txt

echo >> ./vendas/backup/relatorio.txt

# Inserir 10 Primeiros Registros
head -n 10 ./vendas/backup/"backup-dados-$(date +%Y%m%d).csv" >> ./vendas/backup/relatorio.txt

zip -r vendas/backup/"backup-dados-$(date +%Y%m%d).zip" vendas/backup/"backup-dados-$(date +%Y%m%d).csv"
rm vendas/backup/"backup-dados-$(date +%Y%m%d).csv"
rm vendas/"dados-$(date +%Y%m%d).csv"

echo Fim do Script.
