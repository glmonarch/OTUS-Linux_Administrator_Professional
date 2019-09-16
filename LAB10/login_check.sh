#!/bin/bash

# Compare $PAM_USER with permited users:
if grep -w $PAM_USER /usr/local/etc/pam_permited_users.txt
then
	exit 0
else
# Compare current week day with Saturday & Sunday:
	if [ $(date +%a) = "Sat" ]
	then
		exit 1
	elif [ $(date +%a) = "Sun" ]
	then
		exit 1
	else
		exit 0

	fi
fi
