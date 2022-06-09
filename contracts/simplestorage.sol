pragma solidity ^0.6.0;


contract Counter {

    uint public counter ;

    function get() public view returns (uint){
        return counter;
    }

    function inc() public {
        counter+=1;
    }

    function dec() public {
        counter-=1;
    }


}
