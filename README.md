# GoogleSearch_Place

Screenshots in file "googleSearchPlaceGuide.docx"

STEP 1
Method 1:   ./ googleSearchByKeywords.ps1 [enter]
 
STEP 2
Method 2(position pararmeter):   ./ googleSearchByKeywords.ps1 Spa2 “spa T” [enter]      
 
Method 1 and 2 will generate 2 files
 
STEP 3
.\MergeRefernceDifferernce.ps1 .\googleSearchSpa1.csv .\googleSearchSpa2.Csv
Merge both files of Spa1.csv and Spa2.csv , duplicate records will not be copied .The result of 32 records found in Spa2.csv is copy and inserted into Spa1.csv. 
 
Note: In both googleSearch*.ps1 files, line starting with "$response 1...", Change MY_APIKEY to your own generated API key.
