component name = "Date"
{
	
	remote date function dateAddWeekday(required date original, required numeric amount)
	{
		// Define result date
		var result = original;
		
		// Calculate positive number of days to move
		var count = amount;
		var move = 1;
		var direction = "FORWARD";
		if(amount < 0)
		{
			count = 0 - amount;
			move = -1;
			direction = "BACKWARD";
		}
		
		// Iterate through days
		for(var x = 1; x <= count; x++)
		{
			// Move the date
			result = dateAdd("d", move, result);
			
			// Sunday
			if(dayOfWeek(result) == 1)
			{
				if(direction == "FORWARD") {result = dateAdd("d", 1, result);}
				if(direction == "BACKWARD") {result = dateAdd("d", -2, result);}
			}
			
			// Saturday
			else if(dayOfWeek(result) == 7)
			{
				if(direction == "FORWARD") {result = dateAdd("d", 2, result);}
				if(direction == "BACKWARD") {result = dateAdd("d", -1, result);}
			}
		}
		
		// Return result datetime
		return result;
	}
	
	remote date function getDayTimeEnd(required date original)
	{
		return createDateTime(year(arguments.original), month(arguments.original), day(arguments.original), 23, 59, 59);
	}
	
	remote date function getDayTimeStart(required date original)
	{
		return createDateTime(year(arguments.original), month(arguments.original), day(arguments.original), 0, 0, 0);
	}

	remote string function getOrdinalIndicator(required numeric day)
	{
		if(day == 1 || day == 21 || day == 31) {return "st";}
		if(day == 2 || day == 22) {return "nd";}
		if(day == 3 || day == 23) {return "rd";}
		return "th";
	}

}