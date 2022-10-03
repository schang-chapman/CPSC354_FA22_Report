# Homework 5

### Sharon Chang

I copied the given grammar into the lambda.cf file. Then I used the following series of commands in order to use bnfc to generate a parser based on the cf file.
```
bnfc -m --haskell lambda.cf
make
```