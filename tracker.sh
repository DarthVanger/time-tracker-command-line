day=''
previous_day=''
minutesWorkedThisDay='0'
while read line; do
  previous_day="$day"
  day=$(echo "$line" | cut -d 'T' -f 1)
  if [ "$day" != "$previous_day" ] && [ "$previous_day" != '' ]
  then
    echo "$previous_day: worked $(($minutesWorkedThisDay / 60)) hours and $(($minutesWorkedThisDay % 60)) min"
    minutesWorkedThisDay='0'
  fi
  startOrEnd=$(echo "$line"  | cut -d ' ' -f 2)
  if [ $startOrEnd = 'start' ]
  then
    startTime=$(echo "$line" | cut -d 'T' -f 2 | cut -d ' ' -f 1)
    startHours=$(echo "$startTime" | cut -d ':' -f1 | sed -e 's/^0//')
    startMinutes=$(echo "$startTime" | cut -d ':' -f2 | sed -e 's/^0//')
  else
    endTime=$(echo "$line" | cut -d 'T' -f 2 | cut -d ' ' -f 1) 
    endHours=$(echo "$endTime" | cut -d ':' -f1 | sed -e 's/^0//')
    endMinutes=$(echo "$endTime" | cut -d ':' -f2 | sed -e 's/^0//')
    hoursDiff=$((endHours - startHours))
    minutesDiff=$((endMinutes - startMinutes))
    minutesWorked=$((hoursDiff * 60 + minutesDiff))
    minutesWorkedThisDay=$((minutesWorkedThisDay + minutesWorked))
  fi
done <~/nn-timelog.txt
