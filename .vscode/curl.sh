#!/bin/sh

declare -A servers
servers[localhost]="127.0.0.1"

if ["${servers[$1]}" = ""]
then
    echo -e "\033[0;31mNO IP ASSOCIATED WITH $1 - EXITING\033[0m"
    exit 2;
fi 

baseUrl="https://${servers[$1]}/redfish/v1"

# Restart computer
# curl "${baseUrl}/Systems/System.Embedded.1/Actions/ComputerSystem.Reset" -X POST -d '{"ResetType": "GracefulRestart"}' -H "Content-Type: application/json"  -k -L | python -mjson.tool

#url="${baseUrl}/Managers/iDRAC.Embedded.1/Actions/Oem/EID_674_Manager.ImportSystemConfiguration"
# url="${baseUrl}/Managers/iDRAC.Embedded.1/EthernetInterfaces/iDRAC.Embedded.1%23NIC.1"
# url="${baseUrl}/Systems/System.Embedded.1/EthernetInterfaces/NIC.Embedded.1-1-1"
url="${baseUrl}/Systems/System.Embedded.1"

# echo $url
# payload=`cat ./tmp/body.json`
# echo -e "-- POST/PATCH --\nPayload : \033[0;33m$payload\n"; curl "${url}" -svkLu root:password \
# -X PATCH -d "$payload" -H "Content-Type: application/json" #| python -mjson.tool;echo "\033[0m"

echo -e "-- GET -- \033[0;33m"; curl "$url" -skLu root:password | python -mjson.tool; echo -e "\033[0m"