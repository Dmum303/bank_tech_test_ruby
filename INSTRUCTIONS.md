# Individual technical challenges

### Goals for the week

Ask yourself the same two questions:

- Are you having fun?
- Are you a better developer than you were yesterday?

#### Primary goal

By the end of the week, the goal is to be able to answer "yes" to the week's primary question:

- **Can you solve a challenging technical problem by writing well crafted code?**

By "well crafted code", we mean code that is well tested, easy to read and easy to change.

#### Secondary goals

By the end of the week, you should:

- Feel more confident in your ability to complete a tech test.
- Have developed a structured process to approaching complex problems, utilising TDD and good OO design skills.

### Structure of the week

This week, you'll work solo to complete different technical challenges. A self assessment form will help you reflect on the quality of your code, and coaches will review your code once you believe you have achieved professional quality.

This week, you'll also come up with ideas for final projects.

### Processes

This week is especially good for focusing on the question, "am I a better developer than I was yesterday?"

There are up to three tech tests this week. This means you can start from scratch three times. It means you can reflect on what was good and what was bad three times. And it means you can try new things to improve three times.

### Code reviews from your coach

Your coach will tell you how to request code reviews.

### Language

You can use Ruby or JavaScript for any of the challenges.

### Challenges

Enjoy these challenges - they are either adapted or directly copied from actual tech tests that employers send out. You will find other tech tests in this folder that you can attempt over the weekend or after graduation.

### Resources

- [Tech test checklist](https://github.com/makersacademy/jobhunters/tree/main/pills/tech_tests)
- [The Coding Dojo Handbook (recommended reading post-course)](https://leanpub.com/codingdojohandbook)

### Bank tech test

Bank tech test
Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time. This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

Specification
Requirements
You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
