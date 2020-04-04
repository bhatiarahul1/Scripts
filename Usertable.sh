#!/bin/bash
getent passwd | cut -d: -f1,3,7 | column -t -s ":" > test.txt
cat test.txt  | awk '{print $1}' > user.txt
for i in `cat user.txt`;do groups $i| awk '{print $3}';done > prim.txt
for i in `cat user.txt`;do groups $i| awk '{print $4}';done > sec.txt
paste test.txt prim.txt  > test1.txt 
cat test1.txt   | awk '{print $3}' > active.txt
#bash ./useractive.sh > active1.txt
for i in `cat active.txt`
do
        if [ "$i" == "/bin/bash" ] || [ "$i" == "/bin/sh" ]
        then
                echo "$i  Active"
        else
                echo "$i  Disabled"
        fi
done > active1.txt
cat active1.txt  | awk '{print $NF}' > active2.txt
paste test1.txt active2.txt > test2.txt
nl test2.txt > test3.txt
awk '{print $0,"  Bajaj","  NA"}' test3.txt > test4.txt
for i in `cat user.txt`; do sudo -lU $i; done > list.txt
cat list.txt |grep User | grep not > not.txt
cat list.txt |grep User | grep -v not > yes.txt
awk '{print $2,"  Enabled"}' yes.txt > enable.txt
awk '{print $2,"  Disabled"}' not.txt > disable.txt
echo "`cat enable.txt`" >> disable.txt
mv disable.txt sudoers.txt
cat test4.txt | awk '{print $5,$2,$3}' > sudo.txt
awk 'NR==FNR {a[$1]=$2; next} $2 in a {print $0, a[$2]}' OFS='\t' sudoers.txt sudo.txt > test5.txt
paste test4.txt test5.txt > test6.txt
gawk 'BEGIN{print "Sr.No,UserID,Username,Role,Company,PrimaryGroup,SecondaryGroup,UserActive,Sudoers"} {print $1","$3","$2","$8","$7","$5","$5","$6","$12}'  test6.txt
rm -f test.txt user.txt prim.txt sec.txt test1.txt active.txt active1.txt active2.txt test2.txt test3.txt test4.txt list.txt not.txt yes.txt enable.txt  sudo.txt sudoers.txt test5.txt test6.txt
