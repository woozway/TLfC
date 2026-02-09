import React from "react";

import { Inventory } from "../features/inventory/Inventory.jsx";
import { CurrencyFilter } from "../features/currencyFilter/CurrencyFilter.jsx";
// Import the Cart component here.
import { Cart } from "../features/cart/Cart.jsx";
import { SearchTerm } from "../features/searchTerm/SearchTerm.jsx";

// Render the Cart component below <Inventory />
export const App = (props) => {
  const { state, dispatch } = props;

  return (
    <div>
      <CurrencyFilter
        currencyFilter={state.currencyFilter}
        dispatch={dispatch}
      />

      <SearchTerm
        searchTerm={state.searchTerm}
        dispatch={dispatch}
      />

      <Inventory
        inventory={state.inventory}
        currencyFilter={state.currencyFilter}
        searchTerm={state.searchTerm}
        dispatch={dispatch}
      />

      <Cart
        cart={state.cart}
        currencyFilter={state.currencyFilter}
        dispatch={dispatch}
      />
    </div>
  );
};
