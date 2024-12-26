import React, { useEffect, useState } from "react";
import styles from "./StudentRequests.module.css";
import {
  faFileCircleCheck,
  faFileCircleExclamation,
  faFileCircleXmark,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import { Link, Outlet, useLocation, useOutletContext } from "react-router-dom";
export const DATA = [
  {
    _id: 1,
    email: "42020218@hti.edu.eg",
    name: "محمد فوزي",
    dept: "علوم حاسب",
    ID: 42020218,
    actions: { accept: true, reject: true },
  },
  {
    _id: 2,
    email: "42021288@hti.edu.eg",
    name: "عاصم ياسر ",
    dept: "إدارة أعمال",
    ID: 42021288,
    actions: { accept: true, reject: true },
  },
  {
    _id: 3,
    email: "42022012@hti.edu.eg",
    name: "أحمد مهدي",
    dept: "علوم حاسب",
    ID: 42022012,
    actions: { accept: true, reject: true },
  },
  {
    _id: 4,
    email: "42023340@hti.edu.eg",
    name: "عبدالله أباظة",
    dept: "علوم حاسب",
    ID: 42023340,

    actions: { accept: true, reject: true },
  },
  {
    _id: 5,
    email: "42024120@hti.edu.eg",
    name: "يوسف تامر",
    dept: "هندسة",
    ID: 42024120,
    actions: { accept: true, reject: true },
  },
  // Add more rows as needed
];
function StudentRequests() {
  const { filteredData, setFilteredData, data, setData } = useOutletContext();
  const location = useLocation();
  const [active, setActive] = useState(""); // State to handle active tab
  const [students, setStudents] = useState([]); // State to store fetched data
  const [loading, setLoading] = useState(true); // State to handle loading
  const [error, setError] = useState(null); // State to handle errors
  // const token = localStorage.getItem("authToken"); // Retrieve token from storage

  // Fetch students from the API
  // setFilteredData(response.data.users);
  useEffect(() => {
    setFilteredData(DATA);
    setData(DATA);

    const fetchStudents = async () => {
      try {
        const response = await axios.get("/api/user/students"); // Fetch data from the API

        setStudents(response.data.users); // Update state with the fetched data
        console.log(response.data.users);
      } catch (err) {
        setError(err.response?.data?.message || err.message); // Handle errors
        console.error(err);
        console.log(students);
      } finally {
        setLoading(false);
      }
    };

    const pathToLinkMap = {
      "/requests": "pending",
      "/requests/accepted": "accepted",
      "/requests/rejected": "rejected",
    };
    setActive(pathToLinkMap[location.pathname] || "");

    fetchStudents();
  }, [location.pathname]);

  return (
    <div className={`${styles.section}  `}>
      <div className="container">
        <ul
          className={`${styles["requests-status"]} row row-gap-2 justify-content-center mt-5 mt-sm-0`}
        >
          <div className="col-md-4 col-12 ">
            <li>
              <Link
                to="/requests"
                onClick={() => {
                  setActive("pending");
                }}
                className={`${active === "pending" ? styles.active : ""} `}
              >
                <FontAwesomeIcon icon={faFileCircleExclamation} size={"lg"} />
                <h3 className="h4">طلبات قيد الانتظار</h3>
              </Link>
            </li>
          </div>

          <div className="col-md-4 col-12 ">
            <li>
              <Link
                to="/requests/accepted"
                onClick={() => {
                  setActive("accepted");
                }}
                className={`${active === "accepted" ? styles.active : ""}`}
              >
                <FontAwesomeIcon icon={faFileCircleCheck} size={"lg"} />
                <h3 className="h4">طلبات موافق عليها</h3>
              </Link>
            </li>
          </div>

          <div className="col-md-4 col-12 ">
            <li>
              <Link
                to="/requests/rejected"
                onClick={() => {
                  setActive("rejected");
                }}
                className={`${active === "rejected" ? styles.active : ""}`}
              >
                <FontAwesomeIcon icon={faFileCircleXmark} size={"lg"} />
                <h3 className="h4">طلبات مرفوضة</h3>
              </Link>
            </li>
          </div>
        </ul>
        <div className="row">
          <div className="container my-4">
            <div className="table-responsive">
              <table
                className={`table  ${styles.parent} table-borderless text-center`}
              >
                <Outlet
                  context={[filteredData, setFilteredData, loading, error]}
                />
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default StudentRequests;
