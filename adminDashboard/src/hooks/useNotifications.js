import { useState, useEffect } from "react";
import api from "../services/api";

export const useNotifications = () => {
  const [notifications, setNotifications] = useState([]);

  useEffect(() => {
    const fetchNotifications = async () => {
      try {
        // Fetch Students and Payments in parallel
        const [requestsResponse, receiptsResponse] = await Promise.all([
          api.get("/user/students"),
          api.get("/payment/pendingPayment"),
        ]);

        // Format Requests
        const requests = (requestsResponse.data.users || []).map((item) => ({
          type: "request",
          timestamp: item.createdAt || new Date().toISOString(),
        }));

        // Format Receipts
        const receipts = (receiptsResponse.data.data || []).map((item) => ({
          type: "receipt",
          timestamp: item.createdAt || new Date().toISOString(),
        }));

        const fetchedNotifications = [...requests, ...receipts];

        // Merge with Local Storage & Filter Deleted
        const storedNotifications =
          JSON.parse(localStorage.getItem("notifications")) || [];
        const deletedList =
          JSON.parse(localStorage.getItem("deletedNotifications")) || [];

        // Combine and Filter
        const uniqueNotifications = [
          ...storedNotifications,
          ...fetchedNotifications,
        ].filter((notif) => !deletedList.includes(notif.timestamp));

        // De-duplicate based on timestamp (simple approach)
        const seen = new Set();
        const finalNotifications = uniqueNotifications.filter((el) => {
          const duplicate = seen.has(el.timestamp);
          seen.add(el.timestamp);
          return !duplicate;
        });

        setNotifications(finalNotifications);
        localStorage.setItem(
          "notifications",
          JSON.stringify(finalNotifications)
        );
      } catch (error) {
        console.error("Error fetching notifications:", error);
      }
    };

    fetchNotifications();
  }, []);

  const deleteNotification = (index) => {
    const target = notifications[index];
    const updated = notifications.filter((_, i) => i !== index);

    setNotifications(updated);
    localStorage.setItem("notifications", JSON.stringify(updated));

    // Add to deleted list (Persist the deletion)
    const deletedList =
      JSON.parse(localStorage.getItem("deletedNotifications")) || [];
    if (target) {
      deletedList.push(target.timestamp);
      localStorage.setItem("deletedNotifications", JSON.stringify(deletedList));
    }
  };

  return { notifications, deleteNotification };
};
