#!/bin/bash

#В полученном на предыдущем шаге файле после каждой группы записей с одинаковым идентификатором родительского процесса вставить строку вида Average_Sleeping_Children_of_ParentID=N is M, где N = PPID, а M – среднее, посчитанное из SleepAVG для данного процесса.

in="input.txt"
out_v="output_v.txt"
cp $out_v $in
awk -F'[:=]' 'BEGIN {prev=-1; sum=0; amount=1} 
{
	if ($4 != prev)
		{
			if (prev != -1)
				{
					print "Average_Sleeping_Children_of_ParentID="prev"is "sum/amount;
				}
			prev=$4;
			sum=0;
			amount=0;
		}
	print $0;
	sum+=$6;
	amount+=1;
} 
END {print "Average_Sleeping_Children_of_ParentID="prev"is "sum/amount}' $in > $out_v
rm $in
