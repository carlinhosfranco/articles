#!/bin/bash
#Autor: Carlos Alberto Franco Maron
#Última atualização: 02/06/2014
#Resumo: Script usado para coletar os resultados dos logs das execuções dos seguintes benchmarks: IOzone, stream, iperf, linpack

echo " "
echo " "
echo "### IOzone ###"

# Exclui informaçõa desnecessária
sed -i 's/File size set to 524288 KB/ /g' iozone.log

#Coleta os dados
echo "    write rewrite    read    reread" >> filter_iozone | grep "524288" iozone.log >> filter_iozone

#Exclui informação desnecessária
sed -i 's/          524288       4/ /g' filter_iozone

echo "done! ;)"
echo " "
echo " "

echo "### IPerf ###"

#Coleta os dados
echo "[ ID] Interval       Transfer     Bandwidth" >> filter_iperf; grep "Mbits/sec" iperf.log >> filter_iperf

#Deixa bonitinho a fulia
sed -i 's/ sec//g' filter_iperf

echo "done! ;)"
echo " "
echo " "

echo "### Stream ### "

echo "Copy" >> filter_stream; grep "Copy:" stream.log | awk -F" " '{ print $2 }' >> filter_stream; echo " " >> filter_stream; echo " " >> filter_stream; echo "Scale" >> filter_stream; grep "Scale:" stream.log | awk -F" " '{ print $2 }' >> filter_stream; echo " " >> filter_stream; echo " " >> filter_stream; echo "Add" >> filter_stream; grep "Add:" stream.log | awk -F" " '{ print $2 }' >> filter_stream;  echo " " >> filter_stream; echo " " >> filter_stream; echo "Triad" >> filter_stream; grep "Triad:" stream.log | awk -F" " '{ print $2 }' >> filter_stream; echo " " >> filter_stream; echo " " >> filter_stream

echo "done! ;)"
echo " "
echo " "

echo "### Linpack ###"

#Coleta dados
echo KFLOPS > filter_linpack; grep "       1" linpack.log  | awk  -F" " '{ print $6 }' > filter_linpack 

echo "done! ;)"
echo " "
echo " "
