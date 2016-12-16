// //one
//
// window.setTimeout(function () {
//   alert('HAMMER TIME!');
// }, 5000);
//
// //two
//
// function hammerTime (time) {
//   window.setTimeout(function () {
//     alert(`${time} is HAMMER TIME!`);
//   });
// }

// //three
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits?', function (res2) {
      console.log(`You replied ${res2}.`);
      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
    });
  });
}

// four

// function Cat () {
//     this.name = 'Markov';
//     this.age = 3;
//   }
//
//   function Dog () {
//     this.name = 'Noodles';
//     this.age = 4;
//   }
//
//   Dog.prototype.chase = function (cat) {
//     console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
//   };
//
//   const Markov = new Cat ();
//   const Noodles = new Dog ();

// Noodles.chase(Markov);
//
// Noodles.chase.call(Markov, Noodles);
// Noodles.chase.apply(Markov, [Noodles]);
