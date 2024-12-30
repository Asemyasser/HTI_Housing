import React, { useEffect, useState } from "react";
import styles from "./Receipts.module.css";
import { useNavigate, useOutletContext } from "react-router-dom";
import axios from "axios";

function Receipts() {
  const { filteredData, setFilteredData, setData } = useOutletContext();
  const navigate = useNavigate();

  const [loadingButton, setLoadingButton] = useState(null);
  const [loading, setLoading] = useState(true); // State to handle loading
  const [error, setError] = useState(null); // State to handle errors

  const handleReceiptClick = (id) => {
    navigate(`/receipts/${id}`); // Navigate to the ReceiptDetails page
  };

  useEffect(() => {
    const token = localStorage.getItem("authToken");
    const fetchReceipts = async () => {
      try {
        const response = await axios.get(
          `${import.meta.env.VITE_API_BASE_URL}/payment/PendingPayment`,
          {
            headers: {
              token: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzY2YjZjZGQzMTYxYzc1YWYwYWQ4M2IiLCJlbWFpbCI6InlvdXNmdGFtZXIxMUBnbWFpbC5jb20iLCJyb2xlIjoic3R1ZGVudCIsImlhdCI6MTczNDc4NDg0Mn0.KLo76IBdty3i_P96l1hLMNGwa2S-2DOLYSw-RU9u-aQ`,
            },
          }
        ); // Fetch data from the API

        setFilteredData(response.data.data);
        setData(response.data.data);
        console.log(response.data.data);
      } catch (err) {
        setError(err.response?.data?.message || err.message);
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchReceipts();
  }, []);

  if (loading)
    return (
      <p className="d-flex justify-content-center align-items-center">
        ...جاري تحميل البيانات
      </p>
    );
  if (error)
    return (
      <p className="d-flex justify-content-center align-items-center">
        Error: {error}
      </p>
    );

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
            {filteredData.map((row) => (
              <tr key={row._id}>
                <td>
                  <button
                    className={`btn mx-1 rounded-pill px-4 ${styles.receiptBtn}`}
                    onClick={() => handleReceiptClick(row._id)}
                  >
                    عرض الإيصال
                  </button>
                  {loadingButton && (
                    <div className={styles.loadingOverlay}>
                      <div className={`${styles.loader}`}></div>
                    </div>
                  )}
                </td>
                <td>{row.booking.student.email}</td>
                <td>{row.booking.student.name}</td>
                <td>{row.booking.student.ID}</td>
                <td>{row.booking.student.department}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default Receipts;
