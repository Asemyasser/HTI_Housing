import React, { useEffect, useState } from "react";
import styles from "./PendingRequests.module.css";
import { useOutletContext } from "react-router-dom";
import axios from "axios";

function PendingRequests() {
  const [filteredData, setFilteredData, setData] = useOutletContext();
  const [loadingButton, setLoadingButton] = useState(null);
  const [loading, setLoading] = useState(true); // State to handle loading
  const [error, setError] = useState(null); // State to handle errors

  const hanldeRequest = async (studentId, status) => {
    setLoadingButton(studentId);
    try {
      // Send the PATCH request to the API
      const response = await axios.patch(
        `${import.meta.env.VITE_API_BASE_URL}/auth/admin/${status}/${studentId}`
      );
      console.log(response.data);

      // Update the UI to reflect the changes (e.g., remove the approved request)
      setFilteredData((prevData) =>
        prevData.filter((student) => student._id !== studentId)
      );
    } catch (err) {
      console.error(
        "Error approving request:",
        err.response?.data || err.message
      );
    } finally {
      setLoadingButton(null);
    }
  };

  useEffect(() => {
    const token = localStorage.getItem("authToken");
    const fetchStudents = async () => {
      try {
        const response = await axios.get(
          `${import.meta.env.VITE_API_BASE_URL}/user/students`,
          {
            headers: {
              token: `${token}`,
            },
          }
        ); // Fetch data from the API

        setFilteredData(response.data.users);
        setData(response.data.users);

        console.log(response.data.users);
      } catch (err) {
        setError(err.response?.data?.message || err.message);
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchStudents();
  }, []);

  if (loading) return <p>...جاري تحميل البيانات</p>;
  if (error) return <p>Error: {error}</p>;

  return (
    <>
      <thead className="thead-dark">
        <tr>
          <th className="h4">الإجراءات</th>
          <th className="h4">الإيميل الجامعي</th>
          <th className="h4">الاسم</th>
          <th className="h4">ID</th>
          <th className="h4">القسم</th>
        </tr>
      </thead>
      <tbody>
        {filteredData.map((student) => (
          <tr key={student._id}>
            <td>
              <button
                className={`btn mx-1 rounded-pill px-4 ${styles.pendingBtn}`}
                onClick={() => hanldeRequest(student._id, "reject-student")}
                disabled={loadingButton === student._id}
              >
                رفض
              </button>
              <button
                className={`btn mx-1 my-1 my-sm-0 rounded-pill px-4 ${styles.pendingBtn}`}
                onClick={() => hanldeRequest(student._id, "approve-student")}
                disabled={loadingButton === student._id}
              >
                موافقة
              </button>
              {loadingButton && (
                <div className={styles.loadingOverlay}>
                  <div className={`${styles.loader}`}></div>
                </div>
              )}
            </td>
            <td>{student.email}</td>
            <td>{student.name}</td>
            <td>{student.ID}</td>
            <td>{student.department}</td>
          </tr>
        ))}
      </tbody>
    </>
  );
}

export default PendingRequests;
