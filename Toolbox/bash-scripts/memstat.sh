#!/bin/bash
memstat() {

    parentdir="$(dirname "$1")"
    max_mem='2027'
    #max_mem=$(sudo cat "$parentdir"/../conf/glide-java-opts.conf | sed -nr 's/.*Xmx([0-9]+)m/\1/p')
    sudo cat $1 | awk -v max_mem="$max_mem" '
    function max(arr) {
        x = 0
        for(a in arr) {
            if(arr[a] > x) {
                x = arr[a]
            }
        }
        return x
    }
    function avg(arr) {
        count = 0
        sum = 0
        for(a in arr) {
            count++
            sum += arr[a]
        }
        return sum / count
    }
    function floor(a) {
        return sprintf("%d", a)
    }
    function round(a) {
        return sprintf("%d", a + .5)
    }
    function repeat(char, x) {
        str = ""
        while(x-- > 0) {
            str = str char
        }
        return str
    }
    function ts2str(timestamp) {
        hours = floor(timestamp / ( 60 * 60 ))
        timestamp -= hours * 60 * 60
        minutes = floor(timestamp / 60)
        timestamp -= minutes * 60
        return sprintf("%02d:%02d:%02d", hours, minutes, timestamp)
    }
    function str2ts(str) {
        split(str,time,":")
        return time[1] * 60 * 60 + time[2] * 60 + time[3]
    }
    function percent(part, total) {
        return round( part / total * 100 ) + 0
    }
    function print_usage() {
        if(length(used_arr) > 0) {
            avg_used = avg(used_arr)
            max_total = max(total_arr)
            pct = percent(max_total - avg_used, max_total)

            if(pct <= 10) {
                color = "\033[1;31m"
            } else if (pct <= 20) {
                color = "\033[1;33m"
            } else {
                color = "\033[0;32m"
            }

            blocks_unused = round((max_mem - max_total) / max_mem * width)
            blocks_used = round(avg_used / max_mem * width)
            blocks_free = width - (blocks_unused + blocks_used)
            output = color repeat(char, blocks_used) "\033[0;37m" repeat(char, blocks_free) "\033[1;30m" repeat(char, blocks_unused) "\033[0m"

            print_line(ts2str(ts), length(used_arr), pct "%", output)

            delete used_arr
            delete total_arr
        }
    }
    function print_line(time_str, data_points, pct_str, output) {
        print time_str, sprintf("% 5s", data_points), sprintf("% 3s", pct_str), sprintf("% " width "s", output)
    }
    BEGIN {
        OFS = " "
        width = 100
        gap = 300
        min_free = 100
        char = "▓"
        split("",used_arr)

        print "Max allocatable memory: " max_mem
    }

    /Memory transaction:/ {
        used = $10
        total = $14
    }
    /Script: Before GC/ {
        used = $14
        total = $12
    }
    /Memory: After GC/ {
        used = $12
        total = $10
    }
    used && total {
        new_ts = str2ts($2)
        new_ts -= (new_ts % gap)
        if( new_ts > ts ) {
            print_usage()
            ts = new_ts
        }

        gsub(/[^0-9]/, "", used)
        gsub(/[^0-9]/, "", total)

        lines++
        used_arr[lines] = used + 0
        total_arr[lines] = total + 0
        used = total = ""
    }

    {
        total_lines++;
    }

    /glide Base path:/ {
        print_usage()
        print_line($2, "", "", "JVM RESTART!")

    }
    END {
        print_usage()
        print "Successfully processed " lines " data points found in " total_lines " log lines."
    }
    '
}
