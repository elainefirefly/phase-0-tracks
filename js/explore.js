/*
Pseudocode:
Define a function called reverseString that takes a string
  Declare reversed string variable and set it as an empty string
  Iterate through the string parameter from the end to the beginning
    FOR each letter,
      add the letter to the reversed string variable
    END FOR
  Return the reversed string variable
End function
*/

function reverseString(originalString) {
  var reversedString = "";
  for (var i = originalString.length - 1; i >= 0; i--) {
    reversedString += originalString[i];
  }
  return reversedString;
}

//driver code
var ironyOfWords = reverseString("desserts");

if (ironyOfWords[0] == "s") {
  console.log(reverseString("desserts"));
}
