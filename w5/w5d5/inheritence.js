Function.prototype.inherits = function (parent) {
  function Surrogate(){}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject (speed) {
  this.speed = speed;
}

MovingObject.prototype.move = function() { console.log("moving"); };

function Ship (location) {
  this.location = location;

}
Ship.inherits(MovingObject);

function Asteroid (speed, location) {
  MovingObject.call(this, speed);
  this.location = location;

}
Asteroid.inherits(MovingObject);


let ast = new Asteroid(4, "y");
let spaceShip = new Ship("x");

ast.move();
console.log(ast.location);
console.log(ast.speed);
console.log(spaceShip.location);
