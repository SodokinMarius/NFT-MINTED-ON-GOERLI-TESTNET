// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NFT is ERC721, Ownable {
uint256 public mintPrice;
uint256 public totalSupply;
uint256 public maxSupply;
bool public isMinteeEnabled;
 
address owner;

event Mint(address,uint256 id);

mapping(address => uint256) public mintedwallets; //To make the track of address

constructor() payable ERC721("AYA NFT BJ","ANB") {
    
    mintPrice = 0.05 ether;
    totalSupply = 0;
    maxSupply = 2;
    isMinteeEnabled = false;
    owner = msg.sender;
   
}

 modifier  onlyOwner()  override{
        require(msg.sender == owner, "You must be the contract owner !!");
       
        _;
    }


function toogleIsMintedEnabled() external onlyOwner {
    isMinteeEnabled = !isMinteeEnabled;
}

function setMaxSupply(uint256 _maxSupply) external onlyOwner {
    require(maxSupply > 0);
    maxSupply = _maxSupply;
}


function isOwner(address owner, uint256 id) public view returns (bool) {
    return _isApprovedOrOwner(owner, id);
}

    function mint(address to, uint256 id) external payable {
        require(isMinteeEnabled, "Minting is not enabled");
        require(mintedwallets[msg.sender] < 1, "Exceeds max per wallet");
        require(msg.value == mintPrice, "Wrong value");
        require(maxSupply > totalSupply, "Sold out: total supply must not exceed max supply");

        mintedwallets[msg.sender]++;
        totalSupply++;

        _safeMint(to, id);
        emit Mint(to,id);
    }


}

