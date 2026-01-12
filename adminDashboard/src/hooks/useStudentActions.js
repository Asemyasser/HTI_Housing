import { useState } from "react";
import api from "../services/api";
import { toast } from "react-toastify";

export const useStudentActions = (setFilteredData) => {
  const [actionLoadingId, setActionLoadingId] = useState(null);

  const handleAction = async (studentId, actionType) => {
    // actionType: "approve-student" or "reject-student"
    setActionLoadingId(studentId);

    try {
      await api.patch(`/auth/admin/${actionType}/${studentId}`);

      toast.success(
        actionType === "approve-student"
          ? "تم قبول الطالب بنجاح"
          : "تم رفض الطالب"
      );

      // Optimistic UI Update: Remove the student from the list immediately
      if (setFilteredData) {
        setFilteredData((prevData) =>
          prevData.filter((student) => student._id !== studentId)
        );
      }
    } catch (err) {
      console.error("Action Error:", err);

      let errorMessage = "حدث خطأ أثناء تنفيذ العملية";

      if (err.response && err.response.data) {
        // 1. Is the data itself a string?
        if (typeof err.response.data === "string") {
          errorMessage = err.response.data;
        }
        // 2. Does it have a 'message' property?
        else if (err.response.data.message) {
          // Check if 'message' is a string or object
          if (typeof err.response.data.message === "string") {
            errorMessage = err.response.data.message;
          } else {
            // If message is an object (e.g. validation errors), stringify it
            errorMessage = JSON.stringify(err.response.data.message);
          }
        }
      }
      // 3. Fallback to generic error message
      else if (err.message) {
        errorMessage = err.message;
      }

      // Final sanity check: if somehow it's still an object, kill it
      if (typeof errorMessage !== "string") {
        errorMessage = "Error: Invalid response format";
      }

      toast.error(errorMessage);
    } finally {
      setActionLoadingId(null);
    }
  };

  return { handleAction, actionLoadingId };
};
