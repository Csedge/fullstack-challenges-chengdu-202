function evenOrOdd(number) {
  // TODO: this should return "even" if the number is even, "odd" otherwise


  if ((number%2) == 0) {
    return "even";
  }
  // else if(number == 2){
  //   return "even"
  // }
  else{
    return "odd";
  }
}

module.exports = evenOrOdd; // Do not remove. We need this for the spec to know about your method.
