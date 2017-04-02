// release 0
/*
pseudocode:
Define a function called that takes an array of strings as a parameter
FUNCTION
  Declare a variable to store the current longest phrase
  FOR each phrase string in the array
    IF the validated phrase string length is longer than the current longest phrase stored in the variable THEN
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

// release 1
/*
pseudocode:
Define a function that will take two objects as parameters
FUNCTION
  FOR each key-value pair in object 1 DO
    FOR each key-value pair in object 2 DO
      IF key 1 is equal to key 2 and value 1 is equal to value 2 THEN
        RETURN true
      END IF
    END FOR
  END FOR
  When no match is found, RETURN false
END FUNCTION
*/

function findIdenticalPair(object1, object2) {
  for (let [key1,value1] of Object.entries(object1)) {
    for (let [key2,value2] of Object.entries(object2)) {
      if (key1 === key2 && value1 === value2) {
        return true;
      }
    }
  }
  return false;
}

// driver code:
// release 0
console.log(findLongestPhrase(["long phrase", "longest phrase", "longer phrase"]));
console.log(findLongestPhrase(["carpe diem", "in vino veritas", "c'es la vie", "Deo favente"]));
console.log(findLongestPhrase(["DRY-ness", null]));

// release 1
//create objects
var iPhone6s = {"operating system": "iOS", price: 699.00, "battery life": 24, color: "rose gold"};
var saddleBag = {brand: "Coach", color: "olive", collection: "Coach 1941", price: 699.00};
var kingstonBoot = {"color": "olive", price: 172.00, material: "suede"};

console.log(findIdenticalPair(iPhone6s, saddleBag));
console.log(findIdenticalPair(iPhone6s, kingstonBoot));
console.log(findIdenticalPair(kingstonBoot, saddleBag));
