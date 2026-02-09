// Initial state for search term
const initialSearchTerm = "";

// Reducer function
export const searchTermReducer = (searchTerm = initialSearchTerm, action) => {
  switch (action.type) {
    case "searchTerm/setSearchTerm": {
      return action.payload;
    }
    case "searchTerm/clearSearchTerm": {
      return "";
    }
    default: {
      return searchTerm;
    }
  }
};

// Action creator: setSearchTerm
export const setSearchTerm = (term) => {
  return {
    type: "searchTerm/setSearchTerm",
    payload: term,
  };
};

// Action creator: clearSearchTerm
export const clearSearchTerm = () => {
  return {
    type: "searchTerm/clearSearchTerm",
  };
};
