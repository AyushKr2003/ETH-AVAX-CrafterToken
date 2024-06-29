# CrafterToken

CrafterToken is an ERC20-compliant token implemented using OpenZeppelin's ERC20 contract. This token has additional functionalities for minting and burning tokens. The owner of the contract has the exclusive rights to mint new tokens.

## Contract Details

- **Token Name:** CrafterToken
- **Token Symbol:** CFT
- **Decimals:** 18 (default in ERC20)
- **Initial Supply:** 100 CFT

## Features

- **Minting:** Only the contract owner can mint new tokens.
- **Burning:** Any token holder can burn their own tokens.
- **Burning From:** Allows approved addresses to burn tokens on behalf of others.
- **Conversion Rate:** 1 ETH is equivalent to 1 CFT token during minting.
- **ERC20 Standard Functions:** Inherited from OpenZeppelin's ERC20 contract.

## Deployment

The contract is deployed on Solidity version 0.8.26.

## Functions

### Constructor

```solidity
constructor() ERC20("CrafterToken", "CFT"){
    owner = msg.sender;
    _mint(msg.sender,100 * 10**uint(decimals()));
}
```
Initializes the token with the name "CrafterToken" and the symbol "CFT". The contract owner is set to the deployer's address, and an initial supply of 100 tokens is minted to the owner.

### mint
```solidity
function mint(address _to) public payable onlyOwner
```
Mints tokens to the specified address. The number of tokens minted is equal to the amount of ETH sent in the transaction. This function can only be called by the owner. The conversion rate is 1 ETH = 1 CFT.

### burn
```solidity
function burn(uint _value) public
```
Burns the specified amount of tokens from the caller's balance.

### burnFrom
```solidity
function burnFrom(address _from, uint256 _value) public
```
Burns tokens from a specified address. The caller must have allowance for the tokens of the token owner.

### TransferToken
```solidity
function TransferToken(address _to, uint _value) public {
    _transfer(msg.sender, _to, _value);
}
```
Transfer token to another address from the caller account.

## Events
### Mint
```solidity
event Mint(address indexed to, uint value)
```
Emitted when tokens are minted.

### Burn
```solidity
event Burn(address indexed from, uint value)
```
Emitted when tokens are burned.

## Usage
### Minting Tokens
To mint tokens, the contract owner can call the mint function and send ETH along with the transaction:

```solidity
mint(address _to)
```
The number of tokens minted will be equal to the amount of ETH sent in the transaction. The conversion rate is 1 ETH = 1 CFT.

### Burning Tokens
To burn tokens from your own balance, call the burn function:

```solidity
burn(uint _value)
```
### Burning Tokens from Another Address
To burn tokens from another address (with allowance), call the burnFrom function:

```solidity
burnFrom(address _from, uint256 _value)
```
### Transferring Tokens
To transfer tokens to another address, use the transfer function:

```solidity
transfer(address recipient, uint256 amount)
```
### Approving Spenders
To approve another address to spend tokens on your behalf, use the approve function:

```solidity
approve(address spender, uint256 amount)
```
### Transferring Tokens on Behalf of Others
To transfer tokens from another address (with allowance), use the transferFrom function:

```solidity
transferFrom(address sender, address recipient, uint256 amount)
```
## License
This project is licensed under the MIT License.