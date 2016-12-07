build:
	docker build -t rubybase .
run:
	docker run --name rubybase-sh-container -v `pwd`:/code --rm -it rubybase bash
console:
	docker run --name rubybase-console-container -v `pwd`:/code --rm -it rubybase pry
test:
	docker run --name rubybase-test-container -v `pwd`:/code --rm -it rubybase rspec --color
game:
	docker run --name rubybase-sh-container -v `pwd`:/code --rm -it rubybase ruby play.rb
