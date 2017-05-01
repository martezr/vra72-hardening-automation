#!/bin/bash
# Set host variable as the system hostname
host=$(hostname)
header="{ \"host\": \"$host\", \"checks\": ["
checks=""

checknumber="011"
checkdescription="Use IPv4 TCP Syncookies"

cat /proc/sys/net/ipv4/tcp_syncookies | grep -v 1 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

checknumber="012"
checkdescription="Deny IPv6 Router Advertisements"

grep [01] /proc/sys/net/ipv6/conf/*/accept_ra|egrep "default|all" | grep -v 0  > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

checknumber="013"
checkdescription="Deny IPv6 Router Solicitations"

grep [01] /proc/sys/net/ipv6/conf/*/router_solicitations|egrep "default|all" | grep -v 0 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

checknumber="014"
checkdescription="Deny IPv6 Router Preference in Router Solicitations"

grep [01] /proc/sys/net/ipv6/conf/*/accept_ra_rtr_pref|egrep "default|all" | grep -v 0 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

checknumber="015"
checkdescription="Deny IPv6 Router Prefix"

grep [01] /proc/sys/net/ipv6/conf/*/accept_ra_pinfo|egrep "default|all" | grep -v 0 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

checknumber="016"
checkdescription="Deny IPv6 Router Advertisement Hop Limit Settings"

grep [01] /proc/sys/net/ipv6/conf/*/accept_ra_defrtr|egrep "default|all" | grep -v 0 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi


checknumber="017"
checkdescription="Deny IPv6 Router Advertisement Autoconf Settings"

grep [01] /proc/sys/net/ipv6/conf/*/autoconf|egrep "default|all" | grep -v 0 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

checknumber="018"
checkdescription="Deny IPv6 Neighbor Solicitations"

grep [01] /proc/sys/net/ipv6/conf/*/dad_transmits|egrep "default|all" | grep -v 0 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

# Max Addresses
checknumber="019"
checkdescription="Restrict IPv6 Max Addresses"

grep [1] /proc/sys/net/ipv6/conf/*/max_addresses|egrep "default|all" | grep -v 1 > /dev/null 2>&1

if [ $? -eq 1 ]; then
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"pass\"},"
  checks="$checks $check"

else
  check="{\"check\": \"$checknumber\",\"check_description\": \"$checkdescription\",\"status\": \"fail\"},"
  checks="$checks $check"

fi

echo "{ \"host\": \"$host\", \"checks\": [${checks%?}] }"
