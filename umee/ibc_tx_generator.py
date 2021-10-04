from subprocess import Popen, PIPE
from random import choice, random, randint
from time import sleep
PATH = 'transfer'             # replace with your path
IBC0 = 'kichain-t-4'          # source chain
IBC1 = 'umee-betanet-2'       # destination chain

COMMAND = (f"rly tx transfer {IBC0} {IBC1} amountutki "
           f"$(rly chains address {IBC1}) --path {PATH}",
           f"rly tx transfer {IBC1} {IBC0} amountuumee "
           f"$(rly chains address {IBC0}) --path {PATH}"
           )


def send_tx():
    """Randomly generate transctions between and send them through ibc
    using Popen module"""
    while True:
        AMOUNT = randint(1000, 9999)
        path = choice(COMMAND).replace('amount', f"{AMOUNT}")
        result = Popen(path, stdout=PIPE, shell=True).communicate()[0]
        result = str(result).split()
        result = "[ERR] tx failed :(" if len(result) < 2 else f"[INF] {' '.join((result[2], result[~1]))}"
        print(result)
        sleep(80)


if __name__ == '__main__':
    send_tx()
