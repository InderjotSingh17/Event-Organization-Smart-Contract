//SPDX-License-Identifier: Unlicense
pragma solidity >=0.5.0 <0.9.0;
contract EventContract{
    struct Event
    {
        address organizer;
        string name;
        uint price;
        uint date;
        uint ticketcount;
        uint ticketRemain;
    }
mapping(uint=>Event) public events;
mapping(address=>mapping(uint=>uint))public tickets;
uint public nextId;

function createEvent(string memory name,uint date,uint price,uint ticketcount)external
    {
    require(date>block.timestamp,"date should be greater than the date");
    require(ticketcount>0,"ticket count must be one or more");
    events[nextId]=Event(msg.sender,name,price,date,ticketcount,ticketcount);
    nextId++;
    }
function buyTicket(uint id,uint quantity)external payable
    {
    require(events[id].date!=0,"event is not created yet");
    require(events[id].date>block.timestamp,"avent has already occured");
    Event storage _event=events[id];
    require(msg.value==(_event.price*quantity),"ether is not enough");
    require(_event.ticketRemain>=quantity,"no ticket left for buy");
    _event.ticketRemain-=quantity;
    tickets[msg.sender][id]+=quantity;
    }
function transferTicket(uint id,uint quantity,address to)external
    {
    require(events[id].date!=0,"event is not created yet");
    require(events[id].date>block.timestamp,"event has already occured");
    require(tickets[msg.sender][id]>=quantity,"you do not have enough tickets");
    tickets[msg.sender][id]-=quantity;
    tickets[to][id]+=quantity;
    }
}