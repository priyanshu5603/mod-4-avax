# ERC20 Token Contract

This Solidity smart contract is an implementation of the ERC20 standard for a token. It provides the basic functionalities of a token, including minting, burning, transferring, and allowing users to redeem prizes based on their token balance.

## Features

- Minting: The contract owner can mint new tokens and assign them to specific accounts.
- Burning: Users can burn their own tokens, reducing the total supply.
- Transferring: Users can transfer tokens to other accounts.
- Prize Redemption: Users can redeem prizes based on their token balance.

## Prizes

The contract allows users to redeem the following prizes:
1. Diary
2. T-Shirt
3. Bag
4. DOGECOIN

## How to Use

You can interact with this contract by deploying it on an Ethereum blockchain. The contract owner can perform actions like minting new tokens, while regular users can transfer tokens and redeem prizes.

## Contract Functions

- `mint`: Mint new tokens to an account.
- `burn`: Burn tokens to reduce the total supply.
- `approve`: Approve a spender to spend tokens on your behalf.
- `transfer`: Transfer tokens to another account.
- `redeem`: Redeem a prize based on your token balance.
- `transferFrom`: Transfer tokens from one account to another when an allowance is given.
- `allowance`: Get the allowance of a spender.
- `balanceOf`: Get the token balance of an account.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
