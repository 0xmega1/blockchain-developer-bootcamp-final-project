# SuperMeta

### Table of Contents
  - [The Opportunity](#the-opportunity)
  - [The Problem](#the-problem)
  - [The Solution](#the-solution)
  - [User Stories](#user-stories)
  - [Dapp Structure](#dapp-structure)
  - [Destination NFT Metadata Structure](#destination-nft-metadata-structure)
  - [Smart Contract Specs](#smart-contract)
  - [Reserach Questions](#reserach-questions)

## The Opportunity

NFTs introduce a new opportunity for asset owners to transport their NFTs across the metaverse in order to extract new utility from their digital items. This could look as as simple as using an NFT in a new experience - e.g., transporting a digitally owned piece of clothing from one virtual reality experience to another. This could also be a matter of combining the meta data from two or more NFTs into a new item - e.g., combing a sword and shield into a more powerful weapon. 

While we can't predict all of the use cases ahead of time, as NFT enthusiasts continue exploring new use cases, there will be a growing need to interpret NFT meta data in meaningful ways. 

## The Problem
Currently, there are no standards for structuring NFT meta data and it is up to developers to interpret or ignore this information. If NFTs are going to progress as composable assets there needs to be a way for owners and developers to create and interpret NFT meta data. 

## The Solution
SuperMeta is a dapp that helps developers and owners to view and work with NFT meta data. 

## User Stories 

As a user, I want to view the metadata for two source NFTs so that I can choose the metadata fields to include in a new destination NFT.

As a user, I want to select metadata from two source NFTs so that I can create a destination NFT that includes metadata from the source NFTs.

As a user, I want to mint a new NFT that includes selected meta data the source NFTs.

As a user, I want to see the the new NFT metadata so that I can confirm that the metadata includes the metadata selected from the source NFTs.

## Dapp Structure
The final dapp should include the following screens: 
- Show a user the NFTs in their wallet and allow them to select two source NFTs
- A screen that displays the metadata of the specified NFTs side-by-side with the following capabilities:
  - Allow a user to select one or more metadata fields from each source NFT for inclusion in a new destination NFT
  - Allow a user to mint a new destination NFT that includes the selected metadata from each source NFT
- A screen that shows the user the new destination NFT with combined metadata from the source NFTs

[Dapp architecture diagram](https://www.awesomescreenshot.com/image/15165470?key=12549a2c929a78cffa08f3df1c4ff12c)

## Destination NFT Metadata Structure

The structure of the destination metadata NFT should include the following elements: 
- Source NFT A address
- Source NFT B address
- Metadata attributes selected from source NFT A and source NFT B

## Smart Contract Specs
The smart contract for SuperMeta should have the following properties: 
- Use the OpenZeppelin ERC721 contract template
- Allow any user to mint a new NFT using the selected metadata from NFT A and NFT B
- Accept a unique token URI for each minted destination NFT 

## Reserach Questions
**How is NFT metadata retrieved?** 

By parsing the JSON retrieved from the tokenUri property of the token contract. 

**How can metadata be indexed for an entire contract?**

A service like [Moralis](https://moralis.io/) can be used to index contract metadata without indexing an RPC node from scratch. This is the best route for a small project like this one. 

**What are the implications of minting a new NFT that represents the meta data from multiple underlying assets?**

If the user ownns the underlying asset, this should not present a technical issue. The source NFT contracts would not recognize the token as part of the origniating collection. Therfore, the destination NFT is derivitave but does not necessalrily infringe on any intellectual property rights. This type of system certainly has implications on intellectual property ownership but, ultimately, is out of the system's control. 

**How would this be perceived by a consuming dapp?**

A third party contract would need to recognize the destination NFT in order for the token to have utility within a new contract. The destination NFT could be interpreted as a wholly new asset, disconnected from the source NFT. A developer could also choose to use the destination NFT's contract lineage as a factor in how the token is considered within the context of the third party contract. 

**What would happen if the owner sold a source NFT?**
There should be on impact on the destination NFT if the owner chooses to sell a source NFT. The destination NFT is an entirely new asset that is linked to the user's historically provable ownership of the source NFT. 

**Would the contract need to custody the underlying asset in order for the new NFT to be a useable source of metadata?**
The SuperMeta contract does not require custody of any tokens. It merely reads ownershp of the tokens in the user's wallet and presents them with an interface for selecting source NFT metadata that should be mapped to a destination NFT. 