function sumOfNegative(numbers) {
  // TODO: You are getting an array `numbers`. Return the sum of **negative** numbers only.
  const negative = numbers.filter(function (a) { return a < 0; }),
  sum = negative.reduce(function (a, b) { return a + b; }, 0);
  return sum;
}

module.exports = sumOfNegative; // Do not remove.


