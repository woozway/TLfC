import { useSelector } from "react-redux";
import { selectFlattenedTransactions } from "./transactionsSlice";
import TransactionForm from "../../components/TransactionForm.jsx";
import TransactionList from "../../components/TransactionList.jsx";

const Transactions = () => {
  const transactions = useSelector(selectFlattenedTransactions);
  return (
    <div className="comments-container">
      <TransactionList transactions={transactions} />
      <TransactionForm />
    </div>
  );
};

export default Transactions;
