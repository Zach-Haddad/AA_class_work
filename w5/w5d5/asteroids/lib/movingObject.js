// Base class for anything that moves.
// Most important methods are MovingObject.prototype.move, MovingObject.prototype.draw(ctx),
// MovingObject.prototype.isCollidedWith(otherMovingObject).

function MovingObject (options){
  this.centerX = options.centerX;
  this.centerY = options.centerY;
  this.velX = options.velX;
  this.velY = options.velY;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.centerX,
    this.centerY,
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.move = function(){
  this.centerX += this.velX;
  this.centerY += this.velY;
};

let canvas = document.getElementById('canvas');
let ctx = canvas.getContext("2d");
let obj = new MovingObject({centerX: 200, centerY: 300, radius: 100, color: "blue"});
obj.draw(ctx);

module.exports = MovingObject;
