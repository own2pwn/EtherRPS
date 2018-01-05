pragma solidity ^0.4.17;

contract BotFactory {

    event NewBot(uint botID, uint dna);
    event StartBattle(uint botID);

    struct Bot {
        uint64 age; // timestamp of the block when the bot was born
        uint256 genes; // genes that makeup the bot's aesthetic
        uint64 energy; // power to battle another bot
        uint64 reputation; // overall game success
    }

    Bot[] public bots;

    mapping (uint => address) public botToOwner;
    mapping (address => uint) public ownerToBot;
    mapping (address => uint) ownerBotCount; // (owner address => num bots they own)

    function _createBot(uint _dna) internal {
        uint id = bots.push(Bot(uint64(now), _dna, 1000, 0)) - 1;
        botToOwner[id] = msg.sender;
        ownerToBot[msg.sender] = id;
        ownerBotCount[msg.sender]++;
        NewBot(id, _dna);
    }
}
