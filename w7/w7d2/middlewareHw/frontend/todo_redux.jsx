import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { applyMiddleware } from 'redux';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  const root = document.getElementById('content');
  const newStore = applyMiddlewares(store);
  ReactDOM.render(<Root store={store} />, root);
});

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};
