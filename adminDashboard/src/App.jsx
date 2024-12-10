import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";

import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import StudentRequests from "./Components/StudentRequests/StudentRequests";
import Home from "./Components/Home/Home";
import Receipts from "./Components/Receipts/Receipts";
import Settings from "./Components/Settings/Settings";
import Layout from "./Layout";
import ReceiptDetails from "./Components/Receipts/ReceiptDetails";
import { ToastContainer } from "react-toastify";
import Login from "./Components/Login/login";
import Register from "./Components/Register/Register";
function App() {
  return (
    <>
      <ToastContainer autoClose={2000} />
      <Router>
        <Routes>
          <Route path="/" element={<Layout />}>
            <Route index element={<Home />} />
            <Route path="/requests" element={<StudentRequests />} />
            <Route path="/receipts" element={<Receipts />} />
            <Route path="/receipt-details/:id" element={<ReceiptDetails />} />
            <Route path="/settings" element={<Settings />} />
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
          </Route>
        </Routes>
      </Router>
    </>
  );
}

export default App;
