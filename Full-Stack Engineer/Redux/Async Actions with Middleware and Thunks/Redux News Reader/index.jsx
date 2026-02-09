import React from "react";
import { createRoot } from "react-dom/client";
import App from "./app/App";
import store from "./app/store";
import { Provider } from "react-redux";
import { worker } from "./mocks/browser";
import "./app/App.css";

const root = createRoot(document.getElementById("root"));

// Start MSW worker
worker.start();

root.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);
