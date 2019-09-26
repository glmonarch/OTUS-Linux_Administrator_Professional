#!/bin/bash

WORD=$1
LOG=$2
DATE=`date`

if grep $WORD $LOG
then
	logger "$DATE: I found KEYWORD!"
else
	exit 0
fi
