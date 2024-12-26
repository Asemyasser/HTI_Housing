import React from "react";

function RejectedRequests() {
  const data = [
    {
      id: 42202021,
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
          <th className="h4">الإيميل الجامعي</th>
          <th className="h4">الاسم</th>
          <th className="h4">ID</th>
          <th className="h4">القسم</th>
          <th className="h4">رقم</th>
        </tr>
      </thead>
      <tbody>
        {data.map((row, index) => (
          <tr key={index}>
            <td>{row.email}</td>
            <td>{row.name}</td>
            <td>{row.id}</td>
            <td>{row.dept}</td>
            <td>{index + 1}</td>
          </tr>
        ))}
      </tbody>
    </>
  );
}

export default RejectedRequests;
