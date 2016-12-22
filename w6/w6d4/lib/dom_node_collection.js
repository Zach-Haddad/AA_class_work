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
