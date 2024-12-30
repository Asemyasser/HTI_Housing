import {
  faBars,
  faMagnifyingGlass,
  faReceipt,
  faTrashAlt,
  faUsers,
} from "@fortawesome/free-solid-svg-icons";
import { faBell } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import styles from "./TopNav.module.css";
import React, { useEffect, useState } from "react";
import notificationsBell from "../../../assets/imgs/notificationBell.png";
import { useNavigate } from "react-router-dom";
import axios from "axios";

function TopNav({ collapsed, setCollapsed, title, onSearch, searchQuery }) {
  const [showNotifications, setShowNotifications] = useState(false);
  const [showSearchBar, setShowSearchBar] = useState(false);
  const [notifications, setNotifications] = useState([]);
  const navigate = useNavigate();

  const token = localStorage.getItem("authToken");

  useEffect(() => {
    const fetchNotifications = async () => {
      try {
        const [requestsResponse, receiptsResponse] = await Promise.all([
          axios.get(`${import.meta.env.VITE_API_BASE_URL}/user/students`, {
            headers: { token: `${token}` },
          }),
          axios.get(
            `${import.meta.env.VITE_API_BASE_URL}/payment/pendingPayment`,
            {
              headers: {
                token: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzY2YjZjZGQzMTYxYzc1YWYwYWQ4M2IiLCJlbWFpbCI6InlvdXNmdGFtZXIxMUBnbWFpbC5jb20iLCJyb2xlIjoic3R1ZGVudCIsImlhdCI6MTczNDc4NDg0Mn0.KLo76IBdty3i_P96l1hLMNGwa2S-2DOLYSw-RU9u-aQ`,
              },
            }
          ),
        ]);
        console.log(requestsResponse);
        console.log(receiptsResponse);

        const requests = requestsResponse.data.users.map((item) => ({
          type: "request",
          timestamp: item.createdAt || new Date().toISOString(),
        }));

        const receipts = receiptsResponse.data.data.map((item) => ({
          type: "receipt",
          timestamp: item.createdAt || new Date().toISOString(),
        }));

        const fetchedNotifications = [...requests, ...receipts];
        const storedNotifications =
          JSON.parse(localStorage.getItem("notifications")) || [];

        // Retrieve the deleted list
        const deletedList =
          JSON.parse(localStorage.getItem("deletedNotifications")) || [];

        // Filter out deleted notifications
        const allNotifications = [
          ...storedNotifications,
          ...fetchedNotifications,
        ].filter(
          (notif) => !deletedList.includes(notif.timestamp) // Match by unique identifier
        );

        setNotifications(allNotifications);
        localStorage.setItem("notifications", JSON.stringify(allNotifications));
      } catch (error) {
        console.error("Error fetching notifications:", error);
      }
    };

    fetchNotifications();
  }, [token]);

  const toggleSidebar = () => {
    setCollapsed((prev) => !prev);
  };

  const toggleNotifications = () => {
    setShowNotifications((prev) => !prev);
  };

  const toggleSearchBar = () => {
    setShowSearchBar((prev) => !prev);
  };

  const deleteNotification = (index) => {
    const deletedNotification = notifications[index];
    const updatedNotifications = notifications.filter((_, i) => i !== index);

    setNotifications(updatedNotifications);
    localStorage.setItem("notifications", JSON.stringify(updatedNotifications));

    // Add to deleted list
    const deletedList =
      JSON.parse(localStorage.getItem("deletedNotifications")) || [];
    deletedList.push(deletedNotification.timestamp); // Use a unique identifier
    localStorage.setItem("deletedNotifications", JSON.stringify(deletedList));
  };

  const getTimeSince = (timestamp) => {
    const now = new Date();
    const timeDifference = Math.floor((now - new Date(timestamp)) / 1000); // Difference in seconds
    if (timeDifference < 60) return `منذ ${timeDifference} ثواني`;
    if (timeDifference < 3600)
      return `منذ ${Math.floor(timeDifference / 60)} دقائق`;
    if (timeDifference < 86400)
      return `منذ ${Math.floor(timeDifference / 3600)} ساعات`;
    return `منذ ${Math.floor(timeDifference / 86400)} أيام`;
  };

  return (
    <>
      <div className={`${styles.lightBg}`}></div>

      <div className={`${styles.topNav} ${collapsed ? styles.collapsed : ""} `}>
        <div className="container-fluid">
          <div className="row align-items-center ">
            <div className="col-9">
              <div className="d-flex align-items-center gap-3 ">
                <button
                  onClick={toggleSidebar}
                  className={`${styles.toggleButton}`}
                  aria-expanded={!collapsed}
                  aria-label="Toggle navigation"
                >
                  <FontAwesomeIcon icon={faBars} />
                </button>
                <h1 className={`${styles.title} mb-0 h2`}>{title}</h1>
              </div>
            </div>

            <div className="col-3 ps-0">
              <div
                className={`${styles.icons} d-flex gap-3 align-items-center justify-content-end`}
              >
                <div className={styles.searchWrapper}>
                  <FontAwesomeIcon
                    icon={faMagnifyingGlass}
                    size="lg"
                    onClick={toggleSearchBar}
                    className={`${styles.searchIcon} ${
                      showSearchBar ? styles.active : ""
                    }`}
                  />
                  {showSearchBar && (
                    <input
                      type="text"
                      placeholder="ابحث هنا..."
                      value={searchQuery}
                      onChange={onSearch}
                      className={`${styles.searchInput}`}
                    />
                  )}
                </div>
                <div className={styles.notificationWrapper}>
                  <FontAwesomeIcon
                    icon={faBell}
                    size="lg"
                    onClick={toggleNotifications}
                    className={`${styles.bellIcon} ${
                      showNotifications ? styles.active : ""
                    }`}
                  />
                  {notifications.length > 0 && (
                    <span className={styles.notificationDot}></span>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
        {showNotifications && (
          <div>
            {notifications && notifications.length > 0 ? (
              <div className={`${styles.notifications}`}>
                {notifications.map((notif, index) => (
                  <div
                    key={index}
                    className={styles.notificationItem}
                    onClick={() => {
                      notif.type === "request"
                        ? navigate("/requests")
                        : navigate("/receipts");
                      deleteNotification(index);
                      setShowNotifications(false);
                    }}
                  >
                    <div
                      className={`${styles.notificationContent} d-flex justify-content-between align-items-center`}
                    >
                      <div className="d-flex align-items-center justify-content-start gap-2 right">
                        {notif.type === "request" ? (
                          <FontAwesomeIcon
                            icon={faUsers}
                            size="xl"
                            className={styles.iconRequest}
                          />
                        ) : (
                          <FontAwesomeIcon
                            icon={faReceipt}
                            size="xl"
                            className={styles.iconReceipt}
                          />
                        )}
                        <p className="h5 mb-1">
                          {notif.type === "request"
                            ? "لديك طلب جديد"
                            : "لديك إيصال جديد"}
                        </p>
                      </div>
                      <div className="d-flex align-items-center justify-content-between gap-1 gap-sm-3 ">
                        <span className={`${styles.timestamp} text-muted fs-6`}>
                          {getTimeSince(notif.timestamp)}
                        </span>
                        <FontAwesomeIcon
                          icon={faTrashAlt}
                          className={`${styles.deleteIcon} text-danger`}
                          onClick={(e) => {
                            e.stopPropagation(); // Prevent navigation on delete
                            deleteNotification(index);
                          }}
                        />
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className={`${styles.noNotifications} text-center`}>
                <img src={notificationsBell} alt="Bell" className="" />
                <p className="h4">لا يوجد إشعارات حالياً</p>
              </div>
            )}
          </div>
        )}
      </div>
    </>
  );
}

export default TopNav;
