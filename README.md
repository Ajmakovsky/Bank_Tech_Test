## Approach:

Granted this application is only to be run in a REPL, there is some assumption of knowledge by the user.

I chose to do this test through Ruby, as I've spent cumulatively more time working with Ruby - particularly with testing. I also felt for this relatively simple REPL program that Ruby would provide visually cleaner/simpler code.

I started my process by following a recipe format for a single class in Ruby, as this helped me walk through my thinking and organisation.

Once the recipe was completed, a lot of the heavy mental lifting was complete - and I was able to work through test driving my code from there.

## Structure:

This programe is held within a single class, as requested by the test specifications.

This initially started with only 4 methods (including the initialize method) but I also incorporated two very short methods to simply return the values stored in our class variables. This proved significanlty valuable during the testing process as I was able to build upon my methods without having full functionality immediately at the start.

The program holds an initialize method to hold class variables to be accessed throughout the program. It then has 2 methods for creating deposits and withdrawals on the bank account application.

## How to use:

You'll need to have Ruby downloaded on your local machine to run this program using irb (the Ruby REPL).

Instructions on how to do this are located on [this page](https://www.ruby-lang.org/en/documentation/installation/).

Personally, I have used Homebrew to install Ruby as a MacOS user, but this part is up to personal preference; the documentation above will take you through the process as needed.

Once you have Ruby on your local machine, you're a better part of the way to interacting with the program!

If you already have these files downloaded on your local machine, you can skip this next step.

Otherwise, please navigate via the command line to wherever you'd like to store the project files on your local machine. Once there, run the following command:

git clone https://github.com/Ajmakovsky/Bank_Tech_Test.git

Once done, you should see the following if this has gone correctly:

```
Cloning into 'Bank_Tech_Test'...
remote: Enumerating objects: 33, done.
remote: Counting objects: 100% (33/33), done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 33 (delta 9), reused 32 (delta 8), pack-reused 0
Receiving objects: 100% (33/33), 5.12 KiB | 5.12 MiB/s, done.
Resolving deltas: 100% (9/9), done.
```

From here - You'll simply need to run the following command to get into the directory holding the application file:

```
cd ./bank_test/lib
```

You'll now be in the directory holding the Bank Account application (located in file bank_account.rb).

You can now run the program using irb from the command line by simply typing "irb".

Once in irb, the lefthand side should show something similar to this: 3.0.0 :001 >

From here you'll need to open the file in irb by running this command:

```
require './bank_account.rb'
```

You'll then be able to interact with the class and methods as you normally would in a REPL Ruby loop.

You need to ensure to create an instance of the class such as "bank_account = BankAccount.new", from which you can run any method commands on that new class instance.

Some examples of commands that can be run:

```
bank_account.deposit("10/01/2023", "1000.00")
bank_account.deposit("13/01/2023", "2000.00")
bank_account.print_statement
```

When interacting via the REPL, the methods deposit and withdrawl simply take two strings, the first being the date of the transaction and secondly the amount.
