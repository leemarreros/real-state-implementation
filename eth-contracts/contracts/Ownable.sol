pragma solidity ^0.5.0;

contract Ownable {
    //  TODO's
    //  1) create a private '_owner' variable of type address with a public getter function
    address public _owner;

    //  2) create an internal constructor that sets the _owner var to the creater of the contract
    constructor() internal {
        _owner = msg.sender;
    }

    //  3) create an 'onlyOwner' modifier that throws if called by any account other than the owner.
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only the owner is allowed");
        _;
    }

    modifier validateAddress(address to) {
        require(to != address(0x0), "New owner's address cannot be 0x0.");
        require(to != address(this), "New owner's address cannot be himself.");
        _;
    }

    //  4) fill out the transferOwnership function
    //  5) create an event that emits anytime ownerShip is transfered (including in the constructor)
    event OwnerShipTranferred(address to);

    function transferOwnership(address newOwner)
        public
        onlyOwner
        validateAddress(newOwner)
    {
        // TODO add functionality to transfer control of the contract to a newOwner.
        // make sure the new owner is a real address
        _owner = newOwner;
        emit OwnerShipTranferred(newOwner);
    }
}
