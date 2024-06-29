// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract CrafterToken is ERC20 {

    address public owner;

    event Mint(address indexed to, uint value);

    constructor() ERC20("CrafterToken", "CFT"){
        owner = msg.sender;
        _mint(msg.sender,100 * 10**uint(decimals()));
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    function mint(address _to) public payable  onlyOwner{
         _mint(_to, msg.value);
        emit Mint(_to, msg.value);
    }

    function burn(uint _value) public {
        _burn(msg.sender, _value);
    }

    function burnFrom(address _from, uint256 _value) public {
    address spender = _msgSender();
    _spendAllowance(_from, spender, _value);
    _burn(_from, _value);
    }

    function TransferToken(address _to, uint _value) public {
        _transfer(msg.sender, _to, _value);
    }
}