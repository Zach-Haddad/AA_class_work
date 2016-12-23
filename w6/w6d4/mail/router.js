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
