// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "./Ownable.sol";

contract Pausable is Ownable {
    event PausedEvt(address account);
    event UnpausedEvt(address account);
    bool private paused;

    constructor() {
        paused = false;
    }

    modifier whenNotPaused() {
        require(
            !paused,
            "Contract is paused and cannot execute any operation."
        );
        _;
    }
    modifier whenPaused() {
        require(paused);
        _;
    }

    function pause() public onlyOwner whenNotPaused {
        paused = true;
        emit PausedEvt(msg.sender);
    }

    function unpause() public onlyOwner whenPaused {
        paused = false;
        emit UnpausedEvt(msg.sender);
    }
}
