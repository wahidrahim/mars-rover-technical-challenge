#!/bin/bash

for t in $(cat "tests/test-suite.txt") ; do
	ruby deploy.rb < "tests/${t}.in" > "/tmp/${t}.out"

	diff "tests/${t}.out" "/tmp/${t}.out" > /dev/null

	if [ ${?} -ne 0 ] ; then
		echo "${t} test failed."
	else
		echo "${t} test passed!"
	fi

	rm "/tmp/${t}.out"
done
