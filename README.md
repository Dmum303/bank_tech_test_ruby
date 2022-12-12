# {{bank_tech_test_ruby}}

# setup

- clone this directory to your local machine and cd into the project folder

# If you don't have ruby version manager installed

- https://rvm.io/ to install RVM.

# Then, we're going to get you the latest Ruby, run these comands in

- rvm get stable
- rvm use ruby --latest --install --default
- gem install bundler
- bundle init

# Make sure you can test

- bundle add rspec
- rspec --init

# to run tests cd into the spec directory and run

- rspec

# Project Requirements

You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

# Input

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

# Output

When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

# Class system

1. A class to store info for each transaction, will need to:

- store date of trans
- have amount to 2 decimal places
- have if deposit or withdrawl
- trow an error if incorrect data type added

                input         | output
                ------------- | -------------
                date obj      | date obj
                non date obj  | error
                int or float  | int or float - to 2 decimal places
              other data type | error

  deposit/withdrawl as string | no error
  any other data type | error

2. A class to which can process the transactions and produce a
   statement showing the effect of all transactions on user's bank balance. Will need to:

- be able to store transactions
- change transaction into into a format which can be used in a statement - string?
- keep a running total of account balance.
- sorts transactions by date
- return a statement in the correct format
- throw an error if incorrect information inputted.

  this class will only take transaction class objects and will throw an error if other info is added

# things to look up

doubles
errors
how to check if something is of a certain class