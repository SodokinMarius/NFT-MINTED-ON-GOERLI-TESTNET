# NFT CONTRACT
This contract is an ERC721 token with the following functionalities:

## Fuctures
It allows for the creation of non-fungible tokens (NFTs).
It is ownable, meaning only the owner of the contract can perform certain actions.
It has a mintPrice variable which specifies the cost of minting a token.
It keeps track of the total supply of tokens and the maximum supply allowed.
It has an isMinteeEnabled variable which can be toggled on and off to enable or disable minting of new tokens.
It has a setMaxSupply function which allows the owner to set a new maximum supply of tokens.
It keeps track of which addresses have already minted a token and limits the number of tokens that can be minted per wallet.
It has a mint function which allows users to mint a new token by sending the mintPrice in Ether to the contract.