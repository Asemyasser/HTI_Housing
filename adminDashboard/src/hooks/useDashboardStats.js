import { useState, useEffect } from "react";
import api from "../services/api";

export const useDashboardStats = () => {
  const [stats, setStats] = useState({
    total: 0,
    pending: 0,
    approved: 0,
    rejected: 0,
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        // Promise.all runs these in parallel for better performance
        const [pendingRes, approvedRes, rejectedRes] = await Promise.all([
          api.get("/user/students"),
          api.get("/user/students/approved"),
          api.get("/user/students/rejected"),
        ]);

        const pending = pendingRes.data.users.length;
        const approved = approvedRes.data.users.length;
        const rejected = rejectedRes.data.users.length;

        setStats({
          total: pending + approved + rejected,
          pending,
          approved,
          rejected,
        });
      } catch (err) {
        console.error("Dashboard fetch error:", err);
        setError("فشل في تحميل البيانات");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  return { stats, loading, error };
};
