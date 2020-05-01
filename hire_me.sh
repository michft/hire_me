#!/usr/bin/env bash

set -euo pipefail

# Once we get the TS date it's just a matter of adding or
# subtracting seconds.

# TS_DATE=$(date --date='9:00 last Sun' +%s)
# START_DATE=$(date -d "@$MV_DATE")

# Using 12 because Github apparently is UTC and my timezone +10 (or +11)

# check git log date starting is a Sunday.
# let "MV_DATE = $(date --date='12:00 Sun' +%s) - 25920000" # Hire
let "MV_DATE = $(date --date='12:00 Sun' +%s) - 29030400" # Not
DAY=86400
REMOTE="https://github.com/michft/hire_me.git"


# Since the first the thing we do is Stomp .git, need to keep all
# comments/other code.

function commits() {
    # 4 * 1500 and after move day
    # 12 * 500 better.
  for k in {0..11}; do
#    echo "Four" $i $NUM $j $(date -d "@$MV_DATE")
    GIT_COMMITTER_DATE=$MV_DATE
    GIT_AUTHOR_DATE=$MV_DATE
    export GIT_COMMITTER_DATE GIT_AUTHOR_DATE
    echo $MV_DATE > ./a
    git commit -a -m "$MV_DATE"
    let "MV_DATE = $MV_DATE + 500"
  done
#    echo "Four" $i $NUM $j $(date -d "@$MV_DATE")
  let "MV_DATE = $MV_DATE + 80400"
}

# need to stomp to stop multiple / bad overwriting.
rm -rf ./.git
git init
echo $MV_DATE > ./a
git add ./a ./LICENCE ./README.md ./hire_me.sh
git commit -a -m "Inital Commit"

# Final
# H  B7 W4 W7 W7 W4 B6 M7
# i  W2 W2 B3 M7
# r  W3 B4 W4 W6 W7 M11
# e  W4 B2 W4 W2 W2 W3 W2 W2 W3 W2 W2 W4 B1 M9
#    M21
# M  B7 W2 W8 W8 B1 W5 W6 W6 B6 M7
# e  W4 B2 W4 W2 W2 W3 W2 W2 W3 W2 W2 W4 B1 M9

# B7 W4 W7 W7 W4 B6 M7 W2 W2 B3 M7 W3 B4 W4 W6 W7 M11 W4 B2 W4 \
# W2 W2 W3 W2 W2 W3 W2 W2 W4 B1 M9 M21 B7 W2 W8 W8 B1 W5 W6 W6 \
# B6 M7 W4 B2 W4 W2 W2 W3 W2 W2 W3 W2 W2 W4 B1 (M9)
#
#
# N  B7 W2 W1 W7 W1 W7 W1 W3 B6 M7
# o  W4 B2 W4 W4 W3 W4 W4 B2 (M7)
# t  W4 W6 B5 W3 W4 M7
#    M14
# L  B7 W7 W7 W7 (M7)
# o  W4 B2 W4 W4 W3 W4 W4 B2 M8
# o  W4 B2 W4 W4 W3 W4 W4 B2 M8
# k  B7 W5 W6 W2 W4 W4 M7
# i  W4 W3 W2 W2 B3 W7 (M7)
# n  W3 B4 W4 W6 W8 B3 M7
# g  W3 W1 W5 W3 W2 W2 W3 W2 W2 B4 (M9)
#
# B7 W2 W1 W7 W1 W7 W1 W3 B6 M7 W4 B2 W4 W4 W3 W4 W4 B2 W4 W6 \
# B5 W3 W4 M21 B7 W7 W7 W7 W4 B2 W4 W4 W3 W4 W4 B2 M8 W4 B2 W4 \
# W4 W3 W4 W4 B2 M8 B7 W5 W6 W2 W4 W4 M7 W4 W3 W2 W2 B3 W7 W3 \
# B4 W4 W6 W8 B3 M7 W3 W1 W5 W3 W2 W2 W3 W2 W2 B4 \


