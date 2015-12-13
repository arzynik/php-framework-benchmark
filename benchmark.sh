#!/bin/sh

if [ -z $BENCHMARK_BASE ]; then
	base=$BENCHMARK_BASE
else
	base="http://127.0.0.1/php-framework-benchmark"
fi

cd `dirname $0`

if [ $# -eq 0 ]; then
    # include framework list
    . ./list.sh
    export targets="$list"
else
    export targets="${@%/}"
fi

cd benchmarks

sh hello_world.sh "$base"

php ../bin/show_results_table.php
