// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20Token {
    string public name;
    string public symbol;
    uint8 public decimals;
    address public owner;
    uint256 public totalSupply;
    uint256[] public prizes = [0,1000, 2500, 5000, 8000];

    

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        name = "DEGEN";
        symbol = "DGN";
        decimals = 18; 
        owner = msg.sender;
        totalSupply = 0;
        
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function mint(address account, uint256 amount) public onlyOwner {
        require(account != address(0), "Mint to the zero address");
        totalSupply += amount;
        balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    function burn(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(to != address(0), "Invalid recipient address");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    function redeem(address user,uint choice)public returns (string memory){
        require(choice < prizes.length, "Invalid choice");
        if(prizes[choice]<=balances[user]){
            if(choice==1)
            {
                balances[user]-=prizes[choice];
                return "Congratulations! A Diary has been redeemed";
            }
            else if(choice==2){
                balances[user]-=prizes[choice];
                return "Congratulations! A T-Shirt has been redeemed";
            }
            else if(choice==3){
                balances[user]-=prizes[choice];
                return "Congratulations! A Bag has been redeemed";
            }
            else if(choice==4){
                balances[user]-=prizes[choice];
                return "Congratulations! An DOGECOIN has been redeemed";
            }
            
        }
        else{
             return "Sorry!Insufficient balance";
        }
        return "sorry";
        
    }

    

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[from] >= amount, "Insufficient balance");
        require(to != address(0), "Invalid recipient address");
        require(allowances[from][msg.sender] >= amount, "Allowance exceeded");

        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;
        emit Transfer(from, to, amount);

        return true;
    }

    function allowance(address tokenOwner, address spender) public view returns (uint256) {
        return allowances[tokenOwner][spender];
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }
}
