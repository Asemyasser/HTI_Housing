import axios from "axios";
import { toast } from "react-toastify";

// 1. Create the instance
const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
  headers: {
    "Content-Type": "application/json",
  },
});

// 2. Request Interceptor (Adds Token automatically)
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("authToken");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

// 3. Response Interceptor (Handles Errors globaly)
api.interceptors.response.use(
  (response) => response,
  (error) => {
    // If token is expired or invalid (401), kick user out
    if (error.response?.status === 401) {
      localStorage.removeItem("authToken");
      localStorage.removeItem("userRole");
      // Optional: Force reload to trigger PrivateRoute check
      // window.location.href = "/login";
    }

    // Allow specific components to handle their own errors if needed
    return Promise.reject(error);
  }
);

export default api;
