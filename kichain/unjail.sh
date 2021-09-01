#!/bin/bash

WALLET_PASS="YOUR_PASSWORD_HERE"
NETWORK=kichain-t-3
HOME_DIR="YOUR KID HOME PATH"
kichain_wallet_name="YOUR KICHAIN WALLET"


echo 'Listening:'
while true; do
current_date=$(date)
POWER=$(kid status 2>&1 | jq '.ValidatorInfo.VotingPower | tonumber') # getting our voting power and convert str to int

echo $current_date  'WE HAVE POWER' $POWER

if [ $POWER = 0 ]; then # if power == 0 then we jailed
    current_date=$(date) #overriding datetime
    echo $current_date 'UNJAILING' 
    echo -e "$WALLET_PASS\n" | kid tx slashing unjail --chain-id=$NETWORK --from=$kichain_wallet_name --gas=auto --yes --home $HOME_DIR

fi
sleep 15 # repeating every 15 sec
done

