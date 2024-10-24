// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./interfaces/IUniswapV2Pair.sol";
import "./interfaces/IERC20.sol";

import {console2} from "forge-std/console2.sol";

contract AddLiquid {
    /**
     *  ADD LIQUIDITY WITHOUT ROUTER EXERCISE
     *
     *  The contract has an initial balance of 1000 USDC and 1 WETH.
     *  Mint a position (deposit liquidity) in the pool USDC/WETH to msg.sender.
     *  The challenge is to provide the same ratio as the pool then call the mint function in the pool contract.
     *
     */
    function min(uint a, uint b) internal pure returns (uint) {
        return a < b ? a : b;
    }
    function addLiquidity(address usdc, address weth, address pool, uint256 usdcReserve, uint256 wethReserve) public {
        IUniswapV2Pair pair = IUniswapV2Pair(pool);

        uint balanceUsdc = IERC20(usdc).balanceOf(address(this));
        uint balanceWeth = IERC20(weth).balanceOf(address(this));
        console2.log("balanceUsdc: ", balanceUsdc);
        console2.log("balanceWeth: ", balanceWeth);
        uint totalSupply = IUniswapV2Pair(pool).totalSupply();
        //IUniswapV2Pair(weth).transfer(pool, 1 ether);
        //IUniswapV2Pair(usdc).transfer(pool, 1000 * 10 ** 6);

        if ((balanceUsdc * totalSupply) / usdcReserve < (balanceWeth * totalSupply) / wethReserve) {
            console2.log("sent Usdc: ", balanceUsdc);
            IUniswapV2Pair(usdc).transfer(pool, balanceUsdc);
            console2.log("sent Weth: ", (balanceUsdc * wethReserve) / usdcReserve);
            IUniswapV2Pair(weth).transfer(pool, (balanceUsdc * wethReserve) / usdcReserve);
        } else {
            console2.log("sent Weth: ", balanceWeth);
            IUniswapV2Pair(weth).transfer(pool, balanceWeth);
            console2.log("sent Usdc: ", (balanceWeth * usdcReserve) / wethReserve);
            IUniswapV2Pair(usdc).transfer(pool, (balanceWeth * usdcReserve) / wethReserve);
        }

        pair.mint(msg.sender);

        // your code start here

        // see available functions here: https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol

        // pair.getReserves();
        // pair.mint(...);
    }
}
