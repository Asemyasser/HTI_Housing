import { useState, useEffect, useCallback } from "react";
import api from "../services/api";

// This hook is generic! It can fetch pending, approved, or rejected students
export const useStudents = (endpoint, setFilteredData, setData) => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchStudents = useCallback(async () => {
    try {
      setLoading(true);
      const response = await api.get(endpoint);

      // Handle response structure (API returns { users: [...] } or { data: [...] })
      const users = response.data.users || response.data.data || [];

      if (setData && setFilteredData) {
        setData(users);
        setFilteredData(users);
      }
    } catch (err) {
      setError(err.response?.data?.message || err.message);
    } finally {
      setLoading(false);
    }
  }, [endpoint, setData, setFilteredData]);

  useEffect(() => {
    fetchStudents();
  }, [fetchStudents]);

  return { loading, error, refetch: fetchStudents };
};
