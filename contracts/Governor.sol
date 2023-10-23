// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.3/governance/Governor.sol";
import "@openzeppelin/contracts@4.9.3/governance/extensions/GovernorSettings.sol";
import "@openzeppelin/contracts@4.9.3/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts@4.9.3/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts@4.9.3/governance/extensions/GovernorVotesQuorumFraction.sol";

contract ContentGuild is
    Governor,
    GovernorSettings,
    GovernorCountingSimple,
    GovernorVotes,
    GovernorVotesQuorumFraction
{
    constructor(
        IVotes _token
    )
        Governor("ContentGuild")
        GovernorSettings(37565 /* 1 day */, 112696 /* 3 day */, 0)
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(25)
    {}

    // The following functions are overrides required by Solidity.

    function votingDelay()
        public
        view
        override(IGovernor, GovernorSettings)
        returns (uint256)
    {
        return super.votingDelay();
    }

    function votingPeriod()
        public
        view
        override(IGovernor, GovernorSettings)
        returns (uint256)
    {
        return super.votingPeriod();
    }

    function quorum(
        uint256 blockNumber
    )
        public
        view
        override(IGovernor, GovernorVotesQuorumFraction)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }

    function proposalThreshold()
        public
        view
        override(Governor, GovernorSettings)
        returns (uint256)
    {
        return super.proposalThreshold();
    }
}
