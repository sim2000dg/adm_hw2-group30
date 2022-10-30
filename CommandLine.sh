#! /bin/zsh

echo "Finding all the posts that have more than 100 characters in the description"
#get the values inside description field
awk -F '\t' '{if (length($8) > 100) print length($8) ":" $2 "\n"}' instagram_posts.csv  > output.txt

echo
echo "This is how the file looks like:"
echo
cat output.txt | head

echo
echo "Sorting the ids" 
cut -d ":" -f 1,2 output.txt | sort -r -n | head > output_profiles.txt

echo
echo "These are the top 10 profiles:"
echo

for VARIABLE in $(cut -d ':' -f2 output_profiles.txt)
do
        if [ $VARIABLE == -1 ];then
               echo User Not Found
        else awk -F "\t" -vVAR=$VARIABLE '$1 == VAR {print "sid_profile: "$1 " | " "Profile Name: " $3 " | " "First/Last Name: " $4 " | " "Following: " $6 " | " "Followers: " $7}' instagram_profiles.csv;
        fi
done

#Explanation:
#This is a brief explanation on what has been done in this script.
#First we found all the posts that have descriprion longer that 100 characters.
#Then we sorted them based on the length of the description and retrieved the sid_profiles associated to the posts.
#Finally we used these sid_profiles to match the SIDs on instagram_profiles.csv to get some useful information about these users. 


