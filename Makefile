REPORTER = spec

all: jshint test
# The default target which is invoked by just running make, this runs the jshint and test targets.

test:
# test runs tests in the test folder using the mocha (http://visionmedia.github.io/mocha/) test framework.
	@NODE_ENV=test ./node_modules/.bin/mocha --recursive --reporter $(REPORTER) --timeout 3000

jshint:
# jshint uses jshint (http://www.jshint.com/) to check over the code.
	jshint lib examples test index.js

tests: test

tap:
	@NODE_ENV=test ./node_modules/.bin/mocha -R tap > results.tap

unit:
	@NODE_ENV=test ./node_modules/.bin/mocha --recursive -R xunit > results.xml --timeout 3000

skel:
# skel generates a basic structure for my project creating index.js and, lib, example and test directories and installs mocha and chai (http://chaijs.com/) the BDD / TDD assertion library.
	mkdir examples lib test
	touch index.js
	npm install mocha chai --save-dev

.PHONY: test tap unit jshint skel
