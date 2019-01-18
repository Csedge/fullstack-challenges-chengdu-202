// TODO: React to a click on the button!
//when q / p click, move 1 step on the table cell\
//
//when arrived to the final cell, win
//prompt: player_x win
//reset the game


let player1Step = 0;
let player2Step = 0;


document.addEventListener('keyup', function(e) {
  if (e.keyCode == 81){
    console.log("player1 is moving.");
    let player1Position = document.querySelector("#player1_race td.active");
    // console.log(player1Position);

    // player1Step = player1Step + 1;
    // player1Position[player1Step].classList.add('active');
    player1Position.nextElementSibling.classList.add('active');
    player1Step = player1Step + 1;
    player1Position.classList.remove("active");

    isFinish = player1Position.classList.value.includes("finish");
    isFinish ? alert("Player1 Win!") : "" ;
    // if (player1Position.classList.value === "finish"){
    //   alert("Player1 Win!");
    // };




  }else if(e.keyCode == 80){
    let player2Position = document.querySelector("#player2_race td.active");
    // console.log("player2 is moving.");
    player2Position.nextElementSibling.classList.add('active');
    player2Step = player2Step + 1;
    player2Position.classList.remove("active");
    isFinish = player2Position.classList.value.includes("finish");
    isFinish ? alert("Player2 Win!") : "" ;
  }

});



// let player1_pic = document.createElement('../images/player_1.png');
// let player2_pic = document.createElement('../images/player_2.png');
// left = function (element) {
//     var tr,          // current table row
//         cellSource,  // source cell
//         cellTarget,  // target cell
//         i;           // local variables
//     // find row where cell belongs
//     tr = findParent('TR', element);
//     // loop through cells
//     for (i = 1; i < tr.cells.length; i++) {
//         // define source and target cell
//         cellSource = tr.cells[i];
//         cellTarget = tr.cells[i - 1];
//         // move cells
//         relocate(cellSource, cellTarget);
//     }
// };

// const disableButtom = document.getElementById("clickme");
// disableButtom.addEventListener("click", (event) => {

// });



