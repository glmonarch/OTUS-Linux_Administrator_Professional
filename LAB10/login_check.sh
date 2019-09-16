#!/bin/bash

# Create file with permited users:
lid -g admin | awk 'BEGIN{FS="("} {print $1}' > /etc/pam.d/pam_permited_users.txt

# Compare $PAM_USER with permited users:
if grep -w $PAM_USER /etc/pam.d/pam_permited_users.txt
then
	exit 0
else
# Compare current week day with Saturday & Sunday:
	if [ $(date +%a) = "Mon" ]
	then
		exit 1
	elif [ $(date +%a) = "Sun" ]
	then
		exit 1
	else
		exit 0

	fi
fi
