// release 0
/*
pseudocode:
Define a function called that takes an array of strings as a parameter
FUNCTION
  Declare a variable to store the current longest phrase
  FOR each phrase string in the array
    IF the phrase string length is longer than the current longest phrase stored in the variable THEN
      Replace the shorter phrase with the longer phrase
    END IF
  END FOR
  Return the longest phrase variable
END FUNCTION
*/

function findLongestPhrase(wordArray) {
	var longestPhrase = "";
	for (let i = 0; i < wordArray.length; i++) {
		if (typeof wordArray[i] === "string" && longestPhrase.length < wordArray[i].length) {
			longestPhrase = wordArray[i];
		}
	}
	return longestPhrase;
}

// driver code:
// release 0
console.log(findLongestPhrase(["long phrase", "longest phrase", "longer phrase"]));
console.log(findLongestPhrase(["carpe diem", "in vino veritas", "c'es la vie", "Deo favente"]));
console.log(findLongestPhrase(["DRY-ness", null]));
