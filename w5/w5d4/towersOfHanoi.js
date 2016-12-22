const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

class HanoiGame {
  constructor() {
    this.towers = [[3, 2, 1], [], []];
  }

  promptMove() {
    console.log(this.towers);
    reader.question("What's your from tower?", (res1) => {
      let startTowerIndex = res1;
    });
    reader.question("What's your to tower?", (res2) => {
      let endTowerIndex = res2;
    });
  }

  isValidMove(startTowerIndex, endTowerIndex) {
    let endTower = this.towers[endTowerIndex];
    let startTower = this.towers[startTowerIndex];
    if (startTower.length === 0) {
      return false;
    }
    if (endTower.length === 0) {
      return true;
    }

    return (endTower.slice(-1)[0] > startTower.slice(-1)[0]);
  }


  run() {
    //until game is over
    //ask player for valid move
    //execute the move
    //render board
    //congratulate them
  }

  move(startTowerIndex, endTowerIndex){
    if (this.isValidMove(startTowerIndex, endTowerIndex)){
      this.towers[endTowerIndex].push(this.towers[startTowerIndex].pop());
    }
  }

  isWon(){
    return (this.towers[1] === [3,2,1] || this.towers[2] === [3,2,1]);
  }
}

let game = new HanoiGame
game.isValidMove(0,1);
game.isValidMove(1,2);
