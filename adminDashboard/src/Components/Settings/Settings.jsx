import React, { useState } from "react";
import axios from "axios";
import styles from "./Settings.module.css";
import "bootstrap/dist/css/bootstrap.min.css";
import { toast } from "react-toastify"; // Import toast for notifications
import "react-toastify/dist/ReactToastify.css"; // Import Toastify CSS

const Settings = () => {
  const [formData, setFormData] = useState({
    oldPassword: "",
    newPassword: "",
    confirmPassword: "",
  });
  const [errors, setErrors] = useState({});
  // const [apiStatus, setApiStatus] = useState("");

  // Handle input changes
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.id]: e.target.value });
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

    try {
      const token = localStorage.getItem("authToken"); // Assuming the token is stored in localStorage
      if (!token) {
        toast.error("فشل المصادقة. لم يتم العثور على الرمز.");
        return;
      }

      const response = await axios.patch(
        "/api/auth/dashboard/change-password",
        {
          oldPassword: formData.oldPassword,
          newPassword: formData.newPassword,
          confirmPassword: formData.confirmPassword,
        },
        {
          headers: {
            token: `${token}`,
          },
        }
      );

      if (response.status === 200) {
        toast.success("تم تغيير كلمة السر بنجاح.");
        setFormData({ oldPassword: "", newPassword: "", confirmPassword: "" });
      } else {
        toast.error("حدث خطأ أثناء تغيير كلمة السر.");
      }
    } catch (error) {
      toast.error(`${error.response.data.message}`);
      console.error(error);
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
              <form onSubmit={handleSubmit}>
                <div className="mb-3">
                  <label htmlFor="oldPassword" className="form-label">
                    كلمة السر القديمة
                  </label>
                  <input
                    type="password"
                    id="oldPassword"
                    value={formData.oldPassword}
                    onChange={handleChange}
                    className={`form-control ${styles.input} ${
                      errors.oldPassword ? "is-invalid" : ""
                    }`}
                  />
                  {errors.oldPassword && (
                    <div className="invalid-feedback">{errors.oldPassword}</div>
                  )}
                </div>
                <div className="mb-3">
                  <label htmlFor="newPassword" className="form-label">
                    كلمة السر الجديدة
                  </label>
                  <input
                    type="password"
                    id="newPassword"
                    value={formData.newPassword}
                    onChange={handleChange}
                    className={`form-control ${styles.input} ${
                      errors.newPassword ? "is-invalid" : ""
                    }`}
                  />
                  {errors.newPassword && (
                    <div className="invalid-feedback">{errors.newPassword}</div>
                  )}
                </div>
                <div className="mb-5">
                  <label htmlFor="confirmPassword" className="form-label">
                    تأكيد كلمة السر
                  </label>
                  <input
                    type="password"
                    id="confirmPassword"
                    value={formData.confirmPassword}
                    onChange={handleChange}
                    className={`form-control ${styles.input} ${
                      errors.confirmPassword ? "is-invalid" : ""
                    }`}
                  />
                  {errors.confirmPassword && (
                    <div className="invalid-feedback">
                      {errors.confirmPassword}
                    </div>
                  )}
                </div>
                <button
                  type="submit"
                  className={`btn btn-primary rounded-pill ${styles.button}`}
                >
                  تغيير
                </button>
              </form>
            </div>
          </div>
        </div>
        {/* <div className="d-flex flex-column flex-md-row justify-content-center align-items-center mt-5 gap-4 row-gap-2">
          <button
            className={`btn btn-success fs-4 px-4 px-sm-5 rounded-pill ${styles.saveButton}`}
          >
            حفظ التغييرات
          </button>
          <button
            className={`btn btn-danger fs-4 px-4 px-sm-5 rounded-pill ${styles.cancelButton}`}
          >
            تجاهل
          </button>
        </div> */}
      </div>
    </div>
  );
};

export default Settings;
