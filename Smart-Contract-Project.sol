// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting {
    struct Proposal {
        string description;
        uint voteCount;
    }

    address public chairperson;
    Proposal[] public proposals;
    mapping(address => bool) public voters;

    // Modifier to check if the sender is the chairperson
    modifier onlyChairperson() {
        require(msg.sender == chairperson, "Only chairperson can call this function.");
        _;
    }

    // Constructor to initialize the chairperson
    constructor() {
        chairperson = msg.sender;
    }

    // Function to create a new proposal
    function createProposal(string memory description) public onlyChairperson {
        require(bytes(description).length > 0, "Proposal description cannot be empty.");
        proposals.push(Proposal({
            description: description,
            voteCount: 0
        }));
    }

    // Function to vote for a proposal
    function vote(uint proposalIndex) public {
        require(!voters[msg.sender], "You have already voted.");
        require(proposalIndex < proposals.length, "Invalid proposal index.");

        voters[msg.sender] = true;
        proposals[proposalIndex].voteCount += 1;

        // Assert to check internal consistency
        uint voteCount = proposals[proposalIndex].voteCount;
        assert(voteCount > 0); // After a vote, the count should always be greater than 0
    }

    // Function to get the details of a proposal
    function getProposal(uint proposalIndex) public view returns (string memory description, uint voteCount) {
        require(proposalIndex < proposals.length, "Invalid proposal index.");
        Proposal memory proposal = proposals[proposalIndex];
        return (proposal.description, proposal.voteCount);
    }

    // Function to get the winning proposal
    function winningProposal() public view returns (uint winningProposalIndex) {
        if (proposals.length == 0) {
            revert("No proposals available.");
        }

        uint winningVoteCount = 0;
        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposalIndex = i;
            }
        }
    }
}
