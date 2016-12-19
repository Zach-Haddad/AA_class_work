// Holds collections of the asteroids, bullets, and your ship.
// Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.
// Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.

function Game (xDim, yDim) {
  this.xDim = xDim;
  this.yDim = yDim;
}

Game.NUM_ASTEROIDS = 20;

// Game.prototype.addAsteroids
// Game.prototype.randomPosition
// Game.prototype.draw(ctx)
// Game.prototype.moveObjects

module.exports = Game;
