--Question 1
'
To remove the comma we can use
replace(Alvarez, Jr., ',' , ' ') function for both names.
A regular expression wouldn\'t be necessary in this instance.
We cwn capture the suffixes by using the right(Alvarez, Jr., 3) 
function to separate the suffixes from the names.
'

--Question 2

--Question 3
SELECT president,
       speech_date,
       ts_rank_cd(search_speech_text,
               to_tsquery('war & security & threat & enemy')) AS score
FROM president_speeches
WHERE search_speech_text @@ to_tsquery('war & security & threat & enemy')
ORDER BY score DESC
LIMIT 5;

'
ts_rank_cd does change the results quite drastically,
The order and the score significantly changes.
'