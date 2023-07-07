#!/bin/bash

# https://hub.docker.com/r/kylemanna/openvpn/

function random_id {
    printf "%X\n" "$(shuf -i $((16#100000))-$((16#FFFFFF)) -n 1)"
}

function host_ip {
    printf "%s\n" "$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)"
}

OP=${OP:-""}
ID=${ID:-"$(random_id)"}
OVPN_DATA=${OVPN_DATA:-"ovpn-data-$ID"}

function op_up {
    docker volume create --name $OVPN_DATA
}

function op_down {
    docker volume rm --name $OVPN_DATA
}

if [[ $OP == "up" ]]; then
    op_up
else if [[ $OP == "down" ]]; then
    op_down
fi

echo $ID