#!/bin/bash

#######color code########
RED="31m"      # Error message
GREEN="32m"    # Success message
YELLOW="33m"   # Warning message
BLUE="36m"     # Info message

WORD=""
HELP=""
INTERACTIVE=""
CONTINUE=""

LONG_WORD_PERIOD=0.5
SHORT_WORD_PERIOD=0.5

#########################
while [[ $# > 0 ]];do
    key="$1"
    case $key in
        -w|--word)
        WORD="$2"
        shift # past argument
        ;;
        -i|--interactive)
        INTERACTIVE=1
        ;;
        -c|--continue)
        CONTINUE=1
        ;;
        -h|--help)
        HELP="1"
        ;;
        *)
                # unknown option
        ;;
    esac
    shift # past argument or value
done


Help(){
    #do nothing
    echo "me"
}

Reading(){

    local matched=0
    local SEQUNCE=1
    
    if [[ CONTINUE -eq 1 ]];then
        if [[ $WORD == "" ]];then
            if [ -f /tmp/word.record ];then
                WORD=`cat /tmp/word.record`
            fi
        fi
    fi

    cat 1.txt | while read line
    do
        if [[ $WORD != "" ]] && [[ matched -eq 0 ]]; then
            #echo "word is not null"
            if [[ $WORD == $line ]]; then
                #echo "word matched."
                matched=1
            else
                continue
            fi
        fi

        echo $line
        if [[ $line =~ ^·.* ]]; then
            newline=${line#"·"}
            say -v Samantha example, $newline
            sleep 0.5
	        continue
        fi

        length=`echo $line |awk '{print length($0)}'`
    
        for i in $(seq 1 $SEQUNCE) 
	    do
		    #say -v Alex $line # Most people recognize me by my voice.
            #say -v Fred $line # I sure like being inside this fancy computer
            say -v Samantha $line # Hello, my name is Samantha. I am an American-English voice.
            sleep 0.1
            say -v Daniel $line # Hello, my name is Daniel. I am a British-English voice.
            if [ $length -lt 2 ]; then
	    	    sleep $SHORT_WORD_PERIOD
            else
                sleep $LONG_WORD_PERIOD
            fi
	    done

        if [[ $INTERACTIVE -eq 1 ]]; then
            read -n1 -rs  </dev/tty
        else
            if [ $length -gt 10 ]; then
                sleep $LONG_WORD_PERIOD
            else
                sleep $SHORT_WORD_PERIOD
            fi
        fi

        if [ -d /tmp ];then
            echo $line > /tmp/word.record
        fi

    done 

}



main(){

    #helping information
    [[ "$HELP" == "1" ]] && Help && return

    Reading


}

main
