// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {TendermintX} from "../src/TendermintX.sol";

// forge script script/TendermintX.s.sol --verifier etherscan --private-key
// forge verify-contract <address> TendermintX --chain 5 --etherscan-api-key ${ETHERSCAN_API_KEY} --constructor-args "0x000000000000000000000000852a94f8309d445d27222edb1e92a4e83dddd2a8"
contract GenesisScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        // Use the below to interact with an already deployed ZK light client.
        TendermintX lightClient = TendermintX(
            0x59eE2D9CFaC933c79Cc1D1d6767679636c0b539D
        );

        uint64 height = 1126800;
        bytes32 header = hex"1fbfaed36f6f96a746427345658e67047f6c13b88aaaa4e4ee5ca794c611e239";
        lightClient.setGenesisHeader(height, header);
    }
}
