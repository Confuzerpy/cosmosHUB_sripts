#!/bin/bash
VALIDATOR="tkivaloper..."
DELEGATOR="tki1...."
NODE_HOME="kid home"
PASSWORD="wallet password"
kichain_wallet_name="wallet name"
network="kichain-t-4"

while true
do
    current_date=$(date) # get current date
    echo $current_date
    echo $PASSWORD | kid tx distribution withdraw-rewards $VALIDATOR --chain-id=$network --gas-prices 0.025utki --from=$kichain_wallet_name --home $NODE_HOME --yes

    sleep 120s

    balance=$(kid query bank balances $DELEGATOR -o json| jq ".balances[].amount | tonumber")
    stake_to_delegate="$(($balance - 5000000))" # leaving 5000000 on the balance

    echo $PASSWORD | kid tx staking delegate $VALIDATOR ${stake_to_delegate}utki --chain-id=$network --fees 0.008tki --from=$kichain_wallet_name --home $NODE_HOME --yes
    sleep 3h 
done
