const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const SWITCH_CURRENCY = "SWITCH_CURRENCY";

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case SWITCH_CURRENCY:
      return {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      };
    default:
      return state;
  }
};

export default reducer;
