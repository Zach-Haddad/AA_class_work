function mySum(...args) {
  let sum = 0;
  for (let i = 0; i < args.length; i++) {
    sum += args[i];
  }

  return sum;
}

console.log(mySum(1, 2, 3, 4) === 10);
console.log(mySum(1, 2, 3, 4, 5) === 15);

function myUniq(arr) {
  let res = [];
  for (let i = 0; i < arr.length; i++) {
    if (!res.includes(arr[i])){
      res.push(arr[i]);
    }
  }
  return res;
}
console.log(myUniq([1, 1, 2, 2, 3, 3, 4, 4, 5, 5])); // [1,2,3,4,5]

Array.prototype.myUnique = function () {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    if (!result.includes(this[i])){
    result.push(this[i]); }
  }
  return result;
};

console.log([1, 1, 2, 2, 3, 3, 4, 4, 5, 5].myUnique()); // [1,2,3,4,5]

function twoSum(arr) {
  let result = [];
  for (let i = 0; i < arr.length; i++) {
    for (let j = i+1; j < arr.length; j++) {
      if (arr[i] + arr[j] === 0){
        result.push([i, j]);
      }
    }
  }
  return result;
}

console.log(twoSum([-1, 0, 2, -2, 1])); // => [[0, 4], [2, 3]]

Array.prototype.twoSum = function () {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0){
        result.push([i, j]);
      }
    }
  }
  return result;
};

console.log([-1, 0, 2, -2, 1].twoSum()); // => [[0, 4], [2, 3]]


function myTranspose(arr) {
  let result = [];
  for (let i = 0; i < arr[0].length; i++) {
    let newRow = [];
    for (var j = 0; j < arr.length; j++) {
      newRow.push(arr[j][i]);
    }
    result.push(newRow);
  }
  return result;
}

console.log(myTranspose([
   [0, 1, 4, 5],
   [3, 4, 7, 8],
   [6, 7, 9, 2],
 ]));

 function myEach(arr, cb) {
   for (let i = 0; i < arr.length; i++) {
     cb(arr[i]);
   }
}
