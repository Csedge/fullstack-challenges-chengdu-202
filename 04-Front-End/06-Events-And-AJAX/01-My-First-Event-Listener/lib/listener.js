// TODO: React to a click on the button!

const disableButtom = document.getElementById("clickme");
disableButtom.addEventListener("click", (event) => {
  clickme.disabled = true;
  clickme.innerHTML="Bingo!";
  var audio = new Audio('../sound.mp3');
  audio.play();
});
