const DomNodeCollection = require ('./dom_node_collection.js');

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
