# UniswapV2-Puzzles by [RareSkills](https://www.rareskills.io)

## How to play

- Git clone the Repo

- Install dependencies
    ```shell
    $ forge install
    ```
- Start hacking.

## Run test

The test forks mainnet so as to interact with contracts on a real network and also give a more realistic experience. Go to [Alchemy](https://alchemy.com) or [infura](https:/infura.io) 
to get `your_mainnet_rpc_url`.
```shell
$ forge test --fork-url <your_mainnet_rpc_url> --match-path test/<test_filename> -vvv
```

#### Test Your RPC with HelloWorld Puzzle

Run the following command:
```shell
$ forge test --fork-url <your_mainnet_rpc_url> --match-path test/HelloWorld.t.sol -vvv
```
If the test passes, RPC is working, else, it might have exceeded its rate limit or typo in the url.

## Suggested order for the puzzles

- [HelloWorld](https://github.com/tanim0la/uniswapV2-puzzles/blob/main/src/HelloWorld.sol)
- [AddLiquid](https://github.com/tanim0la/uniswapV2-puzzles/blob/main/src/AddLiquid.sol)
- [AddLiquidWithRouter](https://github.com/tanim0la/uniswapV2-puzzles/blob/main/src/AddLiquidWithRouter.sol)
- [SimpleSwap](https://github.com/tanim0la/uniswapV2-puzzles/blob/main/src/SimpleSwap.sol)
- [SandwichSwap](https://github.com/tanim0la/uniswapV2-puzzles/blob/main/src/SandwichSwap.sol)
- [MyMevBot](https://github.com/tanim0la/uniswapV2-puzzles/blob/main/src/MyMevBot.sol)