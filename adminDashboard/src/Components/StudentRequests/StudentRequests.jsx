import React, { useEffect, useState } from "react";
import styles from "./StudentRequests.module.css";
import {
  faFileCircleCheck,
  faFileCircleExclamation,
  faFileCircleXmark,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import PendingRequests from "./PendingRequests/PendingRequests";
import AcceptedRequests from "./AcceptedRequests/AcceptedRequests";
import RejectedRequests from "./RejectedRequests/RejectedRequests";
function StudentRequests() {
  const [active, setActive] = useState("pending");

  const [students, setStudents] = useState([]); // State to store fetched data
  const [loading, setLoading] = useState(true); // State to handle loading
  const [error, setError] = useState(null); // State to handle errors

  // Fetch students from the API
  useEffect(() => {
    const token = localStorage.getItem("authToken"); // Retrieve token from storage

    const fetchStudents = async () => {
      try {
        const response = await fetch("/api/user/students", {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            token: `${token}`, // Ensure token is passed as Bearer
          },
        });

        if (!response.ok) {
          throw new Error(`Error: ${response.status} ${response.statusText}`);
        }

        const data = await response.json();
        setStudents(data.users); // Update state with the fetched data
        console.log(data.users);
        setLoading(false);
      } catch (err) {
        setError(err.message); // Handle errors
        setLoading(false);
      }
    };

    fetchStudents();
  }, []);

  return (
    <div className={`${styles.section}  `}>
      <div className="container">
        <ul
          className={`${styles["requests-status"]} row row-gap-2 justify-content-center mt-5 mt-sm-0`}
        >
          <div className="col-md-4 col-12 ">
            <li>
              <a
                href="#"
                onClick={() => {
                  setActive("pending");
                }}
                className={`${active === "pending" ? styles.active : ""} `}
              >
                <FontAwesomeIcon icon={faFileCircleExclamation} size={"lg"} />
                <h3 className="h4">طلبات قيد الانتظار</h3>
              </a>
            </li>
          </div>

          <div className="col-md-4 col-12 ">
            <li>
              <a
                href="#"
                onClick={() => {
                  setActive("accepted");
                }}
                className={`${active === "accepted" ? styles.active : ""}`}
              >
                <FontAwesomeIcon icon={faFileCircleCheck} size={"lg"} />
                <h3 className="h4">طلبات موافق عليها</h3>
              </a>
            </li>
          </div>

          <div className="col-md-4 col-12 ">
            <li>
              <a
                href="#"
                onClick={() => {
                  setActive("rejected");
                }}
                className={`${active === "rejected" ? styles.active : ""}`}
              >
                <FontAwesomeIcon icon={faFileCircleXmark} size={"lg"} />
                <h3 className="h4">طلبات مرفوضة</h3>
              </a>
            </li>
          </div>
        </ul>
        <div className="row">
          <div className="container my-4">
            <div className="table-responsive">
              <table
                className={`table  ${styles.parent} table-borderless text-center`}
              >
                {active === "pending" && (
                  <PendingRequests
                    students={students}
                    loading={loading}
                    error={error}
                  />
                )}
                {active === "accepted" && <AcceptedRequests />}
                {active === "rejected" && <RejectedRequests />}
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default StudentRequests;
