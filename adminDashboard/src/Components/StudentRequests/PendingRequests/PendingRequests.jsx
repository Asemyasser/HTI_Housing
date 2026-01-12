import React from "react";
import styles from "./PendingRequests.module.css";
import { useOutletContext } from "react-router-dom";
import { useStudents } from "../../../hooks/useStudents";
import { useStudentActions } from "../../../hooks/useStudentActions";

function PendingRequests() {
  const [filteredData, setFilteredData, setData] = useOutletContext();

  // 1. Use Hook to Fetch Data
  const { loading, error } = useStudents(
    "/user/students",
    setFilteredData,
    setData
  );

  // 2. Use Hook to Handle Actions (Approve/Reject)
  const { handleAction, actionLoadingId } = useStudentActions(setFilteredData);

  if (loading)
    return (
      <tbody>
        <tr>
          <td colSpan="5" className="text-center py-5">
            ...جاري تحميل البيانات
          </td>
        </tr>
      </tbody>
    );

  if (error)
    return (
      <tbody>
        <tr>
          <td colSpan="5" className="text-danger text-center py-5">
            {error}
          </td>
        </tr>
      </tbody>
    );

  return (
    <>
      <thead className="thead-dark">
        <tr>
          <th scope="col" className="h4">
            الإجراءات
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
          filteredData.map((student) => (
            <tr key={student._id}>
              <td>
                <div className="d-flex justify-content-center align-items-center gap-2 position-relative">
                  <button
                    className={`btn rounded-pill px-4 ${styles.pendingBtn}`}
                    onClick={() => handleAction(student._id, "reject-student")}
                    disabled={actionLoadingId === student._id}
                    aria-label={`رفض الطالب ${student.name}`}
                  >
                    رفض
                  </button>
                  <button
                    className={`btn rounded-pill px-4 ${styles.pendingBtn}`}
                    onClick={() => handleAction(student._id, "approve-student")}
                    disabled={actionLoadingId === student._id}
                    aria-label={`موافقة على الطالب ${student.name}`}
                  >
                    موافقة
                  </button>

                  {actionLoadingId === student._id && (
                    <div
                      className={styles.loadingOverlay}
                      role="status"
                      aria-label="جاري التنفيذ..."
                    >
                      <div className={styles.loader}></div>
                    </div>
                  )}
                </div>
              </td>
              <td>{student.email}</td>
              <td>{student.name}</td>
              <td>{student.ID}</td>
              <td>{student.department}</td>
            </tr>
          ))
        ) : (
          <tr>
            <td colSpan="5" className="text-center py-4 text-muted">
              لا يوجد طلبات قيد الانتظار حالياً
            </td>
          </tr>
        )}
      </tbody>
    </>
  );
}

export default PendingRequests;
