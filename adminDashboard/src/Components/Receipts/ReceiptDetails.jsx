import React, { useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Modal, Button } from "react-bootstrap"; // Import Modal and Button from React-Bootstrap
import { toast } from "react-toastify"; // Import toast for notifications
import { receiptData } from "./Receipts";
import styles from "./ReceiptDetails.module.css";
import "react-toastify/dist/ReactToastify.css"; // Import Toastify CSS
import receiptImg from "../../assets/imgs/receipt.jpg";

function ReceiptDetails() {
  const { id } = useParams(); // Get the receipt ID from the URL
  const navigate = useNavigate();

  const [showModal, setShowModal] = useState(false);
  const [actionType, setActionType] = useState(null); // Track the action (accept or reject)
  const [showImage, setShowImage] = useState(false); // State to show the large image modal

  // Find the receipt by ID
  const receipt = receiptData.find((item) => item.id.toString() === id);

  if (!receipt) {
    // Redirect back to Receipts if no receipt is found
    navigate("/receipts");
    return null;
  }

  // Handle the action when confirmed
  const handleAction = () => {
    // Close the modal
    setShowModal(false);

    // Show toast based on the action type
    if (actionType === "accept") {
      toast.success("تمت موافقة على الحجز بنجاح");
    } else if (actionType === "reject") {
      toast.error("تم رفض الحجز");
    }

    // After the action is confirmed, navigate back to the receipts page
    navigate("/receipts");
  };

  //  // Show the large image
  const openImage = () => setShowImage(true);

  // Close the large image
  const closeImage = () => setShowImage(false);

  return (
    <div className="container">
      <div className={`card p-4 ${styles.receiptCard}`}>
        <div className="row mb-5">
          <div className="col-12 col-md-3 text-center">
            <strong>الإيميل الجامعي</strong>
            <p className="mt-2">{receipt.email}</p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>الاسم</strong>
            <p className="mt-2">{receipt.name}</p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>ID</strong>
            <p className="mt-2">{receipt.id}</p>
          </div>
          <div className="col-12 col-md-3 text-center">
            <strong>القسم</strong>
            <p className="mt-2">{receipt.dept}</p>
          </div>
        </div>

        <div className="row mb-5 justify-content-center">
          <div className="col-12 text-center">
            <img
              src={receiptImg} // Placeholder for the receipt image
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
              setActionType("reject");
              setShowModal(true); // Show modal on reject button click
            }}
          >
            رفض الحجز
          </button>
          <button
            className={`btn btn-success py-2 px-1 px-sm-5 fs-4 rounded-pill ${styles.actionBtn}`}
            onClick={() => {
              setActionType("accept");
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
          {actionType === "accept" ? "موافقة على الحجز" : "رفض الحجز"}؟
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => setShowModal(false)}>
            إلغاء
          </Button>
          <Button variant="primary" onClick={handleAction}>
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
              src={receiptImg} // Placeholder for the receipt image
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
