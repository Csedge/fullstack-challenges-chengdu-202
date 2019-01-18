/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practise. Each time you make some progress in software
// development, you want to save a snapshot.


module.exports = function runChallenges(check) {
  // Ex 1. Read what's written in the email input
  //       Make the function getEmail() return it

  function getEmail() {
    // TODO: return the email
    // let re = /\S+@\S+\.\S+/;
    // if (re.test(check) == true){
    //   return check;
    // }
    const emailStore = document.querySelector("#email");
    return emailStore.value;
  }

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const borisesEmail = getEmail();

  // Ex 2. Change the content of the email input by writing your own email address

  const emailInput = document.getElementById("email");

  // Read
  // console.log(emailInput.value);

  // Write
  emailInput.value = "keiveniscool@gmail.com";


  // Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  //       The text should be emphasized using a <strong> tag

  const emailHint = document.querySelector("#email-hint");
  emailHint.innerHTML = "<strong>This is my email now</strong>";


  // Ex 4. Add the .blue CSS class to the th elements
  const tableBlue = document.querySelectorAll('th')
  // const tableBlue2 = document.querySelectorAll('table th')
  // console.log(tableBlue);
  // console.log(tableBlue2);
  tableBlue.forEach((th) => {
    th.classList.add("blue");
  });

  // Ex 5. Count the number of table body rows there are
  //       Make the function teamCount() return it
  function teamCount() {
    // TODO: return the number of teams
    const numTeamCount = document.querySelectorAll('.table tbody tr')
    return (numTeamCount.length);
  }

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const teamCountBeforeAddition = teamCount();

  // Ex 6. Say there is a 15th team added to the table.
  //       Add a row at the bottom, this new team should have zero points.
  // list.insertAdjacentHTML("beforeend", "<li>Luke</li>");
  // list.insertAdjacentHTML("beforeend", "<li>Anakin</li>");
  function summarizePoints() {
    // TODO: return the sum
    addedTeam = document.querySelector('.table tbody');
    addedTeam.insertAdjacentHTML("beforeend","<tr><td>15</td><td>Hello World</td><td>0</td></tr>")
    console.log(addedTeam);
  }


  // Ex 7. Write some code to sum all points given to all teams
  //       Make the function summarizePoints() return it




  // Ex 8. Change the background color of all table header cells to #DDF4FF



  // Ex 9. Remove the "Email:" label from the DOM










  // Checking exercise answers. DO NOT MODIFY THIS LINE
  check(borisesEmail, teamCountBeforeAddition, summarizePoints());
};
