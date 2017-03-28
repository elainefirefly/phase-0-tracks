var colors = ["blue", "black", "gangrene", "gold"];
var names = ["Skyla", "Beauty", "Zed", "Trump"];

colors.push("pink");
names.push("Becky");

var horses = {};

for (var i = 0; i < names.length; i++ ) {
  horses[names[i]] = colors[i];
  //console.log(names[i] + " " + horses[names[i]]);
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

var carArray = [carOne, carTwo, carThree, carFour];

for (var i = 0; i < carArray.length; i++) {
  console.log(carArray[i]);
}
