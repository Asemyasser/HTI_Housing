import React, { useEffect, useState } from "react";
import styles from "./StudentRequests.module.css";
import {
  faFileCircleCheck,
  faFileCircleExclamation,
  faFileCircleXmark,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Link, Outlet, useLocation, useOutletContext } from "react-router-dom";

function StudentRequests() {
  const { filteredData, setFilteredData, setData } = useOutletContext();
  const location = useLocation();
  const [active, setActive] = useState("");

  useEffect(() => {
    const pathToLinkMap = {
      "/requests": "pending",
      "/requests/accepted": "accepted",
      "/requests/rejected": "rejected",
    };
    setActive(pathToLinkMap[location.pathname] || "");
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
                <Outlet context={[filteredData, setFilteredData, setData]} />
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default StudentRequests;
