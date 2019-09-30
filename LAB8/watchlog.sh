#!/bin/bash

WORD=$1
LOG=$2
DATE=`date`

if grep $WORD $LOG
then
	logger "$DATE: I found KEYWORD: >>> $WORD <<< !"
else
	exit 0
fi
