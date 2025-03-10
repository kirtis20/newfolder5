a. Orange cap winner of each year
    1.Shift date(year), Batsman to rows
    2.Shift batman runs to columns
    3.Analysis -> created calculated -> ranks = RANK(SUM([Batsman Runs]))
    4.Add rank to rows -> rightclick = discrete -> rightclick - edit table calculation - specific dimensions - uncheck year of date
    5.Click ctrl and while doing that shift rank to filter and check only no.1
    6.Click on show me and change the graph type
    7.Shift batsman and batsman runs to label

b. map
1.lat-> rows, long->columns
2.city -> filters
3.city->colours, CNT(city)->labels, city->labels

c. Highest sixes in each year
Analysis -> created calculated -> sixes = IIF([Batsman Runs]==6,1,0) {to catch all 6’s}
    1.Add date and batsman to rows
    2.Sum of sixes to column -> descending order
    3.Analysis -> created calculated -> rank_sixes =RANK(SUM([sixes]))
    4.Convert rank_sixes to discrete and add to rows
    5.Add rank_sixes to rows -> rightclick - edit table calculation - specific dimensions - uncheck year of date
    6.Click ctrl and while doing that shift rank_sixes to filter and check only no.1
    7.Click on show me and change the graph type
    8.Shift batsman and sixes to label

d. Title winner of each year
    1.Add date to rows -> exact date - > discrete
    2.Add date to rows
    3.Analysis -> max_dates = [date]={fixed:max([date])}
    4.Drag max_date to filter -> true
    5.Put date to filter -> show filter -> single value drop down -> add to context
    6.Add winner to rows
    7.Remove all the date related fields from rows
    8.Drag winner to text
    9.Change view to entire view
