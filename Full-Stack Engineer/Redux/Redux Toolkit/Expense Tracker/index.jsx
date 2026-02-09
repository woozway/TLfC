import { createRoot } from "react-dom/client";
import App from "./app/App.jsx";
import { Provider } from "react-redux";
import store from "./app/store";

const root = createRoot(document.getElementById("app"));
root.render(
  <Provider store={store}>
    <App />
  </Provider>
);
