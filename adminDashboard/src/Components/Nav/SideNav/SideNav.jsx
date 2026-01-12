import styles from "./SideNav.module.css";
import logo from "../../../assets/imgs/Logo.png";
import "@fontsource/inter";
import "@fontsource/itim";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faHouse,
  faReceipt,
  faGear,
  faUsers,
  faArrowRightFromBracket,
} from "@fortawesome/free-solid-svg-icons";
import { NavLink, Link } from "react-router-dom";
import { useAuth } from "../../../context/AuthContext";

const SideNav = ({ collapsed, setTitle }) => {
  const { logout } = useAuth();

  // Helper to apply classes automatically based on Route
  const navLinkClass = ({ isActive }) =>
    `${styles.navLink} ${isActive ? styles.activeLink : ""}`;

  return (
    <div
      className={`${styles.sideNav} ${
        collapsed ? styles.collapsed : styles.open
      } d-flex flex-column vh-100`}
    >
      {/* Header / Logo */}
      <div className={`${styles.header} p-3 `}>
        <Link to="/" aria-label="الذهاب إلى الصفحة الرئيسية">
          <img src={logo} alt="HTI Housing Logo" className={`${styles.logo}`} />
        </Link>
        {!collapsed && (
          <h1 className={`${styles.title} h2 ms-3 ${styles.textContainer} `}>
            HTI Housing
          </h1>
        )}
      </div>

      {/* Navigation Links */}
      <ul className="nav flex-column mt-4 me-3 text-end fs-5 ">
        <li className="nav-item w-100">
          <NavLink
            to="/"
            onClick={() => setTitle("الواجهة الرئيسية")}
            className={navLinkClass}
            aria-label="الواجهة الرئيسية"
          >
            {!collapsed && (
              <span className={`${styles.textContainer}`}>
                الواجهة الرئيسية
              </span>
            )}
            <FontAwesomeIcon icon={faHouse} aria-hidden="true" />
          </NavLink>
        </li>

        <li className="nav-item w-100">
          <NavLink
            to="/requests"
            onClick={() => setTitle("طلبات الإقامة")}
            className={navLinkClass}
            aria-label="طلبات الإقامة"
          >
            {!collapsed && (
              <span className={`${styles.textContainer} `}>طلبات الإقامة</span>
            )}
            <FontAwesomeIcon icon={faUsers} aria-hidden="true" />
          </NavLink>
        </li>

        <li className="nav-item w-100">
          <NavLink
            to="/receipts"
            onClick={() => setTitle("إيصالات الدفع")}
            className={navLinkClass}
            aria-label="إيصالات الدفع"
          >
            {!collapsed && (
              <span className={`${styles.textContainer}`}>إيصلات الدفع</span>
            )}
            <FontAwesomeIcon icon={faReceipt} aria-hidden="true" />
          </NavLink>
        </li>

        <li className="nav-item w-100">
          <NavLink
            to="/settings"
            onClick={() => setTitle("الإعدادات")}
            className={navLinkClass}
            aria-label="الإعدادات"
          >
            {!collapsed && (
              <span className={`${styles.textContainer}`}>الإعدادات</span>
            )}
            <FontAwesomeIcon icon={faGear} aria-hidden="true" />
          </NavLink>
        </li>
      </ul>

      {/* Footer / Logout */}
      <div className={`${styles.footer} mt-auto w-100 text-end fs-5 mb-4`}>
        <NavLink
          to="/"
          onClick={(e) => {
            e.preventDefault();
            logout();
          }}
          className={`${styles.navLink} me-3 pt-3 mt-2`}
          aria-label="تسجيل خروج"
        >
          {!collapsed && (
            <span className={`${styles.textContainer} `}>تسجيل خروج</span>
          )}
          <FontAwesomeIcon icon={faArrowRightFromBracket} aria-hidden="true" />
        </NavLink>

        <div
          className={`${styles.copyright} ${
            collapsed ? styles.collapsed : ""
          } mt-3 text-center`}
        >
          © {new Date().getFullYear()} <span>HTI Housing</span>. All rights
          reserved.
        </div>
      </div>
    </div>
  );
};

export default SideNav;
