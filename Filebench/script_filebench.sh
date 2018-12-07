#!/bin/bash
#Autor: Carlos Alberto Franco Maron
#Última Atualização: 16/01/2015
#Resumo: Script executa os kernels que simulam aplicações corporativas do benchmark FileBench.

DIR="/home/wcp/filebench-1.4.9.1/workloads/"
LOG="/home/wcp/logs/"

array=( "fileserver" "varmail" "webserver" )

fileserver()
{
#for((CONT=1;CONT<3;CONT++))
#do

	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> $LOG/fileserver.log
	echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> $LOG/fileserver.log
	echo "Fileserver"
	echo $CONT
	swapoff -a; swapon -a
	filebench -f $DIR/fileserver.f >> $LOG/fileserver.log
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> $LOG/fileserver.log
	echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> $LOG/fileserver.log
#sleep 1
#done
}

varmail()
{
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> $LOG/varmail.log
        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> $LOG/varmail.log
        echo "Varmail"
        echo $CONT
	swapoff -a; swapon -a
        filebench -f $DIR/varmail.f >> $LOG/varmail.log
        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> $LOG/varmail.log
        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> $LOG/varmail.log

}

webserver()
{
	echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> $LOG/webserver.log
        echo Start in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> $LOG/webserver.log
        echo "WebServer"
        echo $CONT
	swapoff -a; swapon -a
        filebench -f $DIR/webserver.f >> $LOG/webserver.log
        echo "-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-" >> $LOG/webserver.log
        echo Finish in `date +%H:%M:%S--%d/%m/%Y` 2>&1>> $LOG/webserver.log

}

for((CONT=1;CONT<41;CONT++))
do
	for((i=0;i<${#array[@]};i++))
	do
		${array[$i]}
		echo "============================================"
		echo "#############################################"
		echo "#		   END ${array[$i]}               "
		echo "#############################################"	
		echo "============================================"
	sleep 1;
	done
sleep 1
done

