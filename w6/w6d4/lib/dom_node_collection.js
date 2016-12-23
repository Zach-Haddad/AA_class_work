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

  children(){
    let childrenArr = [];
    this.each(node => {
      let newChildren = Array.from(node.children);
      childrenArr = childrenArr.concat(newChildren);
    });
    return new DomNodeCollection(childrenArr);
  }

  parents(){
    let parentArr = [];
    this.each(node => {
      parentArr.push(node.parentNode);
    });
    return new DomNodeCollection(parentArr);
  }

  find(selector){
    let res = [];
    this.each(node => {
      let selections = document.querySelectorAll(selector);
      res = res.concat(selections);
    });
    return new DomNodeCollection(res);
  }

  remove(){
    this.empty();
    this.nodes = new DomNodeCollection();
  }

  on(eventName, cb){
    this.each(node => {
      node.addEventListener(eventName, cb);
    });
  }

  off(eventName){
    this.each(node => {
      node.removeEventListener(eventName, cb);
    });
  }
}

module.exports = DomNodeCollection;
