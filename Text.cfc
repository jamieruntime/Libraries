component name = "Text"
{

	public string function textNumber(required numeric value, string textCase = "lower")
	{
		// Define an empty string
		var word = "";
		
		// Do we have word equivalent for this number?
		if(value == 0) {word = "zero";}
		if(value == 1) {word = "one";}
		if(value == 2) {word = "two";}
		if(value == 3) {word = "three";}
		if(value == 4) {word = "four";}
		if(value == 5) {word = "five";}
		if(value == 6) {word = "six";}
		if(value == 7) {word = "seven";}
		if(value == 8) {word = "eight";}
		if(value == 9) {word = "nine";}
		if(value == 10) {word = "ten";}
		
		// Apply the case
		if(len(word))
		{
			if(arguments.textCase == "upper") {return uCase(word);}
			else if(arguments.textCase == "title") {return uCase(left(word, 1)) & right(word, len(word) - 1);}
			return word;
		}
		
		// Return the number itself
		return "" & value;
	}

	public string function textPlural(required string word, required numeric value)
	{
		if(arguments.value == 1) {return word;}
		return word & "s";
	}

}