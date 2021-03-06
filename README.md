# eth-passwords
This is a &#208;app to create and manage encrypted passwords on the ethereum blockchain so that you can always recover them. Deploy a contract and start adding encrypted passwords to the blockchain (along with hints so that you know which password is which). A master password (seed) is used locally to encrypt/decrypt passwords. Only encrypted passwords are stored on the blockchain.

## Command Line Flags
Use the following flags to manage your passwords:

    Environments:
    --test          Uses the private blockchain included in the repo
    
    Actions:
     -i                 Initializes and deploys a new contract. 
                        Requires geth to be running with RPC enabled and an unlocked Ethereum account.
    
    --encrypt <arg>     Encrypts a password with AES and saves it to a file locally. 
                        The arg is used as a hint (also the file name). 
                        Requires a seed value and a password.
                    
    --decrypt <arg>     Decrypts a locally stored, encrypted password. 
                        The arg is used as a hint (and also the file name).
                        Requires the seed value with which the password was encrypted.
           
                    
    Passwords:
    -p <arg>            Uses the arg as a password for an action
    
    
    Seed storage:
    -s <arg>            Uses the argument as the seed value
    
    -sw                 Writes the seed (requires -s) to a local file
    
    -sd                 Deletes the seed file
   

    TODO

    --upload            Uploads an encrypted password to the blockchain. 
                        Must be used in conjunction with either encrypt or decrypt.
                        
    --download <arg>    Download an encrypted password and save it locally. 
                        After this, it can be decrypted to plain text.
## Components
There are three main components in this repo.
#### Contract
The contract is written in Solidity and will be called to do any of the following: deploy a new contract (i.e. a password "wallet"), create a new password, retreive a password, delete a password, see all identifiers.
#### Test Environment
This is a private blockchain with RPC enabled. An address has been seeded with a bunch of fake ether using a trick that modifies the genesis block. This private chain can be used to test the contract before deploying to the real blockchain and using real ether.
#### Command Line Tool
This is what you use to interact with the contract.


## Workflow
The general idea (in progress) is this:

1. Make sure you have an ethereum account. Spin up a geth instance with RPC enabled and unlock your account.
2. Deploy a new contract. The address will be written to a local file.
3. Use the CLI to generate a new password with a string serving as some clue to you about what the password will be used for. The CLI will encrypt the password and then upload it to the block chain (it will also save the encrypted password locally).

At this point, you may use the CLI to view all of your encrypted passwords locally or you may call the Ethereum contract to pull them down from the blockchain. You can also, at any time, delete or create a new password and deploy it to the blockchain.


### TODO:
- Figure out how to find the contract address from a new computer
- Finish all the methods
