#!/bin/bash

SUCCESS=0
FAIL=0
ALL=0
DIFF=""
STATUS=""

test() {
    peremen=$(echo "$@" | sed "s/OPTIONS/$var/")   
    ./s21_grep $peremen > ./s21_grep.log
    grep $peremen > grep.log
    DIFF=$(diff -s ./s21_grep.log grep.log)
    let "ALL++"
    if [ "$DIFF" == "Files ./s21_grep.log and grep.log are identical" ]
    then
        STATUS="SUCCESS"
        let "SUCCESS++"
    else
        STATUS="FAIL"
        let "FAIL++"
    fi
    echo "Test status: $STATUS. Fail:$FAIL Success:$SUCCESS All:$ALL Request:grep $peremen"
    rm -f ./s21_grep.log grep.log
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
    for k1 in "${flags2[@]}"
    do
        for k2 in "${flags2[@]}"
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
            for k3 in "${flags2[@]}"
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
    for k1 in "${flags1[@]}"
    do
        for k2 in "${flags1[@]}"
        do
            for k3 in "${flags2[@]}"
            do
                for k4 in "${flags2[@]}"
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
    for k1 in "${flags1[@]}"
    do
        for k2 in "${flags1[@]}"
        do
            if [ $k1 != $k2 ]
            then
                for i in "${tests[@]}"
                do
                    var="-$k1$k2"
                    test "$i"
                done
            fi
        done
    done
}

test7() {
    for k1 in "${flags[@]}"
    do
        for k2 in "${flags[@]}"
        do
            if [ $k1 != $k2 ]
            then
                for i in "${test_f_flag[@]}"
                do
                    var="-$k1$k2"
                    test "$i"
                done
            fi
        done
    done
}

tests=(
"for test_files/test_0.txt s21_grep.c OPTIONS"
"for test_files/test_1.txt test_files/test_2.txt test_files/test_3.txt OPTIONS"
"-e for -e ^int test_files/test_4.txt test_files/test_5.txt s21_grep.c OPTIONS"
)

flags=(
    "v"
    "c"
    "n"
    "i"
    "h"
    "s"
)

flags1=(
    "v"
    "l"
    "n"
    "i"
    "h"
    "s"
)

flags2=(
    "v"
    "n"
    "i"
    "h"
    "s"
)

test_f_flag=(
    "-e while -e void s21_grep.c test_files/test_1.txt OPTIONS -f test_files/test_pattern.txt"
)

proverka=(
"-e regex -e ^print s21_grep.c OPTIONS -f test_files/test_pattern.txt"
"-e while -e void s21_grep.c test_files/test_1.txt OPTIONS -f test_files/test_pattern.txt"
"-e for -e ^int -e s1 -e s2 test_files/test_1.txt test_files/test_2.txt"
"-n for test_files/test_1.txt test_files/test_2.txt"
"-n for test_files/test_1.txt"
"-e int test_files/test_1.txt test_files/test_2.txt"
"-e int test_files/test_1.txt"
"-e INT test_files/test_5.txt"
"-v test_files/test_1.txt -e ank"
"-l for test_files/test_1.txt test_files/test_2.txt"
"-e = -e out test_files/test_5.txt"
"-e ^ing -e as -e the -e not -e is test_files/test_6.txt"
"-l for test_files/test_6.txt test_files/test_2.txt"
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
echo "\nTEST 6\n"
test6
echo "\nTEST 7\n"
test7
printf "\n"
echo "FINAL RESULT: FAILED: $FAIL SUCCESS: $SUCCESS ALL: $ALL"
printf "\n"
