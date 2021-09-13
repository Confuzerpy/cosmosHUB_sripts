from subprocess import Popen, PIPE
from random import choice, randint
from time import sleep
PATH = 'transfer'             # replace with your path
IBC0 = 'kichain-t-4'          # source chain
IBC1 = 'testnet-croeseid-4'   # destination chain
COMMAND = (f"rly tx transfer {IBC0} {IBC1} amountutki "
           f"$(rly chains address {IBC1}) --path {PATH}",
           f"rly tx transfer {IBC1} {IBC0} amountbasetcro "
           f"$(rly chains address {IBC0}) --path {PATH}")


def main():
    """Randomly generate transctions and send them through ibc
    using Popen module"""
    while True:
        try:
            AMOUNT = randint(1000, 9999)  # randomly generates amount to send
            path = choice(COMMAND).replace('amount', f"{AMOUNT}")  # randm path
            result = Popen(path, stdout=PIPE, shell=True).communicate()[0]
            print(f"{result}")
            sleep(60)
        except Exception as err:
            print(err.message)


if __name__ == '__main__':
        main()
