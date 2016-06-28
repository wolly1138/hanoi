#! /bin/bash

move=0

#参数包含：塔层数，源节点，经过节点，目标节点
dohanoi()
{
	if [ $1 -eq 0 ]
	then
		echo -n ""
	else
#将n-1层塔从源节点搬移至经过节点（利用目标节点）
		dohanoi "$(($1-1))" $2 $4 $3
#将最底层塔从源节点搬移至目标节点
		echo "move $2 ----> $4"
		let "move = move + 1"
#将n-1层塔从经过节点搬移至目标节点（利用源节点）
		dohanoi "$(($1-1))" $3 $2 $4  
	fi
}

echo "Please input the num of disk:"

read num

dohanoi $num 'A' 'B' 'C' 

echo ""

echo "Total moves = $move"