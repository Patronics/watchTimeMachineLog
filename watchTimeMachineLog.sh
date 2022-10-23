#for watching the logs from an Apple Time Machine backup on MacOS
#the log will update with new progress every 5 minutes
#or get historical records by specifying a durarion of time to look back

RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"


if (( $# == 0 )); then
	log stream --predicate 'subsystem == "com.apple.TimeMachine"' --info
elif [[ $1 == *-h* ]]; then
	echo "usage: ${CYAN}$0 [duration]${WHITE}"
	echo "duration specifier such as ${CYAN}20m${WHITE} or ${CYAN}4h${WHITE}"
	echo "or ${CYAN}leave duration blank${WHITE} for live data stream"
else

	#to see the recent historical records, pass a time specifier
	log show --predicate 'subsystem == "com.apple.TimeMachine"' --info --last $1
	#               choose argument such as 4h to adjust duration to show here ^
fi


#todo: handle with additional script option
#to hide non-progress status messages, adjust the --predicate string to
#--predicate '(subsystem == "com.apple.TimeMachine") && (category == "CopyProgress")'
