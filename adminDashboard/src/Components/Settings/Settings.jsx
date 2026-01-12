import React, { useState } from "react";
import api from "../../services/api";
import styles from "./Settings.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const Settings = () => {
  const [formData, setFormData] = useState({
    oldPassword: "",
    newPassword: "",
    confirmPassword: "",
  });
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);

  // Handle input changes
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.id]: e.target.value });
    // Optional: Clear specific error when user types
    if (errors[e.target.id]) {
      setErrors({ ...errors, [e.target.id]: null });
    }
  };

  // Validate form fields
  const validate = () => {
    const newErrors = {};
    if (!formData.oldPassword)
      newErrors.oldPassword = "كلمة السر القديمة مطلوبة.";

    if (
      !formData.newPassword ||
      !formData.newPassword.match(
        /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/
      )
    ) {
      newErrors.newPassword =
        "كلمة السر يجب أن تحتوي على 8 أحرف على الأقل، وتحتوي على حرف كبير وحرف صغير ورقم ورمز.";
    }

    if (formData.newPassword !== formData.confirmPassword) {
      newErrors.confirmPassword = "كلمة السر وتأكيدها غير متطابقين.";
    }
    return newErrors;
  };

  // Handle form submission
  const handleSubmit = async (e) => {
    e.preventDefault();
    const validationErrors = validate();
    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
      return;
    }
    setErrors({});
    setLoading(true);

    try {
      const response = await api.patch("/auth/dashboard/change-password", {
        oldPassword: formData.oldPassword,
        newPassword: formData.newPassword,
        confirmPassword: formData.confirmPassword,
      });

      if (response.status === 200) {
        let successMsg = "تم تغيير كلمة السر بنجاح";
        if (response.data && typeof response.data.message === "string") {
          successMsg = response.data.message;
        }

        toast.success(successMsg);
        setFormData({ oldPassword: "", newPassword: "", confirmPassword: "" });
      }
    } catch (error) {
      console.error(error);

      let errorMessage = "حدث خطأ أثناء تغيير كلمة السر";

      if (error.response?.data) {
        const data = error.response.data;
        if (typeof data === "string") {
          errorMessage = data;
        } else if (data.message) {
          if (typeof data.message === "string") {
            errorMessage = data.message;
          } else {
            errorMessage = JSON.stringify(data.message);
          }
        }
      } else if (error.message) {
        errorMessage = error.message;
      }

      toast.error(errorMessage);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className={`container`}>
      <div className={`${styles.settingsPage}`}>
        <div className="row justify-content-center">
          <div className={`col-xl-4 col-lg-6 col-md-8 col-12`}>
            <div className={`${styles.formCard}`}>
              <h2 className={`${styles.formTitle} text-center`}>
                تغيير كلمة السر
              </h2>
              <form onSubmit={handleSubmit} noValidate>
                {/* Old Password */}
                <div className="mb-3">
                  <label htmlFor="oldPassword" className="form-label">
                    كلمة السر القديمة
                  </label>
                  <input
                    type="password"
                    id="oldPassword"
                    autoComplete="current-password"
                    value={formData.oldPassword}
                    onChange={handleChange}
                    className={`form-control ${styles.input} ${
                      errors.oldPassword ? "is-invalid" : ""
                    }`}
                    aria-invalid={!!errors.oldPassword}
                    aria-describedby={
                      errors.oldPassword ? "old-pass-error" : undefined
                    }
                  />
                  {errors.oldPassword && (
                    <div id="old-pass-error" className="invalid-feedback">
                      {errors.oldPassword}
                    </div>
                  )}
                </div>

                {/* New Password */}
                <div className="mb-3">
                  <label htmlFor="newPassword" className="form-label">
                    كلمة السر الجديدة
                  </label>
                  <input
                    type="password"
                    id="newPassword"
                    autoComplete="new-password"
                    value={formData.newPassword}
                    onChange={handleChange}
                    className={`form-control ${styles.input} ${
                      errors.newPassword ? "is-invalid" : ""
                    }`}
                    aria-invalid={!!errors.newPassword}
                    aria-describedby={
                      errors.newPassword ? "new-pass-error" : undefined
                    }
                  />
                  {errors.newPassword && (
                    <div id="new-pass-error" className="invalid-feedback">
                      {errors.newPassword}
                    </div>
                  )}
                </div>

                {/* Confirm Password */}
                <div className="mb-5">
                  <label htmlFor="confirmPassword" className="form-label">
                    تأكيد كلمة السر
                  </label>
                  <input
                    type="password"
                    id="confirmPassword"
                    autoComplete="new-password"
                    value={formData.confirmPassword}
                    onChange={handleChange}
                    className={`form-control ${styles.input} ${
                      errors.confirmPassword ? "is-invalid" : ""
                    }`}
                    aria-invalid={!!errors.confirmPassword}
                    aria-describedby={
                      errors.confirmPassword ? "confirm-pass-error" : undefined
                    }
                  />
                  {errors.confirmPassword && (
                    <div id="confirm-pass-error" className="invalid-feedback">
                      {errors.confirmPassword}
                    </div>
                  )}
                </div>

                <button
                  type="submit"
                  className={`btn btn-primary rounded-pill ${styles.button}`}
                  disabled={loading}
                >
                  {loading ? "جاري الحفظ..." : "تغيير"}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Settings;
