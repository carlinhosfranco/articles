#!/bin/bash
#Script para executar aplicações do PARSEC
#Autor: Carlos Alberto Franco Maron
#Última atualização: 22/10/15 - Carlos

INPUT=native
#THREADS=1

for (( THREADS=1; THREADS < 9; THREADS++ )) do
	for ((i=1; i<11; i++)) do

		echo " " >> /mount/logs/parsec/dedup_$THREADS.log
		echo " " >> /mount/logs/parsec/dedup_$THREADS.log
		echo "-------Dedup------" >> /mount/logs/parsec/dedup_$THREADS.log
		parsecmgmt -a run -p dedup -i $INPUT -n $THREADS >> /mount/logs/parsec/dedup_$THREADS.log
		echo "-------E N D ------" >> /mount/logs/parsec/dedup_$THREADS.log

		echo " " >> /mount/logs/parsec/bodytrack_$THREADS.log
		echo " " >> /mount/logs/parsec/bodytrack_$THREADS.log
		echo "-------Bodytrack------" >> /mount/logs/parsec/bodytrack_$THREADS.log
		parsecmgmt -a run -p bodytrack -i $INPUT -n $THREADS >> /mount/logs/parsec/bodytrack_$THREADS.log
		echo "-------E N D ------" >> /mount/logs/parsec/bodytrack_$THREADS.log

		echo " " >> /mount/logs/parsec/ferret_$THREADS.log
		echo " " >> /mount/logs/parsec/ferret_$THREADS.log
		echo "-------Ferret------" >> /mount/logs/parsec/ferret_$THREADS.log
		parsecmgmt -a run -p ferret -i $INPUT -n $THREADS >> /mount/logs/parsec/ferret_$THREADS.log
		echo "-------E N D ------" >> /mount/logs/parsec/ferret_$THREADS.log

		echo "Thread: $THREADS" >> /mount/logs/parsec/exec.log
		echo " " >> /mount/logs/parsec/exec.log
		echo "Cont: $i " >> /mount/logs/parsec/exec.log

	done
done
