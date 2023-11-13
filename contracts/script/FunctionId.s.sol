// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {TendermintX} from "../src/TendermintX.sol";

// forge script script/TendermintX.s.sol --verifier etherscan --private-key
// forge verify-contract <address> TendermintX --chain 5 --etherscan-api-key ${ETHERSCAN_API_KEY} --constructor-args "0x000000000000000000000000852a94f8309d445d27222edb1e92a4e83dddd2a8"
contract FunctionIdScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        // Use the below to interact with an already deployed ZK light client.
        TendermintX lightClient = TendermintX(
            0x59eE2D9CFaC933c79Cc1D1d6767679636c0b539D
        );

        bytes32 stepFunctionId = hex"bad5719e9774aff7b75a521eea8bafbe91980c246834bd562d12bc2f544917af";
        bytes32 skipFunctionId = hex"31c71f1756caa5b8b6de261b1a1ee0fc6b855a201242f924ce502a8cf41913ff";

        lightClient.updateStepId(stepFunctionId);
        lightClient.updateSkipId(skipFunctionId);
    }
}
