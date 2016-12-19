// Spacerock. It inherits from MovingObject.
const Util = require("./util.js");
const MovingObject = require("./movingObject.js");

const DEFAULTS = {
  COLOR: "brown",
  RADIUS: 50,
  SPEED: 5
};

Util.inherits(Asteroid, MovingObject);

const Asteroid = function (options = {}) {
  options.color = DEFAULTS.color;
  options.radius = DEFAULTS.radius;
  options.centerX = DEFAULTS.color;
  options.centerY = DEFAULTS.color;

  // Other properties are filled in for you.
  // new Asteroid({ pos: [30, 30] });
};



// Return a randomly oriented vector with the given length.

module.exports = Asteroid;
