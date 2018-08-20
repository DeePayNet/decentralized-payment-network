var Web3 = require('web3');
var config = require('./build/contracts/OrderInfo')
var orderid = 20180813123628994918;

//初始化过程
var web3 = new Web3(new Web3.providers.HttpProvider("http://192.168.10.10:8545"));
web3.eth.getAccounts().then(function(results){
    var myContract = new web3.eth.Contract(config.abi, results[0]);

    myContract.events.addedOrder({}, function(error, event){ console.log(event); }).on('data', function(event){
        console.log(event); // same results as the optional callback above
    })
    .on('changed', function(event){
        // remove event from local database
    })
    .on('error', console.error);

    myContract.methods.addOrder(orderid,"mfiRb4cZ3YAVhBLaM1EkM55Wj6ahggFb5Q", "mfiRb4cZ3YAVhBLaM1EkM55Wj6ahggFb51", "CNY", 10, "BTC", 255, 1534318109, 1534316016);

    var order = myContract.methods.getOrder(orderid);
    // console.log(order);
});