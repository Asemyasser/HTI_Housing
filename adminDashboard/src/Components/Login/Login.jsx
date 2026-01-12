import React, { useState } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import { useForm } from "../../hooks/useForm";
import { useAuth } from "../../context/AuthContext";
import styles from "./Login.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import logo from "../../assets/imgs/loginLogo.png";
import htiBuilding from "../../assets/imgs/hti-building.png";
import { toast } from "react-toastify";

const Login = () => {
  const [formErrors, setFormErrors] = useState({ email: "", password: "" });
  const navigate = useNavigate();
  const { login } = useAuth();

  const { formData, handleChange, handleSubmit, loading, error } = useForm(
    { email: "", password: "" },
    `${import.meta.env.VITE_API_BASE_URL}/auth/dashboard/login`,
    (response) => {
      if (response.success) {
        login(response.data.token, response.data.role);

        let successMessage = "تم تسجيل الدخول بنجاح";
        if (response.message) {
          if (typeof response.message === "string") {
            successMessage = response.message;
          } else {
            successMessage = "تم تسجيل الدخول بنجاح";
          }
        }

        toast.success(successMessage);
        navigate("/");
      }
    }
  );

  const validateForm = () => {
    let errors = { email: "", password: "" };
    let isValid = true;

    if (!formData.email) {
      errors.email = "البريد الإلكتروني مطلوب";
      isValid = false;
    } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
      errors.email = "يرجى إدخال بريد إلكتروني صالح";
      isValid = false;
    }

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

  const handleLoginSubmit = (e) => {
    e.preventDefault();
    if (validateForm()) {
      handleSubmit(e);
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

            <div
              className="alert alert-info text-center py-2 mb-4"
              role="alert"
              dir="ltr"
            >
              <small className="d-block fw-bold mb-1 text-primary">
                For Testing / للتجربة
              </small>
              <div
                className="d-flex justify-content-center gap-2 flex-wrap"
                style={{ fontSize: "0.85rem" }}
              >
                <span className="badge bg-light text-dark border p-2">
                  User:{" "}
                  <span className="user-select-all fw-bold">
                    admin@test.com
                  </span>
                </span>
                <span className="badge bg-light text-dark border p-2">
                  Pass:{" "}
                  <span className="user-select-all fw-bold">Admin@123</span>
                </span>
              </div>
            </div>

            <form onSubmit={handleLoginSubmit} noValidate>
              {/* Email Field */}
              <div className="form-group mb-3">
                <label htmlFor="email" className={styles.label}>
                  البريد الإلكتروني
                </label>
                <input
                  id="email"
                  type="email"
                  name="email"
                  autoComplete="email"
                  className={`form-control ${styles.input} ${
                    formErrors.email ? "is-invalid" : ""
                  }`}
                  placeholder="البريد الإلكتروني..."
                  value={formData.email}
                  onChange={handleChange}
                  aria-invalid={!!formErrors.email}
                  aria-describedby={
                    formErrors.email ? "email-error" : undefined
                  }
                />
                {formErrors.email && (
                  <p id="email-error" className="text-danger mt-1" role="alert">
                    {formErrors.email}
                  </p>
                )}
              </div>

              {/* Password Field */}
              <div className="form-group mb-3">
                <label htmlFor="password" className={styles.label}>
                  كلمة السر
                </label>
                <input
                  id="password"
                  type="password"
                  name="password"
                  autoComplete="current-password"
                  className={`form-control ${styles.input} ${
                    formErrors.password ? "is-invalid" : ""
                  }`}
                  placeholder="كلمة السر..."
                  value={formData.password}
                  onChange={handleChange}
                  aria-invalid={!!formErrors.password}
                  aria-describedby={
                    formErrors.password ? "password-error" : undefined
                  }
                />
                {formErrors.password && (
                  <p
                    id="password-error"
                    className="text-danger mt-1"
                    role="alert"
                  >
                    {formErrors.password}
                  </p>
                )}
              </div>

              {/* General API Error */}
              {error && (
                <div className="alert alert-danger" role="alert">
                  {typeof error === "string"
                    ? error
                    : "حدث خطأ في تسجيل الدخول"}
                </div>
              )}

              <button
                type="submit"
                className={`btn ${styles.submitButton}`}
                disabled={loading}
              >
                {loading ? "جاري التحميل..." : "تسجيل الدخول"}
              </button>

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
