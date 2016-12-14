/*
Write a function that takes three strings -
a verb, an adjective, and a noun - uppercases and
interpolates them into the sentence
 "We shall VERB the ADJECTIVE NOUN".

*/

function madLib(verb, adj, noun){
  console.log("We shall" + verb.toUpperCase() + "the " + adj.toUpperCase() + " " + noun.toUpperCase())
};

function isSubstring(searchString, subString){
  return searchString.includes(subString);
};

function fizzBuzz(arr){
  const res = [];
  var len = arr.length;
  for(var i = 0; i < len; i++){
    if ((arr[i] % 3 === 0 || arr[i] % 5 === 0) && (arr[i] % 15 !== 0)) {
      res.push(arr[i]);
    }
  }
  return res;
}


function isPrime(n){
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n){
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n){
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
}

function allOrNothing(mod, arr){
  for(let i = 0; i < arr.length; i++){
    if (arr[i] % mod !== 0) {
      return false;
    }
  }

  return true;
}
