import { useState, useEffect } from "react";
import api from "../services/api";

export const useReceipts = (setFilteredData, setData) => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchReceipts = async () => {
      try {
        setLoading(true);
        // Uses the centralized API (auto-token attachment)
        const response = await api.get("/payment/PendingPayment");

        const data = response.data.data || [];

        if (setData && setFilteredData) {
          setData(data);
          setFilteredData(data);
        }
      } catch (err) {
        setError(err.response?.data?.message || err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchReceipts();
  }, [setFilteredData, setData]);

  return { loading, error };
};
