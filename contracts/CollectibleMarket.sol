pragma solidity ^0.4.17;

contract CollectibleMarket {

    enum Shape { Triangle, Heart, Square }

    struct Collectible {
        address owner;
        uint32 generation;
        uint256 value;
        Shape shape;
    }
}
