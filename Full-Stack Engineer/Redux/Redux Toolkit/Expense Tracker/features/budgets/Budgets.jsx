import { useSelector } from "react-redux";
import { selectBudgets } from "./budgetsSlice";
import Budget from "../../components/Budget.jsx";

const Transactions = () => {
  const budgets = useSelector(selectBudgets);
  return (
    <ul className="comments-container">
      {budgets.map((budget) => (
        <Budget budget={budget} key={budget.category} />
      ))}
    </ul>
  );
};

export default Transactions;
