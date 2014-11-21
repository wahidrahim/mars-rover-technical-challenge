#!/bin/bash

for t in $(cat "tests/test-suite.txt") ; do
	ruby deploy.rb < "tests/${t}.in" > "/tmp/${t}.out"

	diff "tests/${t}.out" "/tmp/${t}.out" > /dev/null

	if [ ${?} -ne 0 ] ; then
		echo "Test failed: ${t}"
	else
		echo "All tests passed!"
	fi

	rm "/tmp/${t}.out"
done
