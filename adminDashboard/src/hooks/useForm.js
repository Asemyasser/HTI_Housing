import { useState } from "react";
import axios from "axios";

export const useForm = (initialState, apiEndpoint, onSuccess) => {
  const [formData, setFormData] = useState(initialState);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      const response = await axios.post(apiEndpoint, formData);
      onSuccess(response.data);
    } catch (err) {
      setError(
        (err.response?.data?.message === "invalid credentails"
          ? "بيانات غير صحيحة"
          : err.response?.data?.message) || "حدث خطأ ما"
      );
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  return { formData, handleChange, handleSubmit, loading, error };
};
