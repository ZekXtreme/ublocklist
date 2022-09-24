#!/bin/bash
cd shell/src

# Start Download
curl -o i0.txt https://raw.githubusercontent.com/randombustard/ublocklist/main/list/custom.txt
curl -o i1.txt https://raw.githubusercontent.com/jhchabran/code-search-blacklist/main/uBlacklist.txt
curl -o i2.txt https://raw.githubusercontent.com/sanketpatrikar/hn-search-blacklist/main/blacklist.txt
curl -o i3.txt https://raw.githubusercontent.com/rjaus/ublacklist-pinterest/main/ublacklist-pinterest.txt
curl -o i4.txt https://raw.githubusercontent.com/arosh/ublacklist-github-translation/master/uBlacklist.txt
curl -o i5.txt https://raw.githubusercontent.com/arosh/ublacklist-stackoverflow-translation/master/uBlacklist.txt
curl -o i6.txt https://raw.githubusercontent.com/rjaus/ublacklist-yelp/main/ublacklist-yelp.txt
curl -o i7.txt https://raw.githubusercontent.com/h-matsuo/uBlacklist-subscription-for-developer/master/list.txt
curl -o i8.txt https://raw.githubusercontent.com/wdmpa/content-farm-list/main/uBlacklist.txt
curl -o i9.txt https://raw.githubusercontent.com/wdmpa/content-farm-list/main/uBlacklist/spam.txt
curl -o i10.txt https://raw.githubusercontent.com/PRiMENON/uBlacklist/master/list.txt
curl -o i11.txt https://raw.githubusercontent.com/mtgq/ublacklist-subscription/main/uBlacklist.txt
curl -o i12.txt https://raw.githubusercontent.com/DivineEngine/uBlacklist/master/blacklist.txt
curl -o i13.txt https://raw.githubusercontent.com/arosh/ublacklist-stackoverflow-translation/master/uBlacklist.txt
curl -o i14.txt https://raw.githubusercontent.com/NotJustAHippo/ublacklist/main/sitestoblock.txt
curl -o i15.txt https://raw.githubusercontent.com/nonPointer/uBlacklist-Subscription/master/blacklist.txt
curl -o i16.txt https://raw.githubusercontent.com/lbydev/uBlacklist/master/blacklist.txt

# Start Merge and Duplicate Removal
cat i*.txt > merge.txt
cat merge.txt | grep -v '#' | grep -v '##' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > temp.txt
sort temp.txt | uniq > tmp.txt
sort -n tmp.txt > tmmp.txt


# Start Count Rules
num=`cat tmmp.txt | wc -l`

# Start Add title and date
echo "# Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "# Total count: $num" >> tpdate.txt
cat title.dd tpdate.txt tmmp.txt > final.txt

sort -f -u -o ./final.txt ./final.txt
mv final.txt ../ublocklist.txt
rm *.txt
cd ../
exit

