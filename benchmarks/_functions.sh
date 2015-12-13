benchmark ()
{
    fw="$1"
    url="$2"

	if [ -z $BENCHMARK_TIME ]; then
		time=3
	else
		time=$BENCHMARK_TIME
	fi

    ab_log="output/$fw.ab.log"
    output="output/$fw.output"

    echo "ab -c 10 -t $time $url"
    ab -c 10 -t "$time" "$url" > "$ab_log"
    curl "$url" > "$output"

    rps=`grep "Requests per second:" "$ab_log" | cut -f 7 -d " "`
    memory=`tail -1 "$output" | cut -f 1 -d ':'`
    time=`tail -1 "$output" | cut -f 2 -d ':'`
    file=`tail -1 "$output" | cut -f 3 -d ':'`
    echo "$fw: $rps: $memory: $time: $file" >> "$results_file"

    echo "$fw" >> "$check_file"
    grep "Document Length:" "$ab_log" >> "$check_file"
    grep "Failed requests:" "$ab_log" >> "$check_file"
    grep 'Hello World!' "$output" >> "$check_file"
    echo "---" >> "$check_file"

    # check errors
    touch "$error_file"
    error=''
    x=`grep 'Failed requests:        0' "$ab_log"`
    if [ "$x" = "" ]; then
        tmp=`grep "Failed requests:" "$ab_log"`
        error="$error$tmp"
    fi
    x=`grep 'Hello World!' "$output"`
    if [ "$x" = "" ]; then
        tmp=`cat "$output"`
        error="$error$tmp"
    fi
    if [ "$error" != "" ]; then
        echo -e "$fw\n$error" >> "$error_file"
        echo "---" >> "$error_file"
    fi

    echo "$url" >> "$url_file"

    echo
}
