// release 0
/*
IMPORTANT: This will return the first longest phrase if there are multiple of the same length
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

// release 2
/*
IMPORTANT: I slightly made this release a bit more challenging by creating phrases instead of words.
I did this because I chose phrase as input for release 0
Pseudocode:
Define function that generates a random phrase that takes an array and the required number of phrases
FUNCTION
  LOOP to create the required number of phrases
    Create an empty array
    Determine the number of words for the phrase
    FOR the number of words
      Call the helper function that generates a word
      Put the word inside the empty array
    END FOR
    Connect all the words in the array with a space in between
    Put the string result inside the array passed as parameter to the function
  END LOOP
END FUNCTION
*/

function generateRandomPhrase(phraseArray, numberOfPhrase) {
  for (let i = 0; i < numberOfPhrase; i++) {
    phrase = [];
    numOfWords = Math.floor(Math.random() * 5) + 1;
    for (let j = 0; j < numOfWords; j++) {
      phrase.push(generateWord());
    }
    phraseArray.push(phrase.join(" "));
  }
}

/*
Pseudocode:
Define a function that generates a word
FUNCTION
  Generate a random word length
  Create a min variable to store the character code for "a"
  Create a max variable to store the character code for "z"
  Get the difference of the max and min variables
  Create an empty string called word
  LOOP using the number of letters required for the word
    Generate a string from the randomized char code and concatenate it to the word string
  END LOOP
  RETURN word
END FUNCTION
*/

function generateWord() {
  wordLength = Math.floor(Math.random() * 10 + 1);
  var min = "a".charCodeAt();
  var max = "z".charCodeAt();
  var diff = max - min;
  var word = "";
  for (let i = 0; i < wordLength; i++) {
    word += String.fromCharCode(Math.floor(Math.random(min,max) * diff) + min);
  }
  return word;
}

/*
Pseudocode:
Define a function to print the generated phrases that accepts the array of phrases
FUNCTION
  Print on console a heading of "The phrases generated are:"
  FOR each phrase of the array of phrases
    Print each phrase on the console
  END FOR
END FUNCTION
*/

function printGeneratedPhrases(phrases) {
  console.log("\n\nThe phrases generated are:")
  for (let phrase of phrases) {
    console.log(phrase);
  }
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

// release 2
for (let i = 0; i < 10; i++) {
  var phraseArray = [];
  generateRandomPhrase(phraseArray, Math.floor(Math.random() * 10) + 1);
  printGeneratedPhrases(phraseArray);
  console.log("\nLongest phrase: " + findLongestPhrase(phraseArray));
}
