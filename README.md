# SimpleContract

`SimpleContract` is a basic Solidity smart contract that demonstrates the usage of three essential error handling mechanisms in Solidity: `require()`, `assert()`, and `revert()`. These mechanisms help enforce conditions and handle errors in smart contracts.

## Contract Overview

The contract contains three functions, each showcasing a different error handling mechanism:

1. **requireCheck(uint x)**
2. **assertCheck(uint y)**
3. **revertCheck(uint z)**

## Functions and Error Handling

### 1. requireCheck(uint x)

**Purpose:**
- Ensures the input `x` is within a specified range using the `require()` statement.

**Details:**
- The function checks if `x` is greater than 0 and less than 100.
- If the condition is not met, the function execution is reverted with the message: "Input must be between 1 and 99."

```solidity
function requireCheck(uint x) public pure {
    require(x > 0 && x < 100, "Input must be between 1 and 99.");
}
```

### 2. assertCheck(uint y)

**Purpose:**
- Verifies an internal condition using the `assert()` statement.

**Details:**
- The function calculates `result` as `y * 2`.
- It then asserts that `result` is greater than `y`.
- If the condition fails, indicating a bug, the transaction is reverted.

```solidity
function assertCheck(uint y) public pure {
    uint result = y * 2;
    assert(result > y); // This should always be true for non-zero y
}
```

### 3. revertCheck(uint z)

**Purpose:**
- Explicitly handles an error case using the `revert()` statement.

**Details:**
- The function checks if `z` is zero.
- If `z` is zero, it reverts the transaction with the message: "Input must be non-zero."

```solidity
function revertCheck(uint z) public pure {
    if (z == 0) {
        revert("Input must be non-zero.");
    }
}
```

## How to Run the Contract

To deploy and interact with the contract, you can use [Remix IDE](https://remix.ethereum.org/). Here are the steps:

### Step 1: Open Remix IDE
Navigate to [Remix IDE](https://remix.ethereum.org/).

### Step 2: Create and Paste the Contract Code
1. Create a new file named `SimpleContract.sol`.
2. Copy and paste the provided contract code into this file.

### Step 3: Compile the Contract
1. Click on the `Solidity Compiler` tab on the left sidebar.
2. Ensure the compiler version is set to `0.8.18`.
3. Click `Compile SimpleContract.sol`.

### Step 4: Deploy the Contract
1. Click on the `Deploy & Run Transactions` tab on the left sidebar.
2. Ensure the `Environment` is set to `JavaScript VM (London)`.
3. Click `Deploy`.

### Step 5: Interact with the Contract
1. Use the `Deployed Contracts` section to call the functions:
   - `requireCheck(uint x)` by entering a value and clicking `transact`.
   - `assertCheck(uint y)` by entering a value and clicking `call`.
   - `revertCheck(uint z)` by entering a value and clicking `call`.

## License

This project is licensed under the MIT License.
```
