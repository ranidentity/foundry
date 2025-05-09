pragma solidity ^0.8.0;

contract Voting{

    struct Candidate{
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;

    mapping(address =>bool) public hasVoted;

    constructor(string[] memory candidateNames){
        for (uint i=0; i< candidateNames.length;i++){
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount:0
            }));
        }
    }

    function vote(uint candidateIndex) public{
        require(!hasVoted[msg.sender],"You have already voted.");
        require(candidateIndex<candidates.length,"Invalid candidate index");
        candidates[candidateIndex].voteCount ++;
        hasVoted[msg.sender]=true;
    }

    function getCandidates() public view returns (Candidate[] memory){
        return candidates;
    }

    function getWinner() public view returns (string memory winnerName, uint winnerVotes){
        uint maxVotes=0;
        uint winnerIndex=0;
        for (uint i = 0; i<candidates.length; i++){
            if (candidates[i].voteCount > maxVotes){
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }
        return (candidates[winnerIndex].name, candidates[winnerIndex].voteCount);
    }
}