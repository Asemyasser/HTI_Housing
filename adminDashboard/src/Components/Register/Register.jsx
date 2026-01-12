import React, { useState } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import { useForm } from "../../hooks/useForm";
import styles from "./Register.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import logo from "../../assets/imgs/loginLogo.png";
import htiBuilding from "../../assets/imgs/hti-building.png";
import { toast } from "react-toastify";

const Register = () => {
  const [formErrors, setFormErrors] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
  });
  const navigate = useNavigate();

  const { formData, handleChange, handleSubmit, loading, error } = useForm(
    { name: "", email: "", password: "", confirmPassword: "" },
    `${import.meta.env.VITE_API_BASE_URL}/auth/dashboard/signup`,
    (response) => {
      if (response.success) {
        let successMessage = "تم إنشاء الحساب بنجاح";
        if (response.message) {
          if (typeof response.message === "string") {
            successMessage = response.message;
          } else {
            successMessage = "تم إنشاء الحساب بنجاح";
          }
        }

        toast.success(successMessage);
        navigate("/login");
      }
    }
  );

  // Custom validation function
  const validateForm = () => {
    let errors = { name: "", email: "", password: "", confirmPassword: "" };
    let isValid = true;

    // Validate name
    if (!formData.name) {
      errors.name = "الاسم مطلوب";
      isValid = false;
    }

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

    // Validate confirm password
    if (formData.confirmPassword !== formData.password) {
      errors.confirmPassword = "كلمة السر وتأكيد كلمة السر غير متطابقتين";
      isValid = false;
    }

    setFormErrors(errors);
    return isValid;
  };

  const handleRegisterSubmit = (e) => {
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
            <form onSubmit={handleRegisterSubmit} noValidate>
              {/* Name Field */}
              <div className="form-group mb-3">
                <label htmlFor="name" className={styles.label}>
                  الاسم
                </label>
                <input
                  id="name"
                  type="text"
                  name="name"
                  autoComplete="name"
                  className={`form-control ${styles.input} ${
                    formErrors.name ? "is-invalid" : ""
                  }`}
                  placeholder="الاسم..."
                  value={formData.name}
                  onChange={handleChange}
                  aria-invalid={!!formErrors.name}
                  aria-describedby={formErrors.name ? "name-error" : undefined}
                />
                {formErrors.name && (
                  <p id="name-error" className="text-danger mt-1" role="alert">
                    {formErrors.name}
                  </p>
                )}
              </div>

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
                  autoComplete="new-password"
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

              {/* Confirm Password Field */}
              <div className="form-group mb-3">
                <label htmlFor="confirmPassword" className={styles.label}>
                  تأكيد كلمة السر
                </label>
                <input
                  id="confirmPassword"
                  type="password"
                  name="confirmPassword"
                  autoComplete="new-password"
                  className={`form-control ${styles.input} ${
                    formErrors.confirmPassword ? "is-invalid" : ""
                  }`}
                  placeholder="تأكيد كلمة السر..."
                  value={formData.confirmPassword}
                  onChange={handleChange}
                  aria-invalid={!!formErrors.confirmPassword}
                  aria-describedby={
                    formErrors.confirmPassword ? "confirm-error" : undefined
                  }
                />
                {formErrors.confirmPassword && (
                  <p
                    id="confirm-error"
                    className="text-danger mt-1"
                    role="alert"
                  >
                    {formErrors.confirmPassword}
                  </p>
                )}
              </div>

              {/* General API Error */}
              {error && (
                <div className="alert alert-danger" role="alert">
                  {typeof error === "string"
                    ? error
                    : "حدث خطأ أثناء إنشاء الحساب"}
                </div>
              )}

              <button
                type="submit"
                className={`btn ${styles.submitButton}`}
                disabled={loading}
              >
                {loading ? "جاري التحميل..." : "إنشاء حساب"}
              </button>

              <p className={styles.loginLink}>
                لديك حساب بالفعل؟ <NavLink to="/login">تسجيل الدخول</NavLink>
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Register;
