// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract Candidates {
    
    //TODO: add id?
	struct CandidateData {
        string name;
        string surname;
        string party;
        address addr;
        bool exist;
    }

    uint numCandidates;
    mapping (uint => CandidateData) candidates;

    //TODO: exist check; common adress check
    function registrationCandidate(string memory name, string memory surname, string memory party) public {
        numCandidates++;
        candidates[numCandidates] = CandidateData(name,surname,party,msg.sender,true);
    }

     function getNumOfCandidates() public view returns(uint) {
        return numCandidates;
    }

      function getCandidate(uint candidateId) public view returns(string memory, string memory, string memory, address, bool) {
        CandidateData memory v = candidates[candidateId];
        return (v.name, v.surname, v.party, v.addr, v.exist);
     }
}