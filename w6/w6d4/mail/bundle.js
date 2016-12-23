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
/***/ function(module, exports, __webpack_require__) {

	let Router = __webpack_require__(1);
	// let Compose = require("./compose");
	let Inbox = __webpack_require__(4);
	// let Sent = require("./sent");

	let routes = {
	  // compose: Compose,
	  inbox: Inbox,
	  // sent: Sent
	};


	document.addEventListener("DOMContentLoaded", () => {
	  let content = document.querySelector(".content");
	  let router = new Router(content, routes);
	  router.start();

	  let navItems = Array.from(document.querySelectorAll(".sidebar-nav"));
	  navItems.forEach(navItem => {
	    navItem.addEventListener("click", () => {
	      let name = navItem.innerText.toLowerCase();
	      window.location.hash = name;
	    });
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor(node){
	    this.node = node;
	    this.routes = routes;
	  }

	  start(){
	    this.render();
	    window.addEventListener("hashchange", () =>{
	      this.render();
	    });
	  }

	  activeRoute(){
	    let hashFrag = window.location.hash.substr(1);
	    let component = this.routes[hashFrag];
	    return component;

	  }

	  render(){
	    this.node.innerHTML = "";
	    let route = this.activeRoute();
	    let newNode = document.createElement("p");
	    newNode.innerHTML = route;
	    if(route) {
	      this.node.appendChild(route.render());
	    }
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */,
/* 3 */,
/* 4 */
/***/ function(module, exports) {

	class Inbox {

	}

	module.exports = Inbox;


/***/ }
/******/ ]);