pragma solidity ^0.4.24;

contract OrderInfo {

    struct Order {
        uint orderId;
        string from;
        string to;
        string priceCurrency;
        string priceAmount;
        string receiveCurrency;
        string receiveAmount;
        uint successTime;
        uint createTime;
    }

    mapping (uint => Order) Orders;

    event addedOrder(
        uint orderId,
        string from,
        string to,
        string priceCurrency,
        string priceAmount,
        string receiveCurrency,
        string receiveAmount,
        uint successTime,
        uint createTime
    );
    
    function addOrder(
        uint orderId,
        string from,
        string to,
        string priceCurrency,
        string priceAmount,
        string receiveCurrency,
        string receiveAmount,
        uint successTime,
        uint createTime
    ) public  {
        Order memory order = Order({
            orderId: orderId,
            from: from,
            to: to,
            priceCurrency:priceCurrency,
            priceAmount: priceAmount,
            receiveCurrency:receiveCurrency,
            receiveAmount: receiveAmount,
            successTime: successTime,
            createTime: createTime
        }); 

        Orders[orderId] = order;

        emit addedOrder(
            orderId,
            from,
            to,
            priceCurrency,
            priceAmount,
            receiveCurrency,
            receiveAmount,
            successTime,
            createTime
        );
    }

    function getOrder(uint orderId) public constant returns (
        uint,
        string,
        string,
        string,
        string,
        string,
        string,
        uint,
        uint
    ) {

        Order storage order = Orders[orderId];
        return (
            orderId,
            order.from,
            order.to,
            order.priceCurrency,
            order.priceAmount,
            order.receiveCurrency,
            order.receiveAmount,
            order.successTime,
            order.createTime
        );
    }
}