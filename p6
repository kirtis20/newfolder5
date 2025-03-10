step1: Create 4 worksheets: 
            1.Title winner of each season
            2.Orange cap winner of each season
            3.Tournament 4s
            4.Tournament 6s

Tournamnet 6s
1.Analysis -> created calculated -> sixes = IIF([Batsman Runs]==6,1,0) {to catch all 6’s}
2.Analysis -> created calculated -> rank_sixes =RANK(SUM([sixes]))
3.Add date to filter
4.Add ‘sixes’ to label

do the same for 4s just add '4' instead of '6'

click on date filter and add to all worksheets / apply all workshheets

then add everything to dashboard
