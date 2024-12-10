import React from "react";
import styles from "./PendingRequests.module.css";
function PendingRequests() {
  const data = [
    {
      id: 42202021,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "علوم حاسب",
      actions: { accept: true, reject: true },
    },
    {
      id: 42202022,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "إدارة أعمال",
      actions: { accept: true, reject: true },
    },
    {
      id: 42202023,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "علوم حاسب",
      actions: { accept: true, reject: true },
    },
    {
      id: 42202023,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "علوم حاسب",
      actions: { accept: true, reject: true },
    },
    {
      id: 42202023,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "علوم حاسب",
      actions: { accept: true, reject: true },
    },
    {
      id: 42202023,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "علوم حاسب",
      actions: { accept: true, reject: true },
    },
    {
      id: 42202023,
      email: "42202021@hti.edu.eg",
      name: "إبراهيم محمد",
      dept: "علوم حاسب",
      actions: { accept: true, reject: true },
    },
    // Add more rows as needed
  ];

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
        {data.map((row, index) => (
          <tr key={index}>
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
            <td>{row.email}</td>
            <td>{row.name}</td>
            <td>{row.id}</td>
            <td>{row.dept}</td>
          </tr>
        ))}
      </tbody>
    </>
  );
}

export default PendingRequests;
