import React from "react";
import styles from "./Login.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import logo from "../../assets/imgs/loginLogo.png";
import htiBuilding from "../../assets/imgs/hti-building.png";
import { NavLink, useNavigate } from "react-router-dom";

const Login = () => {
  const navigate = useNavigate();

  const handleLogin = (e) => {
    e.preventDefault(); // Prevent form submission
    // Add your login validation logic here
    navigate("/"); // Navigate to the dashboard (home page)
  };

  return (
    <div className={`container-fluid vh-100 ${styles.pageContainer}`}>
      <img
        src={htiBuilding}
        alt="Building"
        className={`${styles.buildingImage}`}
      />
      <img src={logo} alt="HTI Logo" className={styles.logo} />

      <div className="row align-items-center justify-content-center h-100">
        <div className=" col-8 col-sm-7 col-md-6 col-lg-5 col-xl-4">
          <div className={styles.formContainer}>
            <h1 className={`${styles.title}`}>HTI Housing</h1>
            <form onSubmit={handleLogin}>
              {/* Email Field */}
              <div className="form-group mb-3">
                <label htmlFor="email" className={styles.label}>
                  البريد الإلكتروني
                </label>
                <input
                  type="email"
                  id="email"
                  className={`form-control ${styles.input}`}
                  placeholder="البريد الإلكتروني..."
                />
              </div>
              {/* Password Field */}
              <div className="form-group mb-3">
                <label htmlFor="password" className={styles.label}>
                  كلمة السر
                </label>
                <input
                  type="password"
                  id="password"
                  className={`form-control ${styles.input}`}
                  placeholder="كلمة السر..."
                />
              </div>
              {/* Submit Button */}
              <button type="submit" className={`btn ${styles.submitButton}`}>
                تسجيل الدخول
              </button>
              {/* Create Account Link */}
              <p className={styles.createAccount}>
                ليس لديك حساب؟ <NavLink to="/register">إنشاء حساب</NavLink>
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;
