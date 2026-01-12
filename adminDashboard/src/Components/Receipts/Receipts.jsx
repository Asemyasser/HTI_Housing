import React from "react";
import styles from "./Receipts.module.css";
import { useNavigate, useOutletContext } from "react-router-dom";
import { useReceipts } from "../../hooks/useReceipts";

function Receipts() {
  const [filteredData, setFilteredData, setData] = useOutletContext();
  const navigate = useNavigate();

  // Use custom hook
  const { loading, error } = useReceipts(setFilteredData, setData);

  const handleReceiptClick = (id) => {
    navigate(`/receipts/${id}`);
  };

  if (loading)
    return (
      <div className="container">
        <div className="table-responsive">
          <table
            className={`table ${styles.parent} table-borderless text-center`}
          >
            <tbody>
              <tr>
                <td colSpan="5" className="text-center py-5">
                  ...جاري تحميل البيانات
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    );

  if (error)
    return (
      <div className="container">
        <div className="table-responsive">
          <table
            className={`table ${styles.parent} table-borderless text-center`}
          >
            <tbody>
              <tr>
                <td colSpan="5" className="text-danger text-center py-5">
                  Error: {error}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    );

  return (
    <div className="container">
      <div className="table-responsive">
        <table
          className={`table ${styles.parent} table-borderless text-center`}
        >
          <thead className="thead-dark">
            <tr>
              <th scope="col" className="h4">
                إجراءات
              </th>
              <th scope="col" className="h4">
                الإيميل الجامعي
              </th>
              <th scope="col" className="h4">
                الاسم
              </th>
              <th scope="col" className="h4">
                ID
              </th>
              <th scope="col" className="h4">
                القسم
              </th>
            </tr>
          </thead>
          <tbody>
            {filteredData && filteredData.length > 0 ? (
              filteredData.map((row) => (
                <tr key={row._id}>
                  <td>
                    <button
                      className={`btn mx-1 rounded-pill px-4 ${styles.receiptBtn}`}
                      onClick={() => handleReceiptClick(row._id)}
                      aria-label={`عرض إيصال الطالب ${
                        row.booking?.student?.name || "غير معروف"
                      }`}
                    >
                      عرض الإيصال
                    </button>
                  </td>
                  <td>{row.booking?.student?.email || "N/A"}</td>
                  <td>{row.booking?.student?.name || "N/A"}</td>
                  <td>{row.booking?.student?.ID || "N/A"}</td>
                  <td>{row.booking?.student?.department || "N/A"}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="5" className="text-center py-4">
                  لا يوجد إيصالات حالياً
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default Receipts;
