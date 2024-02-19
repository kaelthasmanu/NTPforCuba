#!/bin/bash

# Proxy settings(Change for your enviroment )
proxy_user="myuser"
proxy_pass="mypassword"
proxy_host="192.168.1.2"
proxy_port="3128"

# Gets the time from Google and processes it through the proxy
new_time=$(curl -x "http://$proxy_user:$proxy_pass@$proxy_host:$proxy_port" -H 'Accept-Language: en-US,en;q=0.9,it;q=0.8' -H'Cache-Control:no-cache' -sI google.com | grep '^Date:' | cut -d' ' -f3-6 | sed 's/,//g' | xargs -I{} date -d '{} GMT')

# Extract parts of date string
dow=$(echo $new_time | awk '{print $1}') # Weekday
day=$(echo $new_time | awk '{print $2}') # Day of the month
month=$(echo $new_time | awk '{print $3}') # Month
year=$(echo $new_time | awk '{print $4}') # Year
time=$(echo $new_time | awk '{print $5}') # Hour
ampm=$(echo $new_time | awk '{print $6}') # AM/PM
timezone=$(echo $new_time | awk '{print $7}') # Time Zone

#Check format Time 
re='^[0-9]+$'
if [[ $day =~ $re ]] ; then
    # Convert the name of the month to its corresponding number
    case $month in
        jan) month=01;;
        feb) month=02;;
        mar) month=03;;
        apr) month=04;;
        may) month=05;;
        jun) month=06;;
        jul) month=07;;
        aug) month=08;;
        sep) month=09;;
        oct) month=10;;
        nov) month=11;;
        dec) month=12;;
    esac

    # Convert time to 24 hour format if PM
    if [ "$ampm" = "PM" ]; then
        time=$(date -d "$time" +"%H:%M:%S")
    fi

    # Format the date and time in the desired format (YYYY-MM-DD HH:MM:SS)
    fecha_convertida="$year-$month-$day $(date -d "$time" +"%H:%M:%S")"
    
    # Set the new system time
    timedatectl set-time $fecha_convertida

elif [[ $month =~ $re ]] ; then
    month=$(echo $new_time | awk '{print $2}') # Month
    time=$(echo $new_time | awk '{print $4}') # Hour
    year=$(echo $new_time | awk '{print $6}') # Year
    day=$(echo $new_time | awk '{print $3}') # Day of the Month
    case $month in
        Jan) month=01;;
        Feb) month=02;;
        Mar) month=03;;
        Apr) month=04;;
        May) month=05;;
        Jun) month=06;;
        Jul) month=07;;
        Aug) month=08;;
        Sep) month=09;;
        Oct) month=10;;
        Nov) month=11;;
        Dec) month=12;;
    esac

    if [ "$ampm" = "PM" ]; then
        time=$(date -d "$time" +"%H:%M:%S")
    fi

    fecha_convertida="$year-$month-$day $(date -d "$time" +"%H:%M:%S")"

    timedatectl set-time $fecha_convertida
fi