#! /bin/sh 
# listppa Script to get all the PPA installed on a system ready to share for reininstall

echo ""
echo "REPO NAME"

search_dir=/etc/yum.repos.d/
for file in "$search_dir"/*
do
  echo ""

  name=`cat $file | grep name | tail -n1`
  #url=`cat $file | grep baseurl | tail -n1`
  
  echo $name
  #echo $url
done

echo ""
echo "_________________"
echo ""
echo "REPO URLs"

repolist=`dnf repolist -v`

for repo in `dnf repolist -v | grep 'Metalink do repo'`; do
    if [[ $repo == https* ]]; then
        echo $repo
    fi
done
