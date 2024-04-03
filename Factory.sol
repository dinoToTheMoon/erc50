// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./fair-launch-uniswap-v2-with-eth-limit.sol";

contract LimitAmountFairLaunchTokenFactory {

    event TokenCreated(
        address indexed tokenAddress,
        address indexed creator,
        uint256 price,
        uint256 amountPerUnits,
        uint256 totalSupply,
        address uniswapRouter,
        address uniswapFactory,
        string name,
        string symbol,
        uint256 eachAddressLimitEthers
    );

    function createToken(
        uint256 _price,
        uint256 _amountPerUnits,
        uint256 _totalSupply,
        address _uniswapRouter,
        address _uniswapFactory,
        string memory _name,
        string memory _symbol,
        uint256 _eachAddressLimitEthers
    ) external {
        LimitAmountFairLaunchToken newToken = new LimitAmountFairLaunchToken(
            _price,
            _amountPerUnits,
            _totalSupply,
            msg.sender,
            _uniswapRouter,
            _uniswapFactory,
            _name,
            _symbol,
            _eachAddressLimitEthers
        );

        emit TokenCreated(
            address(newToken),
            msg.sender,
            _price,
            _amountPerUnits,
            _totalSupply,
            _uniswapRouter,
            _uniswapFactory,
            _name,
            _symbol,
            _eachAddressLimitEthers
        );
    }
}
