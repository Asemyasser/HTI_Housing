import axios from "axios";
import React, { useEffect, useState } from "react";
import { useOutletContext } from "react-router-dom";

function AcceptedRequests() {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [filteredData, setFilteredData, setData] = useOutletContext();

  useEffect(() => {
    const token = localStorage.getItem("authToken"); // Retrieve token from storage
    const fetchApprovedStudents = async () => {
      try {
        const response = await axios.get(
          `${import.meta.env.VITE_API_BASE_URL}/user/students/approved`,
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
        setError(err.response?.data?.message || err.message); // Handle errors
        console.error(err);
      } finally {
        setLoading(false);
      }
    };
    fetchApprovedStudents();
  }, []);

  if (loading) return <p>...جاري تحميل البيانات</p>; // Show loading state
  if (error) return <p>Error: {error}</p>; // Show error state

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
        {filteredData.map((row, index) => (
          <tr key={row._id}>
            <td>{row.email}</td>
            <td>{row.name}</td>
            <td>{row.ID}</td>
            <td>{row.department}</td>
            <td>{index + 1}</td>
          </tr>
        ))}
      </tbody>
    </>
  );
}

export default AcceptedRequests;
