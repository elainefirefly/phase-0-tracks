console.log("Connected");

function showGifs() {
  dramaCover.nextSibling.toggle('visible');
}

var dramaCover = document.getElementsByClassName('cover');
dramaCover.addEventListener("click", showGifs);
