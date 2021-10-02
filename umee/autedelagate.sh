#!/bin/bash
VALIDATOR="umeevaloper..."
DELEGATOR="umee1..."
PASSWORD="wallet password"
KEYRING="test" # NOTE keyring test isn't require password. os|test|file Use 'os' instead. Be carefull! 
wallet_name="wallet name" # umeed keys list --keyring-backend test
network="umee-betanet-2" 

while true
do
    current_date=$(date) # get current date
    echo $current_date
    umeed tx distribution withdraw-all-rewards --from=$wallet_name --fees=333uumee --chain-id=$UMEE_CHAIN --keyring-backend=$KEYRING -y

    sleep 30s

    balance=$(umeed query bank balances $DELEGATOR -o json| jq ".balances[].amount | tonumber")
    stake_to_delegate="$(($balance - 1000000))" # leaving 5000000 on the balance
    umeed tx staking delegate $VALIDATOR ${stake_to_delegate}uumee --chain-id=$network --fees=333uumee --from=$wallet_name --keyring-backend=$KEYRING --yes
    sleep 1h 
done
