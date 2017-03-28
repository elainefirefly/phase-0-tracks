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
