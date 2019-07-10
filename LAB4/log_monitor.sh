#!/usr/bin/env bash

# Start function log_parser
function log_parser {

# Determine path to nginx_log
path_to_log=$(find / -name nginx_log)

if [ -f number_of_strings.txt ]
then

# Read number of last string after previous run
NoS=$(cat number_of_strings.txt)

else

# Reset $NoS variable before first run
NoS=0

fi

printf "%s\n"
printf "%s" "Generating report of TOP clients IP since the last run..."
tail -n +$NoS $path_to_log | awk '{print $1}' | sort -n | uniq -c | sort -rn | head -n 10 > top_ip.log
printf "%s\n" "Ok."

printf "%s" "Generating report of TOP requested URLs since the last run..."
tail -n +$NoS $path_to_log | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 10 > top_urls.log
printf "%s\n" "Ok."

printf "%s" "Generating report of Error Codes since the last run..."
tail -n +$NoS $path_to_log | awk '{print $9}' | sort -n | awk '/[4-5][0-9][0-9]/{print $0}' | uniq -c > errors.log
printf "%s\n" "Ok."

printf "%s" "Generating report of all server codes since the last run..."
tail -n +$NoS $path_to_log | awk '{print $9}' | sort -n | uniq -c > all_codes.log
printf "%s\n" "Ok."

# Calc and store the number of strings of nginx_log
cat $path_to_log | wc -l > number_of_strings.txt

# Archive all reports to one file
printf "%s" "Creating archive with reports..."
tar -cf reports.tar top_ip.log top_urls.log errors.log all_codes.log
printf "%s\n" "Ok."

# Find FROM time of script
FROM_TIME=$(grep log_monitor.sh /var/log/cron | awk '{print $3}' | tail -n 2 | awk 'BEGIN {print "FROM"} NR==1 {print $1}')

# Find TILL time of script
TILL_TIME=$(grep log_monitor.sh /var/log/cron | awk '{print $3}' | tail -n 2 | awk 'BEGIN {print "FROM"} NR==2 {print $1}')

# Sending reports to e-mail
printf "%s\n" "Sending reports to e-mail..."
echo "FROM_TIME:$FROM_TIME     TILL_TIME:$TILL_TIME" | mail -s "Report of script" -a reports.tar user@example.com &&
printf "%s\n" "Ok. E-mail sent." ||
printf "%s\n" "Error sending reports to e-mail!"

# Finish function log_parser
}

#### Prevent multi run ###
str=$(ps ax | grep log_monitor.sh | grep bash | grep -v "grep")

if [ -z "$str" ]i
then
      	echo "Ok! Starting the script..."
	log_parser
else
        echo "Failed. The script already running.."
fi
