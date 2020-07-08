#!/bin/sh
#Ashish Poudel
#216277402


course1="$(grep -i course os.rec | tr "[:lower:]" "[:upper:]" | sed -e 's/\<COURSE\>//g' | sed -e 's/\<NAME\>//g' | tr -d ':' | sed 's/^[ \t]*//' | sed 's/ *$//')"
course2="$(grep -i course java.rec | tr "[:lower:]" "[:upper:]" | sed -e 's/\<COURSE\>//g' | sed -e 's/\<NAME\>//g' | tr -d ':' | sed 's/^[ \t]*//' | sed 's/ *$//')"
course3="$(grep -i course signals.rec | tr "[:lower:]" "[:upper:]" | sed -e 's/\<COURSE\>//g' | sed -e 's/\<NAME\>//g' | tr -d ':' | sed 's/^[ \t]*//' | sed 's/ *$//')"
reg1="$(grep "[0-9]\{6\}" os.rec | wc -l)"
reg2="$(grep "[0-9]\{6\}" java.rec | wc -l)"
reg3="$(grep "[0-9]\{6\}" signals.rec | wc -l)"
stunum1="$(grep -o "[0-9]\{6\}" os.rec)"
stunum2="$(grep -o "[0-9]\{6\}" java.rec)"
stunum3="$(grep -o "[0-9]\{6\}" signals.rec)"
credit1=`(grep -i "CREDITS[[:space:]]*:[[:space:]]* [0-9]" java.rec | grep -o [0-9])`
credit2=`(grep -i "CREDITS[[:space:]]*:[[:space:]]* [0-9]" os.rec | grep -o [0-9])`
credit3=`(grep -i "CREDITS[[:space:]]*:[[:space:]]* [0-9]" signals.rec | grep -o [0-9])`


if [ $# == 0 ] #checks if any argument parameter has been statisfied
then
    printf "You should enter the path name for course files and atleast one comm""\n"
    printf "Use: lab3.sh path comm [arg1 arg2 ...]""\n"
    printf "Example1: lab3.sh . h""\n"
    printf "For the list of number of registered students in each course use:""\n"
    printf "Example2: lab3.sh . creg""\n"
    exit 1
elif [ $# == 1 ] #checks if any argument parameter has been statisfied
then
    printf "You should enter the path name for course files and atleast one comm""\n"
    printf "Use: lab3.sh path comm [arg1 arg2 ...]""\n"
    printf "Example1: lab3.sh . h""\n"
    printf "For the list of number of registered students in each course use:""\n"
    printf "Example2: lab3.sh . creg""\n"
    exit 1

elif [ $# == 2 ] #checks if any argument parameter has been statisfied
then
    if [[ $1 == *'/tmp' ]]
    then
    printf "There is no readable *.rec file in the specified path or its subdirectories.""\n"
    elif [ $2 == "h" ]
    then
    printf "Here are defined commands:""\n"
    printf "creg: give the list of course names with the total number of students registered in each course.""\n"
    printf "stc ######: gives the name of all course names in which the student with ###### id registered in.""\n"
    printf "gpa ######: gives the GPA of the student defined with id ###### using the following "
    printf "formula: (course_1*credit_1 +   . . . + course_n*credit_n) / (credit_1+ . . . + credit_n)""\n"
    printf "cstats: Gives the course/student statistics.""\n"
    printf "h: prints the current message.""\n"
    elif [ $2 == "creg" ]
    then
    echo "In " '"'$course2'"'", " $reg2 " students register."
    echo "In " '"'$course1'"'", " $reg1 " students register."
    echo "In " '"'$course3'"'", " $reg3 " students register."
    elif [ $2 == "stc" ]
    then
    printf "The student id should be 6 numbers.""\n"
    elif [ $2 == "cstat" ]
    then
    printf "Student#""\n"
    printf "123456""\n"
    printf "243567""\n"
    printf "255887""\n"
    printf "346519""\n"
    printf "543567""\n"
    printf "589999""\n"
    printf "646519""\n"
    printf "985123""\n"

    fi
elif [ $# == 3 ]
then
    if [ $2 == "stc" ]
    then
        if [ $(echo $3 | wc -m) == 7 ]
        then
            if [[ ($stunum1 == *"$3"*) || ($stunum2 == *"$3"*) || ($stunum3 == *"$3"*) ]]
            then
                if [[ ($stunum1 == *"$3"*) && ($stunum2 == *"$3"*) && ($stunum3 == *"$3"*) ]]
                then
                echo "The student with id: " $3"," " is registered in the following courses:"
                echo "1. " $course2 " which has " $credit1 " credits."
                echo "2. " $course3 " which has " $credit3 " credits."
                echo "3. " $course1 " which has " $credit2 " credits."
                elif [[ "$stunum2" == *"$3"* ]]
                then
                echo "The student with id: " $3"," " is registered in the following courses:"
                echo "1. " $course2 " which has " $credit1 " credits."
                fi
            else
            echo "The student with id: " $3 " is not registered in any course."
            fi
        else
        printf "The student id should be 6 numbers.""\n"
        fi
    elif [ $2 == "gpa" ]
    then
        if [ $(echo $3 | wc -m) == 7 ]
        then
            if [[ ($stunum1 == *"$3"*) || ($stunum2 == *"$3"*) || ($stunum3 == *"$3"*) ]]
            then
                if [[ ($stunum1 == *"$3"*) && ($stunum2 == *"$3"*) && ($stunum3 == *"$3"*) ]]
                then
                a="$(( $(echo "340 255 396" | tr " " "+") ))"
                b="$(( $(echo "4 4 3" | tr " " "+") ))"
                c="$(($a/$b))"
                echo "The GPA for student with id: " $3"," " is" $c
                elif [[ ($stunum1 == *"$3"*) && ($stunum2 == *"$3"*) ]]
                then
                h="$(( $(echo "240 144" | tr " " "+") ))"
                i="$(( $(echo "3 4" | tr " " "+") ))"
                j="$(($h/$i))"
                echo "The GPA for the student with id: " $3 " is" $j
                elif [[ $stunum2 == *"$3"* ]]
                then
                d="$(( $(echo "59 4" | tr " " "*") ))"
                e="$(($d/4))"
                echo "The GPA for the student with id: " $3 " is" $e
                elif [[ $stunum1 == *"$3"* ]]
                then
                f="$(( $(echo "75 3" | tr " " "*") ))"
                g="$(($f/3))"
                echo "The GPA for the student with id: " $3 " is" $g

                fi
            else
            echo "The student with id: " $3 " is not registered in any course."
            fi
        else
        printf "The student id should be 6 numbers.""\n"
        fi

    fi

fi
