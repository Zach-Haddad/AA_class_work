/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);