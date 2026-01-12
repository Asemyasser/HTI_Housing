import styles from "./StudentRequests.module.css";
import {
  faFileCircleCheck,
  faFileCircleExclamation,
  faFileCircleXmark,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { NavLink, Outlet, useOutletContext } from "react-router-dom";

function StudentRequests() {
  const [filteredData, setFilteredData, setData] = useOutletContext();

  const getLinkClass = ({ isActive }) => `${isActive ? styles.active : ""} `;

  return (
    <div className={`${styles.section}`}>
      <div className="container">
        {/* Navigation Tabs */}
        <ul
          className={`${styles["requests-status"]} row row-gap-2 justify-content-center mt-5 mt-sm-0 list-unstyled`}
          aria-label="حالة الطلبات"
        >
          <li className="col-md-4 col-12 text-center">
            <NavLink to="/requests" end className={getLinkClass}>
              <FontAwesomeIcon
                icon={faFileCircleExclamation}
                size="lg"
                aria-hidden="true"
              />
              <h3 className="h4 ">طلبات قيد الانتظار</h3>
            </NavLink>
          </li>

          <li className="col-md-4 col-12 text-center">
            <NavLink to="/requests/accepted" className={getLinkClass}>
              <FontAwesomeIcon
                icon={faFileCircleCheck}
                size="lg"
                aria-hidden="true"
              />
              <h3 className="h4 ">طلبات موافق عليها</h3>
            </NavLink>
          </li>

          <li className="col-md-4 col-12 text-center">
            <NavLink to="/requests/rejected" className={getLinkClass}>
              <FontAwesomeIcon
                icon={faFileCircleXmark}
                size="lg"
                aria-hidden="true"
              />
              <h3 className="h4 ">طلبات مرفوضة</h3>
            </NavLink>
          </li>
        </ul>

        {/* Content Table */}
        <div className="row">
          <div className="container my-4">
            <div className="table-responsive">
              <table
                className={`table ${styles.parent} table-borderless text-center`}
              >
                {/* IMPORANT: 
                  Because <Outlet> is inside <table>, your child components 
                  (Pending, Accepted, Rejected) MUST return <thead> or <tbody>.
                  If they return <div>, the console will throw warnings.
                */}
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
