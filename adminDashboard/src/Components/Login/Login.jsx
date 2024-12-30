import React, { useState } from "react";
import { useForm } from "../../hooks/useForm";
import { NavLink, useNavigate } from "react-router-dom";
import styles from "./Login.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import logo from "../../assets/imgs/loginLogo.png";
import htiBuilding from "../../assets/imgs/hti-building.png";

const Login = () => {
  const [formErrors, setFormErrors] = useState({ email: "", password: "" });
  const navigate = useNavigate();

  const { formData, handleChange, handleSubmit, loading, error } = useForm(
    { email: "", password: "" },
    `${import.meta.env.VITE_API_BASE_URL}/auth/dashboard/login`,
    (response) => {
      if (response.success) {
        // Save token and role to localStorage
        localStorage.setItem("authToken", response.data.token);
        localStorage.setItem("userRole", response.data.role);
        alert(response.message); // Notify user
        navigate("/"); // Redirect to the dashboard
      }
    }
  );

  // Custom validation function
  const validateForm = () => {
    let errors = { email: "", password: "" };
    let isValid = true;

    // Validate email
    if (!formData.email) {
      errors.email = "البريد الإلكتروني مطلوب";
      isValid = false;
    } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
      errors.email = "يرجى إدخال بريد إلكتروني صالح";
      isValid = false;
    }

    // Validate password
    if (!formData.password) {
      errors.password = "كلمة السر مطلوبة";
      isValid = false;
    } else if (
      !/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(
        formData.password
      )
    ) {
      errors.password =
        "كلمة السر يجب أن تحتوي على 8 أحرف على الأقل، وتحتوي على حرف كبير وحرف صغير ورقم ورمز";
      isValid = false;
    }

    setFormErrors(errors);
    return isValid;
  };

  // Modified submit handler to include validation
  const handleLoginSubmit = (e) => {
    e.preventDefault();

    if (validateForm()) {
      handleSubmit(e); // Proceed with the form submission if valid
    }
  };

  return (
    <div className={`container-fluid vh-100 ${styles.pageContainer}`}>
      <img src={htiBuilding} alt="Building" className={styles.buildingImage} />
      <img src={logo} alt="HTI Logo" className={styles.logo} />

      <div className="row align-items-center justify-content-center h-100">
        <div className="col-8 col-sm-7 col-md-6 col-lg-5 col-xl-4">
          <div className={styles.formContainer}>
            <h1 className={styles.title}>HTI Housing</h1>
            <form onSubmit={handleLoginSubmit} noValidate>
              {/* Email Field */}
              <div className="form-group mb-3">
                <label htmlFor="email" className={styles.label}>
                  البريد الإلكتروني
                </label>
                <input
                  type="email"
                  name="email"
                  className={`form-control ${styles.input}`}
                  placeholder="البريد الإلكتروني..."
                  value={formData.email}
                  onChange={handleChange}
                />
                {formErrors.email && (
                  <p className="text-danger">{formErrors.email}</p>
                )}
              </div>

              {/* Password Field */}
              <div className="form-group mb-3">
                <label htmlFor="password" className={styles.label}>
                  كلمة السر
                </label>
                <input
                  type="password"
                  name="password"
                  className={`form-control ${styles.input}`}
                  placeholder="كلمة السر..."
                  value={formData.password}
                  onChange={handleChange}
                />
                {formErrors.password && (
                  <p className="text-danger">{formErrors.password}</p>
                )}
              </div>

              {/* Submit Button */}
              {error && <p className="text-danger">{error}</p>}
              <button
                type="submit"
                className={`btn ${styles.submitButton}`}
                disabled={loading}
              >
                {loading ? "جاري التحميل..." : "تسجيل الدخول"}
              </button>

              {/* Create Account Link */}
              <p className={styles.createAccount}>
                ليس لديك حساب؟{" "}
                <NavLink to="/register" onClick={() => navigate("/register")}>
                  إنشاء حساب
                </NavLink>
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;
