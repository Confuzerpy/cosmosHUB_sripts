## keplr wallet integrity
[keplr wallet](https://chrome.google.com/webstore/detail/keplr/dmkamcknogkgcdfhhbddcghachkejeap)
## Tested: Brave browser, Opera

## Requirements: keplr wallet extension

## Instruction:
1. Opening your browsers JavaScript console

Firefox: Menu Bar > Tools > Web Developer > Web Console

Chromium based browsers: View> Developer>Developer Tools(ctrl-shift-j)

2. Copy and paste the code:

```
await window.keplr.experimentalSuggestChain({
    chainId: "kichain-t-3",
    chainName: "kichain-t-3",
    rpc: "https://rpc-challenge.blockchain.ki:443",
    rest: "https://api-challenge.blockchain.ki",
    bip44: {
        coinType: 118,
    },
    bech32Config: {
        bech32PrefixAccAddr: "tki",
        bech32PrefixAccPub: "tki" + "pub",
        bech32PrefixValAddr: "tki" + "valoper",
        bech32PrefixValPub: "tki" + "valoperpub",
        bech32PrefixConsAddr: "tki" + "valcons",
        bech32PrefixConsPub: "tki" + "valconspub",
    },
    currencies: [ 
        { 
            coinDenom: "TKI", 
            coinMinimalDenom: "utki", 
            coinDecimals: 6, 
            coinGeckoId: "tki", 
        }, 
    ],
    feeCurrencies: [
        {
            coinDenom: "TKI",
            coinMinimalDenom: "utki",
            coinDecimals: 6,
            coinGeckoId: "tki",
        },
    ],
    stakeCurrency: {
        coinDenom: "TKI",
        coinMinimalDenom: "utki",
        coinDecimals: 6,
        coinGeckoId: "tki",
    },
    coinType: 118,
    gasPriceStep: {
        low: 0.01,
        average: 0.025,
        high: 0.03,
    },
});
 ```



