import React, { useState } from "react";
import { useForm } from "../../hooks/useForm";
import { NavLink, useNavigate } from "react-router-dom";
import styles from "./Register.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import logo from "../../assets/imgs/loginLogo.png";
import htiBuilding from "../../assets/imgs/hti-building.png";

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
    `/api/auth/dashboard/signup`,
    (response) => {
      if (response.success) {
        alert(response.message);
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

  // Modified submit handler to include validation
  const handleRegisterSubmit = (e) => {
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
            <form onSubmit={handleRegisterSubmit} noValidate>
              {/* Name Field */}
              <div className="form-group mb-3">
                <label htmlFor="name" className={styles.label}>
                  الاسم
                </label>
                <input
                  type="text"
                  name="name"
                  className={`form-control ${styles.input}`}
                  placeholder="الاسم..."
                  value={formData.name}
                  onChange={handleChange}
                />
                {formErrors.name && (
                  <p className="text-danger">{formErrors.name}</p>
                )}
              </div>

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

              {/* Confirm Password Field */}
              <div className="form-group mb-3">
                <label htmlFor="confirmPassword" className={styles.label}>
                  تأكيد كلمة السر
                </label>
                <input
                  type="password"
                  name="confirmPassword"
                  className={`form-control ${styles.input}`}
                  placeholder="تأكيد كلمة السر..."
                  value={formData.confirmPassword}
                  onChange={handleChange}
                />
                {formErrors.confirmPassword && (
                  <p className="text-danger">{formErrors.confirmPassword}</p>
                )}
              </div>

              {/* Submit Button */}
              {error && <p className="text-danger">{error}</p>}
              <button
                type="submit"
                className={`btn ${styles.submitButton}`}
                disabled={loading}
              >
                {loading ? "جاري التحميل..." : "إنشاء حساب"}
              </button>

              {/* Login Link */}
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
