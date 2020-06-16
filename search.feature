
Scenario: A user searches for resources
	Given a User is on the front page of the DLR-application
	When they enters a query in the query-field
	And they click search
	Then they see a resultlist of resoures 


Given a User enters a query in the query-field
When they enter a query that contains descriptive metadata 
And they click search
Then they get results based on that metadata

Given a User enters a query in the query-field
When they enter a query that contains text from a resource document of the type PDF, TXT, PPT or PDF
And they click search
Then they get results from those documents

Given a User enters a query in the query-field
When they enter a query that contains the name of a registrator
And they click search
Then they get results from the the given Registrator

Given a User enters a query in the query-field
When they enter a query that contains the name of a Institution
And they click search
Then they get results from the the given Institution

Given a User can see a resultlist 
And they are presented with the choice to sort by:
      | Title (Descending)            |
      | Title (Ascending)     	      |
      | Publication date (Descending) |
      | Publication date (Ascending)  |      
WHen they select one of the sorting mechanisms
Then the resultlist is reordered

Given a User can see a resultlist 
And they are presented with the choice to show the result by: 
	| Grid View |
	| List View |
When they select one of the presentation modes
Then the resultlist is redrawed

Given a User can see a resultlist
When the resultList is shown as Grid View
Then each result item contains Thumbnail and Title.

Given a User can see a resultlist
When the resultList is shown as List View
Then each result item contains Thumbnail, Title, Main Author, Creation date, Description and Tags

Scenario: Anonomys users can search
	Given a User is not logged in
	When they searches for resources
	Then they can see a list of resources 
