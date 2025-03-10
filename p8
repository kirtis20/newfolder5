a. Total no.of constituencies in india
    1.Put count(Distinct) of pc names in label

b. Total no.of constituencies state wise in india
    1.Put Count(distinct) pc name in rows
    2.Put  state name in columns
    3.Put count(distinct) pc names in filter and select from 1 to whatever the last number is
    4.Put state name in colour
    5.Put Count(distinct) pc name in label
    6.Sort it in descending order

c. Total No. of Votes in maharashtra by each party
    1.Put state name and party name in columns
    2.Put SUM(Total) in rows
    3.Put state name in filter and select only maharashtra
    4.Put party name in colours
    5.Put SUM(Total) in label 
    6.Sort in descending order

d. Winner from each Constituency in Maharashtra
    1.Put state name, pc name, party name in columns
    2.Put SUM(Total) in rows
    3.Put state name in filter and select only maharashtra
    4.Create calculated field ‘rank’ -> RANK_UNIQUE(SUM([Total]),'desc')
    5.Convert it to discrete -> add to filters -> right click -> compute using -> Pane(across)
    6.Add party name to colours and SUM(Total) in label

e. No. of seats Party-Wise in Maharashtra
    1.drag party name to columns
    2.make calculated firld callwed 'winner' -> IF [Total] = {FIXED [Pc Name]:MAX([Total])} THEN[Party Name] END
    3.drag winner to rows and set the aggregation function to count
    4.filter the states to Maharashtra
    5.drag the count(winner) to labels
    6.party name->colours, party name->labels