# Orig Not Looking
# B7 W2 W8 B2 W8 W2 B6 M7 W4 B2 W4 W4 W3 W4 W3 W4 W4 B2 W4 W6 \
# B5 W3 W4 M14 B7 W7 W7 W7 W4 B2 W4 W4 W3 W4 W3 W4 W4 B2 M8 W4 \
# B2 W4 W4 W3 W4 W3 W4 W4 B2 M8 B7 W5 W6 W2 W4 W4 M7 W4 W3 W2 \
# W2 B3 W7 W3 B4 W4 W6 W7 W8 B3 M7 W3 W1 W5 W3 W2 W2 W3 W2 W2 \
# W3 W2 W3 B3
#

#for i in W7 B6 W4 W7 W7 W4 B6 M7 W2 W2 B3 M7 W3 B4 W4 W6 W7 M11 W4 B2 W4 \
#         W2 W2 W3 W2 W2 W3 W2 W2 W4 B1 M23 B7 W2 W8 W8 B1 W5 W6 W6 B6 \
#         M7 W4 B2 W4 W2 W2 W3 W2 W2 W3 W2 W2 W4 B1 ; do

for i in B7 W2 W1 W7 W1 W7 W1 W3 B6 M7 W4 B2 W4 W4 W3 W4 W4 B2 W4 W6 \
         B5 W3 W4 M21 B7 W7 W7 W7 W4 B2 W4 W4 W3 W4 W4 B2 M8 W4 B2 W4 \
         W4 W3 W4 W4 B2 M8 B7 W5 W6 W2 W4 W4 M7 W4 W3 W2 W2 B3 W7 W3 \
         B4 W4 W6 W8 B3 M7 W3 W1 W5 W3 W2 W2 W3 W2 W2 B4 ; do

  BW=${i%%[0-9]*}
  NUM=${i:1}
#  echo $i $BW $NUM
# TODO change to case structure, too much python.
  if [ "$BW" == "W" ] ; then
    # White Jump end and single commit.
#    echo "White" $i $BW $NUM $(date -d "@$MV_DATE")
      let "MV_DATE = $MV_DATE + (($NUM - 1) * 86400)"
      commits
#    echo "White 2" $i $BW $NUM $(date -d "@$MV_DATE")
  else
    if [ "$BW" == "B" ]; then
      # Black, step distance committing.
      let "j = $NUM * $DAY"
      let "END = $MV_DATE + $j"
#      echo $END $MV_DATE
      while  [ $END -gt $MV_DATE ] ; do
#        echo "Black" $i $BW $NUM $j $(date -d "@$MV_DATE")
        commits
#        echo "Black 2" $i $BW $NUM $j $(date -d "@$MV_DATE")
      done
    else
      let "MV_DATE = $MV_DATE +  ($NUM * 86400)"
    fi
  fi
done

GIT_COMMITTER_DATE=$(date +%s)
GIT_AUTHOR_DATE=$(date +%s)
export GIT_COMMITTER_DATE GIT_AUTHOR_DATE
echo "Well what were you expecting?" > ./a
git commit -a -m "Final Commit :P"

git remote add origin $REMOTE
git push -u origin master

exit 0

# never get here, orig proof of concept turning ntp off.

for i in {39501..39620..7} ; do
  g=00 ;
  [ $((10#$i % 5)) != 0 ] || g=60 ;
  [ $((10#$i % 3)) != 0 ] || g=30 ;
  [ $((10#$i % 3)) != 0 ] || [ $((10#$i % 5)) != 0 ] || g=90 ;
  for j in `seq 0 30 $g` ; do
    [ $j != "0" ] || j=00 ;
    h="@1"$i"0"$j"0" ;
    date -s $h  ;
    echo "$g $h $i"  >> a ;
    git add a ;
    git commit -m "$i"  ;
  done ;
done

