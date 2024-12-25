import React, { useEffect, useState } from "react";
import styles from "./PendingRequests.module.css";
import { useOutletContext } from "react-router-dom";

function PendingRequests() {
  const [filteredData, setFilteredData, loading, error] = useOutletContext();
  if (loading) return <p>...جاري تحميل البيانات</p>; // Show loading state
  // if (error) return <p>Error: {error}</p>; // Show error state

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
              >
                رفض
              </button>
              <button
                className={`btn mx-1 my-1 my-sm-0 rounded-pill px-4 ${styles.pendingBtn}`}
              >
                قبول
              </button>
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
