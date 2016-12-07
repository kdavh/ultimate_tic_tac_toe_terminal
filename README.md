# A version of [Ultimate Tic Tac Toe](http://bejofo.net/ttt), played through the shell

## Using existing environment with ruby

### Run the game

`$ ruby play.rb`

### Run tests

`$ gem install rspec`

`$ rspec`


## Using docker

### Create initial docker container

`$ make build`

### Run the game

`$ make game`

### Run the tests

`$ make test`


## TODO:

- constrain input format
- decide what to do with stalemates
- decide what to do when no legal move is possible (next required move is on big board that is completed.
