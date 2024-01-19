#!/usr/bin/env bash

tempDir=/tmp/yabai-tiling-floating-toggle
[ -d $tempDir ] && rm -rf $tempDir
mkdir $tempDir

# JSON array
displays=$(yabai -m query --displays)

# How many displays I am using currently
cnt=$(echo $displays | jq '.|length')

# For each display
for ((i = 0 ; i < $cnt ; i++)); do
  display=$(echo $displays | jq ".[$i]")
  index=$(echo $display | jq ".index") # display index

  # Get the coordinates of top left corner, the width and the height of the display
  read -r x0 y0 w0 h0 <<< $(echo $(echo $display | jq ".frame" | jq ".x, .y, .w, .h"))

  # Convert to integers
  x0=$(printf "%.0f" "$x0")
  y0=$(printf "%.0f" "$y0")
  w0=$(printf "%.0f" "$w0")
  h0=$(printf "%.0f" "$h0")

  # Calculate the width and the height of the window
  if [ $h0 -gt $w0 ]
  then
    w=$(($w0/12*10))
    h=$(echo "$w/1.5" | bc)
  else
    h=$(($h0/12*10))
    w=$(echo "$h*1.5/1" | bc)
  fi

  # Calculate the coordinates of the top left corner of the window
  x=$(($x0+($w0-$w)/2))
  y=$(($y0+($h0-$h)/2))

  # Store these information in a temp file
  cat>/tmp/yabai-tiling-floating-toggle/display-$index<<EOF
  x=$x
  y=$y
  w=$w
  h=$h
EOF

done
