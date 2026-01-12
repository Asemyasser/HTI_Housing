import { useOutletContext } from "react-router-dom";
import { useStudents } from "../../../hooks/useStudents";

function RejectedRequests() {
  const [filteredData, setFilteredData, setData] = useOutletContext();

  // Fetch Rejected Students
  const { loading, error } = useStudents(
    "/user/students/rejected",
    setFilteredData,
    setData
  );

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
          <th scope="col" className="h4">
            رقم
          </th>
        </tr>
      </thead>
      <tbody>
        {filteredData && filteredData.length > 0 ? (
          filteredData.map((row, index) => (
            <tr key={row._id}>
              <td>{row.email}</td>
              <td>{row.name}</td>
              <td>{row.ID}</td>
              <td>{row.department}</td>
              <td>{index + 1}</td>
            </tr>
          ))
        ) : (
          <tr>
            <td colSpan="5" className="text-center py-4 text-muted">
              لا يوجد طلبات مرفوضة حالياً
            </td>
          </tr>
        )}
      </tbody>
    </>
  );
}

export default RejectedRequests;
