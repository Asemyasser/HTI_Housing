import React from "react";
import styles from "./Settings.module.css";
import "bootstrap/dist/css/bootstrap.min.css";

const Settings = () => {
  return (
    <div className={`container`}>
      <div className={`${styles.settingsPage}`}>
        <div className="row justify-content-center">
          {/* Right Panel */}
          <div className={`col-xl-4 col-lg-6 col-md-8 col-12`}>
            <div className={`${styles.formCard} `}>
              <h2 className={`${styles.formTitle} text-center`}>
                تغيير كلمة السر
              </h2>
              <form>
                <div className="mb-3">
                  <label htmlFor="oldPassword" className="form-label">
                    كلمة السر القديمة
                  </label>
                  <input
                    type="password"
                    id="oldPassword"
                    className={`form-control ${styles.input}`}
                  />
                </div>
                <div className="mb-3">
                  <label htmlFor="newPassword" className="form-label">
                    كلمة السر الجديدة
                  </label>
                  <input
                    type="password"
                    id="newPassword"
                    className={`form-control ${styles.input}`}
                  />
                </div>
                <div className="mb-5">
                  <label htmlFor="confirmPassword" className="form-label">
                    تأكيد كلمة السر
                  </label>
                  <input
                    type="password"
                    id="confirmPassword"
                    className={`form-control ${styles.input}`}
                  />
                </div>
                <button
                  type="submit"
                  className={`btn btn-primary rounded-pill  ${styles.button}`}
                >
                  تغيير
                </button>
              </form>
            </div>
          </div>
        </div>

        {/* Save and Ignore Buttons */}
        <div className="d-flex flex-column flex-md-row justify-content-center align-items-center mt-5 gap-4 row-gap-2">
          <button
            className={`btn btn-success fs-4 px-4 px-sm-5 rounded-pill ${styles.saveButton}`}
          >
            حفظ التغييرات
          </button>
          <button
            className={`btn btn-danger fs-4 px-4 px-sm-5 rounded-pill ${styles.cancelButton} `}
          >
            تجاهل
          </button>
        </div>
      </div>
    </div>
  );
};

export default Settings;
