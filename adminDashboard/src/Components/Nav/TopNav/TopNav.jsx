import { faBars, faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import { faBell } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import styles from "./TopNav.module.css";
import React, { useState } from "react";
import notificationsBell from "../../../assets/imgs/notificationBell.png";

function TopNav({ collapsed, setCollapsed, title }) {
  const [showNotifications, setShowNotifications] = useState(false);

  const toggleSidebar = () => {
    setCollapsed((prev) => !prev);
  };

  const toggleNotifications = () => {
    setShowNotifications((prev) => !prev);
  };

  return (
    <>
      <div className={`${styles.lightBg}`}></div>

      <div className={`${styles.topNav} ${collapsed ? styles.collapsed : ""} `}>
        <div className="container-fluid">
          <div className="row align-items-center ">
            <div className="col-sm-7 col-12">
              <div className="d-flex flex-column flex-sm-row align-items-center justify-content-center justify-content-sm-start gap-md-5 gap-3">
                <button
                  onClick={toggleSidebar}
                  className={`${styles.toggleButton} order-1 order-sm-0`}
                  aria-expanded={!collapsed}
                  aria-label="Toggle navigation"
                >
                  <FontAwesomeIcon icon={faBars} />
                </button>
                <h1 className={`${styles.title} mb-0 h2`}>{title}</h1>
              </div>
            </div>

            <div className="col-sm-5 col-12">
              <div
                className={`${styles.icons} d-flex gap-5 align-items-center  justify-content-between justify-content-sm-end`}
              >
                <FontAwesomeIcon icon={faMagnifyingGlass} size="lg" />
                <FontAwesomeIcon
                  icon={faBell}
                  size="lg"
                  onClick={toggleNotifications}
                  className={`${styles.bellIcon} ${
                    showNotifications ? styles.active : ""
                  }`}
                />
              </div>
            </div>
          </div>
        </div>
        {showNotifications && (
          <div className={`${styles.notifications}`}>
            <img src={notificationsBell} alt="Bell" />
            <p className="h4">لا يوجد إشعارات حالياً</p>
          </div>
        )}
      </div>
    </>
  );
}

export default TopNav;
