# BitmapStorage Solidity Contract

## Overview
BitmapStorage is a Solidity smart contract that efficiently stores 32 individual bytes within a single `uint256` variable. Each byte can be accessed and modified using specific functions, making it a gas-efficient method for handling small data storage.

## Features
- Stores 32 individual byte-sized values within a single `uint256`.
- Provides functions to update a specific byte slot.
- Allows retrieval of all stored values as an array.
- Enables access to a specific byte slot.
- Implements input validation to prevent out-of-bounds storage.

## How It Works
- The contract uses bitwise operations to store and retrieve bytes efficiently.
- A mask is applied to clear existing data before setting a new value in a specific byte slot.
- Retrieving values is done by shifting and applying a mask to extract the correct byte.

## Testing
A test suite is implemented using Foundry to validate the contract’s functionality. The tests include:
- Storing and retrieving values in various slots.
- Ensuring all values can be retrieved correctly.
- Checking for out-of-bounds slot access.

## Usage Instructions
### Deployment
1. Ensure you have a Solidity-compatible development environment.
2. Compile the contract using Foundry or another Solidity compiler.
3. Deploy the contract to a blockchain or local test environment.

### Running Tests
1. Install Foundry.
2. Clone the repository and navigate to the project directory.
3. Run the tests using:
   ```sh
   forge test
   ```

## License
This project is licensed under the MIT License.

