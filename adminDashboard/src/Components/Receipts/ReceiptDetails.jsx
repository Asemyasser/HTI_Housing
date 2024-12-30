import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Modal, Button } from "react-bootstrap"; // Import Modal and Button from React-Bootstrap
import { toast } from "react-toastify"; // Import toast for notifications
import styles from "./ReceiptDetails.module.css";
import "react-toastify/dist/ReactToastify.css"; // Import Toastify CSS
import axios from "axios";

function ReceiptDetails() {
  const { id } = useParams(); // Get the receipt ID from the URL
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true); // State to handle loading
  const [error, setError] = useState(null); // State to handle errors
  const [receipt, setReceipt] = useState(null); // State to store the receipt data

  const [showModal, setShowModal] = useState(false);
  const [actionType, setActionType] = useState(null); // Track the action (accept or reject)
  const [showImage, setShowImage] = useState(false); // State to show the large image modal

  const hanldeReceipt = async (status) => {
    setActionType(status);
    try {
      // Send the PATCH request to the API
      const response = await axios.patch(
        `${import.meta.env.VITE_API_BASE_URL}/payment/reviewPayment/${id}`,
        { status },
        {
          headers: {
            token: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzY2YjZjZGQzMTYxYzc1YWYwYWQ4M2IiLCJlbWFpbCI6InlvdXNmdGFtZXIxMUBnbWFpbC5jb20iLCJyb2xlIjoic3R1ZGVudCIsImlhdCI6MTczNDc4NDg0Mn0.KLo76IBdty3i_P96l1hLMNGwa2S-2DOLYSw-RU9u-aQ`,
          },
        }
      );
      console.log(response.data);
    } catch (err) {
      console.error(
        `Error ${status === "approved" ? "approving" : "rejecting"} request:`,
        err.response?.data || err.message
      );
    } finally {
      setActionType(null);
    }
  };

  // Find the receipt by ID
  useEffect(() => {
    const fetchData = async () => {
      try {
        const token = localStorage.getItem("authToken");
        const response = await axios.get(
          `${import.meta.env.VITE_API_BASE_URL}/payment/PendingPayment/${id}`,
          {
            headers: {
              token: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzY2YjZjZGQzMTYxYzc1YWYwYWQ4M2IiLCJlbWFpbCI6InlvdXNmdGFtZXIxMUBnbWFpbC5jb20iLCJyb2xlIjoic3R1ZGVudCIsImlhdCI6MTczNDc4NDg0Mn0.KLo76IBdty3i_P96l1hLMNGwa2S-2DOLYSw-RU9u-aQ`,
            },
          }
        );

        setReceipt(response.data);
        console.log(response.data);
      } catch (err) {
        setError(err.response?.data?.message || err.message);
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [id]);

  // Handle the action when confirmed
  const handleAction = () => {
    // Close the modal
    setShowModal(false);

    // Show toast based on the action type
    if (actionType === "approved") {
      toast.success("تمت موافقة على الحجز بنجاح");
    } else if (actionType === "rejected") {
      toast.error("تم رفض الحجز");
    }

    // After the action is confirmed, navigate back to the receipts page
    navigate("/receipts");
  };

  //  // Show the large image
  const openImage = () => setShowImage(true);

  // Close the large image
  const closeImage = () => setShowImage(false);

  if (loading)
    return (
      <p className="d-flex justify-content-center align-items-center">
        ...جاري تحميل البيانات
      </p>
    );
  if (error)
    return (
      <p className="d-flex justify-content-center align-items-center">
        Error: {error}
      </p>
    );

  return (
    <div className="container">
      <div className={`card p-4 ${styles.receiptCard}`}>
        <div className="row mb-5">
          <div className="col-12 col-md-3 text-center">
            <strong>الإيميل الجامعي</strong>
            <p className="mt-2">{receipt.data.booking.student.email}</p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>الاسم</strong>
            <p className="mt-2">{receipt.data.booking.student.name}</p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>ID</strong>
            <p className="mt-2">{receipt.data?.booking.student.ID}</p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>القسم</strong>
            <p className="mt-2">{receipt.data?.booking.student.department}</p>
          </div>
        </div>

        <div className="row mb-5 justify-content-center">
          <div className="col-12 text-center">
            <img
              src={receipt.data.receiptImage.secure_url} // Placeholder for the receipt image
              alt="Receipt"
              className="img-fluid  shadow"
              onClick={openImage} // Open large image on click
            />
          </div>
        </div>

        <div className="d-flex flex-column flex-md-row justify-content-center gap-4">
          <button
            className={`btn btn-danger py-2 px-1 px-sm-5 fs-4 rounded-pill ${styles.actionBtn}`}
            onClick={() => {
              setActionType("rejected");
              setShowModal(true); // Show modal on reject button click
            }}
          >
            رفض الحجز
          </button>
          <button
            className={`btn btn-success py-2 px-1 px-sm-5 fs-4 rounded-pill ${styles.actionBtn}`}
            onClick={() => {
              setActionType("approved");
              setShowModal(true); // Show modal on accept button click
            }}
          >
            موافقة على الحجز
          </button>
        </div>
      </div>

      {/* Modal for confirmation */}
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
            variant="primary"
            onClick={() => {
              handleAction();
              hanldeReceipt(actionType);
            }}
            // disabled={actionType}
          >
            تأكيد
          </Button>
        </Modal.Footer>
      </Modal>

      {/* Modal for the large image */}
      {showImage && (
        <div className={styles.imageModal} onClick={closeImage}>
          <div
            className={styles.imageModalContent}
            onClick={(e) => e.stopPropagation()}
          >
            <img
              src={receipt.data.receiptImage.secure_url} // Placeholder for the receipt image
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
