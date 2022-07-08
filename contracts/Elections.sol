// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract Elections {
    //TODO: идея с ct. Припилить сюда или можно оставить этот контракт просто как
    //счётчик, а накопление и расшифровку "голосов" сделать отдельно
	mapping(uint => uint) public vote;

    //TODO: candidates id and quantity, maybe json (how to parse?)
	uint[] public candidateList=[1, 2, 3, 4, 5];


	function totalVotesFor(uint candidate) view public returns (uint) {
		require(validCandidate(candidate));
		return vote[candidate];
	}

	function voteForCandidate(uint candidate) public {
		require(validCandidate(candidate));
		vote[candidate] +=	1;
	}

	function validCandidate(uint candidate) view public returns (bool) {
		for(uint i = 0; i < candidateList.length; i++) {
			if(candidateList[i] == candidate) {
				return true;
			}
		}
		return false;
	}
}