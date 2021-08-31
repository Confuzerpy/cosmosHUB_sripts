#!/bin/bash
VALIDATOR="tkivaloper..."
DELEGATOR="tki1...."
NODE_HOME="kid home"
PASSWORD="wallet password"
kichain_wallet_name="wallet name"

while true
do
    current_date=$(date) # get current date
    echo $current_date
    echo $PASSWORD | kicli tx distribution withdraw-rewards $VALIDATOR --chain-id=kichain-t-2 --gas-prices 0.025utki --from=$kichain_wallet_name --home $NODE_HOME --commission --yes -o json

    sleep 120s

    balance=$(kicli query account $DELEGATOR --chain-id=kichain-t-2 --home $NODE_HOME -o json | jq '.value.coins[].amount | tonumber')
    stake_to_delegate="$(($balance - 5000000))" # leaving 5000000 on the balance

    echo $PASSWORD | kicli tx staking delegate $VALIDATOR ${stake_to_delegate}utki --chain-id=kichain-t-2 --fees 5utki --from=$kichain_wallet_name --home $NODE_HOME --yes -o json
    sleep 3h 
done
