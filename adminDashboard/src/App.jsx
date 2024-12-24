import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { Suspense, lazy, useState, useEffect } from "react";
import Layout from "./Layout";
import { ToastContainer } from "react-toastify";

// Lazy loading components
const Home = lazy(() => import("./Components/Home/Home"));
const StudentRequests = lazy(() =>
  import("./Components/StudentRequests/StudentRequests")
);
const Receipts = lazy(() => import("./Components/Receipts/Receipts"));
const Settings = lazy(() => import("./Components/Settings/Settings"));
const ReceiptDetails = lazy(() =>
  import("./Components/Receipts/ReceiptDetails")
);
const Login = lazy(() => import("./Components/Login/Login"));
const Register = lazy(() => import("./Components/Register/Register"));
const NotFound = lazy(() => import("./Components/NotFound/NotFound"));

function PrivateRoute({ element, ...rest }) {
  const token = localStorage.getItem("authToken"); // Replace with your token logic
  return token ? element : <Navigate to="/login" replace />;
}

function App() {
  return (
    <>
      <ToastContainer autoClose={2000} />
      <Router basename="/Graduation_Project/">
        <Suspense fallback={<div>Loading...</div>}>
          <Routes>
            {/* Public Routes */}
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />

            {/* Protected Routes */}
            <Route path="/" element={<PrivateRoute element={<Layout />} />}>
              <Route index element={<PrivateRoute element={<Home />} />} />
              <Route
                path="/requests"
                element={<PrivateRoute element={<StudentRequests />} />}
              />
              <Route
                path="/receipts"
                element={<PrivateRoute element={<Receipts />} />}
              />
              <Route
                path="/receipt-details/:id"
                element={<PrivateRoute element={<ReceiptDetails />} />}
              />
              <Route
                path="/settings"
                element={<PrivateRoute element={<Settings />} />}
              />
              <Route
                path="*"
                element={<PrivateRoute element={<NotFound />} />}
              />
            </Route>
          </Routes>
        </Suspense>
      </Router>
    </>
  );
}

export default App;
