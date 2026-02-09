import Transactions from "../features/transactions/Transactions.jsx";
import Budgets from "../features/budgets/Budgets.jsx";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Expense Tracker</h1>
        <Budgets />
        <Transactions />
      </header>
    </div>
  );
}

export default App;
