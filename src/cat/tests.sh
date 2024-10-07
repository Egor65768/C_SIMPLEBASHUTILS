#!/bin/bash

SUCCESS=0
FAIL=0
ALL=0
DIFF=""
STATUS=""

test() {
    peremen=$(echo "$@" | sed "s/OPTIONS/$var/")   
    ./s21_cat $peremen > ./s21_cat.log
    cat $peremen > cat.log
    DIFF=$(diff -s ./s21_cat.log cat.log)
    let "ALL++"
    if [ "$DIFF" == "Files ./s21_cat.log and cat.log are identical" ]
    then
        STATUS="SUCCESS"
        let "SUCCESS++"
    else
        STATUS="FAIL"
        let "FAIL++"
    fi
    echo "Test status: $STATUS. Fail:$FAIL Success:$SUCCESS All:$ALL Request:cat $peremen"
    rm -f ./s21_cat.log cat.log
}  

test1() {
    for i in "${proverka[@]}"
    do
        test "$i"
    done
} 

test2() {
    for k1 in "${flags[@]}"
    do
        for i in "${tests[@]}"
        do
            var="-$k1"
            test "$i"
        done
    done
}

test3() {
    for k1 in "${flags[@]}"
    do
        for k2 in "${flags[@]}"
        do
            if [ $k1 != $k2 ]
            then
                for i in "${tests[@]}"
                do
                    var="-$k1 -$k2"
                    test "$i"
                done
            fi
        done
    done
}

test4() {
    for k1 in "${flags[@]}"
    do
        for k2 in "${flags[@]}"
        do
            for k3 in "${flags[@]}"
            do
                if [ $k1 != $k2 ] && [ $k2 != $k3 ] && [ $k1 != $k3 ]
                then
                    for i in "${tests[@]}"
                    do
                        var="-$k1 -$k2 -$k3"
                        test "$i"
                    done
                fi
            done
        done
    done
}

test5() {
    for k1 in "${flags[@]}"
    do
        for k2 in "${flags[@]}"
        do
            for k3 in "${flags[@]}"
            do
                for k4 in "${flags[@]}"
                do
                    if [ $k1 != $k2 ] && [ $k2 != $k3 ] && [ $k1 != $k3 ] && [ $k1 != $k4 ] && [ $k2 != $k4 ] && [ $k3 != $k4 ]
                    then
                        for i in "${tests[@]}"
                        do
                            var="-$k1 -$k2 -$k3 -$k4"
                            test "$i"
                        done
                    fi
                done
            done
        done
    done 
}

test6() {
    for k1 in "${flags[@]}"
    do
        for k2 in "${flags[@]}"
        do
            for k3 in "${flags[@]}"
            do
                if [ $k1 != $k2 ] && [ $k2 != $k3 ] && [ $k1 != $k3 ]
                then
                    for i in "${tests[@]}"
                    do
                        var="-$k1$k2$k3"
                        test "$i"
                    done
                fi
            done
        done
    done
}

test7() {
    for k1 in "${flags1[@]}"
    do
        for i in "${tests1[@]}"
        do
            var="-$k1"
            test "$i"
        done
    done
}


tests=(
"OPTIONS test/test_12.txt"
"OPTIONS test/test_2.txt"
"OPTIONS test/test_3.txt"
)

tests1=(
"OPTIONS test/test_12.txt test/test_3.txt" 
"OPTIONS test/test_1.txt test/test_2.txt" 
)

flags1=(
    "b"
    "e"
    "t"
    "v"
    "s"
)

flags=(
    "b"
    "e"
    "n"
    "t"
    "v"
    "s"
)
proverka=(
"-b -e -n test/test_12.txt"
"-e test/test_1.txt"
"-e -t test/test_1.txt test/test_4.txt"
"-b -n test/test_2.txt"
"-s -n test/test_2.txt test/test_4.txt"
"-s test/test_3.txt"
"-s test/test_3.txt test/test_4.txt"
"-v test/test_5.txt"
"-- test/test_5.txt"
"test/test_4.txt"
"-n -b test/test_1.txt"
"-b -e -n -s -t -v test/test_3.txt"
"-benstv test/test_3.txt"
)

echo "\nTEST\n"
echo "\nTEST 1\n"
test1
echo "\nTEST2\n"
test2
echo "\nTEST3\n"
test3
echo "\nTEST4\n"
test4
echo "\nTEST5\n"
test5
echo "\nTEST6\n"
test6
echo "\nTEST6\n"
test7
printf "\n"
echo "FINAL RESULT: FAILED: $FAIL SUCCESS: $SUCCESS ALL: $ALL"
printf "\n"
