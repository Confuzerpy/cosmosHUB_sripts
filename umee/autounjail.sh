#!/bin/bash
WALLET_PASS="password"
NETWORK="umee-betanet-2"
#HOME_DIR="YOUR umeed HOME PATH"
wallet="umee1...."

# If you consistently getting jailed
# then apparently you have a problem and
# this script won't solve this problem for you."
# First, try to figure out where the problem is(hardware, network, stake, ports etc)

echo 'Listening:'
while true; do
current_date=$(date)
POWER=$(umeed status 2>&1 | jq '.ValidatorInfo.VotingPower | tonumber') # getting our voting power and convert str to int

echo $current_date  'Voting power -> ' $POWER

if [ $POWER = 0 ]; then # if power == 0 then we jailed
    current_date=$(date) # overriding datetime
    echo $current_date 'UNJAILING' 
    echo -e "$WALLET_PASS\n" | umeed tx slashing unjail --chain-id=$NETWORK --from=$wallet --gas=auto --yes

fi
sleep 15 # repeating every 15 sec
done