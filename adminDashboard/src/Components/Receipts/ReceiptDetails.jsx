import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Modal, Button } from "react-bootstrap";
import { toast } from "react-toastify";
import styles from "./ReceiptDetails.module.css";
import "react-toastify/dist/ReactToastify.css";
import api from "../../services/api";

function ReceiptDetails() {
  const { id } = useParams();
  const navigate = useNavigate();

  // State management
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [receipt, setReceipt] = useState(null);

  const [showModal, setShowModal] = useState(false);
  const [actionType, setActionType] = useState(null);
  const [showImage, setShowImage] = useState(false);

  // 1. Fetch Receipt Data
  useEffect(() => {
    const fetchReceipt = async () => {
      try {
        const response = await api.get(`/payment/PendingPayment/${id}`);
        setReceipt(response.data);
      } catch (err) {
        // Safe error handling for fetch
        const msg = err.response?.data?.message || err.message;
        setError(typeof msg === "string" ? msg : JSON.stringify(msg));
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchReceipt();
  }, [id]);

  // 2. Handle Approve/Reject Submission
  const handleReviewSubmit = async () => {
    try {
      await api.patch(`/payment/reviewPayment/${id}`, { status: actionType });

      if (actionType === "approved") {
        toast.success("تمت الموافقة على الحجز بنجاح");
      } else {
        toast.error("تم رفض الحجز");
      }

      navigate("/receipts");
    } catch (err) {
      console.error(err);

      let errorMessage = "حدث خطأ أثناء تنفيذ الإجراء";
      const resData = err.response?.data;

      if (resData) {
        if (typeof resData === "string") {
          errorMessage = resData;
        } else if (resData.message) {
          if (typeof resData.message === "string") {
            errorMessage = resData.message;
          } else {
            // If it's an object/array, stringify it safely
            errorMessage = JSON.stringify(resData.message);
          }
        }
      } else if (err.message) {
        errorMessage = err.message;
      }

      toast.error(errorMessage);
    } finally {
      setShowModal(false);
      setActionType(null);
    }
  };

  const openImage = () => setShowImage(true);
  const closeImage = () => setShowImage(false);

  if (loading)
    return (
      <p
        role="status"
        className="d-flex justify-content-center align-items-center mt-5"
      >
        ...جاري تحميل البيانات
      </p>
    );
  if (error)
    return (
      <p
        role="alert"
        className="d-flex justify-content-center align-items-center mt-5 text-danger"
      >
        Error: {error}
      </p>
    );

  return (
    <div className="container">
      <div className={`card p-4 ${styles.receiptCard}`}>
        {/* Student Details Section */}
        <div className="row mb-5">
          <div className="col-12 col-md-3 text-center">
            <strong>الإيميل الجامعي</strong>
            <p className="mt-2">
              {receipt?.data?.booking?.student?.email || "N/A"}
            </p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>الاسم</strong>
            <p className="mt-2">
              {receipt?.data?.booking?.student?.name || "N/A"}
            </p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>ID</strong>
            <p className="mt-2">
              {receipt?.data?.booking?.student?.ID || "N/A"}
            </p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>القسم</strong>
            <p className="mt-2">
              {receipt?.data?.booking?.student?.department || "N/A"}
            </p>
          </div>
        </div>

        {/* Receipt Image Section */}
        <div className="row mb-5 justify-content-center">
          <div className="col-12 text-center">
            <button
              type="button"
              className="btn p-0 border-0"
              onClick={openImage}
              aria-label="عرض الإيصال بحجم كامل"
            >
              <img
                src={receipt?.data?.receiptImage?.secure_url}
                alt="Receipt Thumbnail"
                className="img-fluid shadow"
                style={{ cursor: "pointer", maxHeight: "400px" }}
              />
            </button>
            <p className="text-muted mt-2 small">اضغط على الصورة للتكبير</p>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="d-flex flex-column flex-md-row justify-content-center gap-4">
          <button
            className={`btn btn-danger py-2 px-1 px-sm-5 fs-4 rounded-pill ${styles.actionBtn}`}
            onClick={() => {
              setActionType("rejected");
              setShowModal(true);
            }}
          >
            رفض الحجز
          </button>
          <button
            className={`btn btn-success py-2 px-1 px-sm-5 fs-4 rounded-pill ${styles.actionBtn}`}
            onClick={() => {
              setActionType("approved");
              setShowModal(true);
            }}
          >
            موافقة على الحجز
          </button>
        </div>
      </div>

      {/* Confirmation Modal */}
      <Modal
        show={showModal}
        onHide={() => setShowModal(false)}
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">
            تأكيد الإجراء
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          هل أنت متأكد أنك تريد{" "}
          {actionType === "approved" ? "موافقة على الحجز" : "رفض الحجز"}؟
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => setShowModal(false)}>
            إلغاء
          </Button>
          <Button
            variant={actionType === "approved" ? "success" : "danger"}
            onClick={handleReviewSubmit}
          >
            تأكيد
          </Button>
        </Modal.Footer>
      </Modal>

      {/* Large Image Modal */}
      {showImage && (
        <div
          className={styles.imageModal}
          onClick={closeImage}
          role="dialog"
          aria-modal="true"
          aria-label="صورة الإيصال"
        >
          <div
            className={styles.imageModalContent}
            onClick={(e) => e.stopPropagation()}
          >
            <img
              src={receipt?.data?.receiptImage?.secure_url}
              alt="Large Receipt"
              className="img-fluid"
            />
          </div>
        </div>
      )}
    </div>
  );
}

export default ReceiptDetails;
