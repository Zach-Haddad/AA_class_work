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

	const DomNodeCollection = __webpack_require__ (1);

	window.$l = arg => {
	  let nodes = document.querySelectorAll(arg);
	  let nodesArray = Array.from(nodes);

	  switch (typeof(arg)) {
	    case "string":
	      return new DomNodeCollection(nodesArray);
	    case "object":
	      if (arg instanceof HTMLElement){
	        return new DomNodeCollection([arg]);
	      }
	  }
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DomNodeCollection {
	  constructor(nodes){
	    this.nodes = nodes;
	  }

	  each(cb){
	    this.nodes.forEach(cb);
	  }

	  html(html){
	    if (typeof html === "string") {
	      this.each(node => node.innerHTML = html);
	    } else {
	      return this.nodes[0].innerHTML;
	    }
	  }

	  empty(){
	    this.html("");
	  }

	  append(children){
	    if (typeof children === "string") {
	      this.each(node => node.innerHTML += children);
	    } else if (children instanceof DomNodeCollection) {
	      this.each(node => {
	        children.each(childNode => {
	          let dupChild = childNode;
	          node.appendChild(dupChild);
	        });
	      });
	    } else if (typeof children === "object") {
	      children = $l(children);
	    }
	  }

	  attr(key, val) {
	     if (typeof val === "string") {
	       this.each( node => node.setAttribute(key, val) );
	     } else {
	       return this.nodes[0].getAttribute(key);
	     }
	   }

	  addClass(className){
	    this.each(node => node.classList.add(className));
	  }

	  removeClass(className){
	    this.each(node => node.classList.remove(className));
	  }
	}

	module.exports = DomNodeCollection;


/***/ }
/******/ ]);