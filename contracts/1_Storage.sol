// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Election {
    uint public chichikoVotes;
    uint public bichikoVotes;

    bool public votingActive;

    constructor() {
        votingActive = true;
    }

    function voteChichiko() public {
        require(votingActive, "Voting is not active");
        chichikoVotes += 1;
    }

    function voteBichiko() public {
        require(votingActive, "Voting is not active");
        bichikoVotes += 1;
    }


    function toggleVoting() public {
        votingActive = !votingActive;
    }


    function getWinner() public view returns (string memory) {
        if (chichikoVotes > bichikoVotes) {
            return "Chichiko is the winner!";
        } else if (bichikoVotes > chichikoVotes) {
            return "Bichiko is the winner!";
        } else {
            return "It's a tie!";
        }
    }
}