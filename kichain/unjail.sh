#!/bin/bash

WALLET_PASS="YOUR_PASSWORD_HERE"
echo 'Listening:'
while true; do
current_date=$(date)
POWER=$(kicli status | jq -r '.[] | .voting_power' | tail -1 | sed -e 's/^"//' -e 's/"$//')

echo $current_date  'WE HAVE POWER' $POWER

if [ $POWER = 0 ]; then
    NOW=$(date)
    echo $NOW 'UNJAILING' 
    echo -e "$WALLET_PASS\n$WALLET_PASS\n" | kicli tx slashing unjail --chain-id=kichain-t-3 --home $HOME/kichain/kid --from=$kichain_wallet_name --gas=auto --yes

fi
#echo 'NEXT CHECK IN 15 SEC'
sleep 15
done

