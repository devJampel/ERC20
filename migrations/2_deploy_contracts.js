var TradeToken = artifacts.require("TradeToken");
module.exports = function (deployer) {
    deployer.deploy(TradeToken);
};