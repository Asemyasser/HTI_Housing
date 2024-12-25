import React, { useEffect } from "react";
import styles from "./Receipts.module.css";
import { Outlet, useNavigate, useOutletContext } from "react-router-dom";
import { use } from "react";

export const receiptData = [
  {
    id: 42202021,
    email: "42202021@hti.edu.eg",
    name: "إبراهيم محمد",
    dept: "علوم حاسب",
  },
  {
    id: 42202022,
    email: "42202021@hti.edu.eg",
    name: "عاصم ياسر",
    dept: "إدارة أعمال",
  },
  {
    id: 42202023,
    email: "42202021@hti.edu.eg",
    name: "يوسف تامر",
    dept: "هندسة",
  },
];

function Receipts() {
  const { filteredData, setFilteredData, setData, data } = useOutletContext();
  const navigate = useNavigate();

  const handleReceiptClick = (id) => {
    navigate(`/receipts/${id}`); // Navigate to the ReceiptDetails page
  };

  useEffect(() => {
    setData(receiptData);
    setFilteredData(receiptData);
  }, []);

  return (
    <div className="container">
      <div className="table-responsive">
        <table
          className={`table  ${styles.parent} table-borderless text-center`}
        >
          <thead className="thead-dark">
            <tr>
              <th className="h4">إجراءات</th>
              <th className="h4">الإيميل الجامعي</th>
              <th className="h4">الاسم</th>
              <th className="h4">ID</th>
              <th className="h4">القسم</th>
            </tr>
          </thead>
          <tbody>
            {filteredData.map((row, index) => (
              <tr key={index}>
                <td>
                  <button
                    className={`btn mx-1 rounded-pill px-4 ${styles.receiptBtn}`}
                    onClick={() => handleReceiptClick(row.id)}
                  >
                    عرض الإيصال
                  </button>
                </td>
                <td>{row.email}</td>
                <td>{row.name}</td>
                <td>{row.id}</td>
                <td>{row.dept}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default Receipts;
