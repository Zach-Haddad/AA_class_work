function sum(){
  let argArray = Array.from(arguments);
  let total = 0;
  for (let i = 0; i < argArray.length; i++) {
    total += argArray[i];
  }
  return total;
}

function sumTwo(...args){
  let total = 0;
  for (let i = 0; i < args.length; i++) {
    total += args[i];
  }
  return total;
}

// Function.prototype.myBindArgs = function (ctx, arguments) {
//   let bindArgs = Array.prototype.slice.call(arguments);
//   return (callArgs) => {
//     this.apply(ctx, bindArgs);}
// };

Function.prototype.myBindArgs = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    this.apply(ctx, bindArgs.concat(callArgs));};
};


// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says.myBindArgs(breakfast, "meow", "Kush")();
//
// markov.says.myBindArgs(breakfast, "meow")("Markov");

function curriedSum(numArgs){
  let numbers = [];

  function _curriedSum(num){
  numbers.push(num);

  if (numbers.length === numArgs){
    let total = 0;
    for (let i = 0; i < numbers.length; i++) {
      total += numbers[i];
    }
    return total;
  } else {
    return _curriedSum;
    }
  }

  return _curriedSum;
}

//
// let curry = curriedSum(4);
// console.log(curry(1)(1)(1)(1));



// Function.prototype.curry = function(numArgs){
//   let argsArray = [];
//   let fn = this;
//   function _curry(args){
//     argsArray.push(args);
//     if (argsArray.length === numArgs){
//       fn.apply(null, argsArray);
//     } else {
//       return _curry;
//     }
//   }
//   return _curry;
// };



Function.prototype.curry = function(numArgs){
  let args = [];
  let fn = this;
  function _curry(arg){
    args.push(arg);
    if (args.length === numArgs){
      fn(...args);
    } else {
      return _curry;
    }
  }
  return _curry;
};

let x = function() { console.log("hi"); };

let newFunc = x.curry(3);
newFunc(1)(2)(3);
