

	# each Given-When-Then block should have a Scenario tag describing what the topic is about
	# if possible, the Given statements should refer back to a previous Scenario.

	Scenario: A user enters a Query in the Query Field
		Given a User is on the front page of the DLR application
		And the user is not logged in
		When they type a Query in the Query Field
		Then they see the Query in the Query Field

	Scenario: A user searches for Resources
		Given A user enters a Query in the Query Field
		When they click Search
		Then they see a Result List of Resoures
		And they see options to sort by Filter
		And they see options to view by View Mode

	# A concept or something that is not concretely defined, should be named in Uppercase (query-field -> Query Field, search -> Search, result list -> Result List, resources -> Resources)

	Scenario: A user searches with descriptive metadata
		Given A user enters a Query in the Query Field
		And the Query contains descriptive metadata
		When they click Search
		Then they see a Result List based on that metadata

	# If there are more alternatives available for a scenario, Examples should be used to show which alternatives exist
	Scenario: A user searches for resources with a file type
		Given A user enters a Query in the Query Field
		And the Query contains text from a Resource of <Type>
		When they click Search
		Then they see a Result List with Resources with that <Type>
		Examples:
			| Type |
			| PDF  |
			| TXT  |
			| PPT  |
			| PDF  |

	Scenario: A user searches for Resources from a Registrator
		Given A user enters a Query in the Query Field
		And the Query contains the name of a Registrator
		When they click Search
		Then they see a Result List with Resources from the given Registrator

	Scenario: A user searches for Resources from an Institution
		Given A user enters a Query in the Query Field
		And the Query contains the name of an Institution
		When they click Search
		Then they see a Result List with Resources from the given Institution

	Scenario: A user sorts the Result List
		Given A user searches for Resources
		When they select a <Filter>
		Then the Result List is filtered based on that <Filter>
		Examples:
			| Filter                        |
			| Title (Descending)            |
			| Title (Ascending)             |
			| Publication date (Descending) |
			| Publication date (Ascending)  |

	Scenario: A user views the Result List
		Given A user searches for Resources
		When they select a <View Mode>
		Then the Result List is shown in that <View Mode>
		Examples:
			| View Mode |
			| Grid View |
			| List View |

	Scenario: A user views the Result List in Grid View
		Given A user views the Result List
		When the View Mode is Grid View
		Then each Result item in the Result List contains fields
			| Thumbnail |
			| Title     |

	Scenario: A user views the Result List in List View
		Given A user views the Result List
		When the View Mode is List View
		Then each Result item in the Result List contains fields
			| Thumbnail     |
			| Title         |
			| Main Author   |
			| Creation date |
			| Description   |
			| Tags          |

# If an anonymous user can do the same as all the scenarios above, the last scenario can be deleted, and an "And the user is not logged in" can be included in the "A user enters a Query in the Query Field" scenario
