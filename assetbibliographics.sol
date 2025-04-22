
// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.19;

contract AssetBibliographics {
    struct Asset {
        string name;
        string description;
        string author;
        uint256 creationDate;
        string category;
    }

    mapping(uint256 => Asset) public assets;
    uint256 public assetCount;

    event AssetAdded(uint256 indexed id, string name, string author);
    event AssetUpdated(uint256 indexed id, string name, string author);

    function addAsset(
        string memory _name,
        string memory _description,
        string memory _author,
        string memory _category
    ) public {
        assetCount++;
        assets[assetCount] = Asset({
            name: _name,
            description: _description,
            author: _author,
            creationDate: block.timestamp,
            category: _category
        });

        emit AssetAdded(assetCount, _name, _author);
    }

    function updateAsset(
        uint256 _id,
        string memory _name,
        string memory _description,
        string memory _author,
        string memory _category
    ) public {
        require(_id > 0 && _id <= assetCount, "Invalid asset ID");

        Asset storage asset = assets[_id];
        asset.name = _name;
        asset.description = _description;
        asset.author = _author;
        asset.category = _category;

        emit AssetUpdated(_id, _name, _author);
    }

    function getAsset(uint256 _id) public view returns (
        string memory name,
        string memory description,
        string memory author,
        uint256 creationDate,
        string memory category
    ) {
        require(_id > 0 && _id <= assetCount, "Invalid asset ID");

        Asset storage asset = assets[_id];
        return (
            asset.name,
            asset.description,
            asset.author,
            asset.creationDate,
            asset.category
        );
    }
}￼Enter file contents here
