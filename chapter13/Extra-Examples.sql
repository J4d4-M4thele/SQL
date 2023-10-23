--Question 1
'
To remove the comma we can use
replace(Alvarez, Jr., ',' , ' ') function for both names.
A regular expression wouldn\'t be necessary in this instance.
We cwn capture the suffixes by using the right(Alvarez, Jr., 3) 
function to separate the suffixes from the names.
'