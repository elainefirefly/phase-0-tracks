// release 0
var colors = ["alice blue", "jet black", "gangrene green", "curry gold"];
var names = ["Skyla", "Beauty", "Zed", "Trump"];

colors.push("cotton candy pink");
names.push("Becky");

var horses = {};

for (let i = 0; i < names.length; i++ ) {
  horses[names[i]] = colors[i];
}

console.log(horses);

function Car(make, model, year, convertible) {
  this.make = make;
  this.model = model;
  this.year = year;
  this.convertible = convertible;
  this.start = function() {console.log("vroooom vroom!");};
}

// driver
var carOne = new Car("Toyota", "Camry", 2012, false);
var carTwo = new Car("Ford", "Pinto", 1970, false);
var carThree = new Car("Shelby", "Cobra", 1965, true);
var carFour = new Car("Bugatti", "Veyron", 2011, false);

// release 3.1 loop thru keys and values of an object

var carArray = [carOne, carTwo, carThree, carFour];

for (let i = 0; i < carArray.length; i++) {
  for(let [key,value] of Object.entries(carArray[i])) {
    console.log(key + ": " + value);
  }
}

// release 3.2

/*
Are there advantages to using constructor functions to create objects?
The advantage is that I can create several instances of that object
by merely supplying the values for each object property.

Disadvantages?
If I am only creating a singleton or a one instance object, then creating
a constructor function is unnecessary.
*/
