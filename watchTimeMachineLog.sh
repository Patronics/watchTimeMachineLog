#for watching the logs from an Apple Time Machine backup on MacOS
#the log will update with new progress every 5 minutes
log stream --predicate 'subsystem == "com.apple.TimeMachine"' --info

#to see the recent historical records, instead run
#log show --predicate 'subsystem == "com.apple.TimeMachine"' --info --last 4h
#                                         can adjust duration to show here ^

#to hide non-progress update messages, adjust the --predicate string to
#--predicate '(subsystem == "com.apple.TimeMachine") && (category == "CopyProgress")'