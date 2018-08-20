var OrderInfo = artifacts.require("./OrderInfo.sol");

module.exports = function(deployer) {
  deployer.deploy(OrderInfo);
};
