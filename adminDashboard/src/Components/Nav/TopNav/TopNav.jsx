import { useState, useEffect, useRef } from "react";
import styles from "./TopNav.module.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faBars,
  faMagnifyingGlass,
  faReceipt,
  faTrashAlt,
  faUsers,
} from "@fortawesome/free-solid-svg-icons";
import { faBell } from "@fortawesome/free-regular-svg-icons";
import notificationsBell from "../../../assets/imgs/notificationBell.png";
import { useNavigate } from "react-router-dom";
import { useNotifications } from "../../../hooks/useNotifications";

function TopNav({ collapsed, setCollapsed, title, onSearch, searchQuery }) {
  const [showNotifications, setShowNotifications] = useState(false);
  const [showSearchBar, setShowSearchBar] = useState(false);
  const navigate = useNavigate();
  const { notifications, deleteNotification } = useNotifications();

  const searchRef = useRef(null);
  const notifRef = useRef(null);

  const toggleSidebar = () => setCollapsed((prev) => !prev);
  const toggleNotifications = () => setShowNotifications((prev) => !prev);
  const toggleSearchBar = () => setShowSearchBar((prev) => !prev);

  // 2. Click Outside Logic
  useEffect(() => {
    const handleClickOutside = (event) => {
      // If Search is open AND click is OUTSIDE the search wrapper -> Close it
      if (searchRef.current && !searchRef.current.contains(event.target)) {
        setShowSearchBar(false);
      }

      // If Notifications are open AND click is OUTSIDE the notification wrapper -> Close it
      if (notifRef.current && !notifRef.current.contains(event.target)) {
        setShowNotifications(false);
      }
    };

    // Bind the event listener
    document.addEventListener("mousedown", handleClickOutside);

    // Cleanup the listener on unmount
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const getTimeSince = (timestamp) => {
    const now = new Date();
    const timeDifference = Math.floor((now - new Date(timestamp)) / 1000);
    if (timeDifference < 60) return `منذ ${timeDifference} ثواني`;
    if (timeDifference < 3600)
      return `منذ ${Math.floor(timeDifference / 60)} دقائق`;
    if (timeDifference < 86400)
      return `منذ ${Math.floor(timeDifference / 3600)} ساعات`;
    return `منذ ${Math.floor(timeDifference / 86400)} أيام`;
  };

  const handleNotificationKeyDown = (e, notif, index) => {
    if (e.key === "Enter" || e.key === " ") {
      e.preventDefault();
      notif.type === "request" ? navigate("/requests") : navigate("/receipts");
      deleteNotification(index);
      setShowNotifications(false);
    }
  };

  return (
    <>
      <div className={`${styles.lightBg}`}></div>

      <div className={`${styles.topNav} ${collapsed ? styles.collapsed : ""} `}>
        <div className="container-fluid">
          <div className="row align-items-center ">
            {/* Sidebar Toggle & Title */}
            <div className="col-9">
              <div className="d-flex align-items-center gap-3 ">
                <button
                  onClick={toggleSidebar}
                  className={`${styles.toggleButton}`}
                  aria-expanded={!collapsed}
                  aria-label={collapsed ? "فتح القائمة" : "غلق القائمة"}
                >
                  <FontAwesomeIcon icon={faBars} aria-hidden="true" />
                </button>
                <h1 className={`${styles.title} mb-0 h2`}>{title}</h1>
              </div>
            </div>

            {/* Icons Section */}
            <div className="col-3 ps-0">
              <div
                className={`${styles.icons} d-flex gap-3 align-items-center justify-content-end`}
              >
                {/* Search Bar Wrapper with Ref */}
                <div className={styles.searchWrapper} ref={searchRef}>
                  <button
                    onClick={toggleSearchBar}
                    className="btn p-0 border-0"
                    aria-label="بحث"
                    aria-expanded={showSearchBar}
                  >
                    <FontAwesomeIcon
                      icon={faMagnifyingGlass}
                      size="lg"
                      className={`${styles.searchIcon} ${
                        showSearchBar ? styles.active : ""
                      }`}
                      aria-hidden="true"
                    />
                  </button>

                  {showSearchBar && (
                    <input
                      type="text"
                      placeholder="ابحث هنا..."
                      value={searchQuery}
                      onChange={onSearch}
                      className={`${styles.searchInput}`}
                      autoFocus
                      aria-label="مربع البحث"
                    />
                  )}
                </div>

                {/* Notifications Wrapper with Ref */}
                <div className={styles.notificationWrapper} ref={notifRef}>
                  <button
                    onClick={toggleNotifications}
                    className="btn p-0 border-0 position-relative"
                    aria-label={`الإشعارات - ${notifications.length} غير مقروءة`}
                    aria-expanded={showNotifications}
                  >
                    <FontAwesomeIcon
                      icon={faBell}
                      size="lg"
                      className={`${styles.bellIcon} ${
                        showNotifications ? styles.active : ""
                      }`}
                      aria-hidden="true"
                    />
                    {notifications.length > 0 && (
                      <span className={styles.notificationDot}></span>
                    )}
                  </button>

                  {showNotifications && (
                    <div
                      className={styles.dropdownContainer}
                      role="dialog"
                      aria-label="قائمة الإشعارات"
                    >
                      {notifications && notifications.length > 0 ? (
                        <div className={`${styles.notifications}`}>
                          {notifications.map((notif, index) => (
                            <div
                              key={index}
                              className={styles.notificationItem}
                              role="button"
                              tabIndex="0"
                              onKeyDown={(e) =>
                                handleNotificationKeyDown(e, notif, index)
                              }
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
                                <div
                                  className="d-flex align-items-center justify-content-start gap-2 flex-grow-1"
                                  style={{ minWidth: 0 }}
                                >
                                  <FontAwesomeIcon
                                    icon={
                                      notif.type === "request"
                                        ? faUsers
                                        : faReceipt
                                    }
                                  />
                                  <p className="h6 mb-0 text-truncate">
                                    {notif.type === "request"
                                      ? "لديك طلب جديد"
                                      : "لديك إيصال جديد"}
                                  </p>
                                </div>

                                <div className="d-flex align-items-center gap-2 flex-shrink-0">
                                  <span
                                    className={`${styles.timestamp} text-muted`}
                                  >
                                    {getTimeSince(notif.timestamp)}
                                  </span>
                                  <button className="btn btn-link p-0">
                                    <FontAwesomeIcon
                                      icon={faTrashAlt}
                                      className={`${styles.deleteIcon} text-danger`}
                                      aria-hidden="true"
                                    />
                                  </button>
                                </div>
                              </div>
                            </div>
                          ))}
                        </div>
                      ) : (
                        <div
                          className={`${styles.noNotifications} text-center`}
                        >
                          <img
                            src={notificationsBell}
                            alt="No Notifications"
                            className=""
                          />
                          <p className="h4">لا يوجد إشعارات حالياً</p>
                        </div>
                      )}
                    </div>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default TopNav;
