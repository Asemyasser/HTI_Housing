import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
  useLocation,
} from "react-router-dom";
import { Suspense, lazy } from "react";
import Layout from "./Layout";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useAuth } from "./context/AuthContext";

// Lazy loading components
const Home = lazy(() => import("./Components/Home/Home"));
const StudentRequests = lazy(() =>
  import("./Components/StudentRequests/StudentRequests")
);
const PendingRequests = lazy(() =>
  import("./Components/StudentRequests/PendingRequests/PendingRequests")
);
const AcceptedRequests = lazy(() =>
  import("./Components/StudentRequests/AcceptedRequests/AcceptedRequests")
);
const RejectedRequests = lazy(() =>
  import("./Components/StudentRequests/RejectedRequests/RejectedRequests")
);
const Receipts = lazy(() => import("./Components/Receipts/Receipts"));
const Settings = lazy(() => import("./Components/Settings/Settings"));
const ReceiptDetails = lazy(() =>
  import("./Components/Receipts/ReceiptDetails")
);
const Login = lazy(() => import("./Components/Login/Login"));
const Register = lazy(() => import("./Components/Register/Register"));
const NotFound = lazy(() => import("./Components/NotFound/NotFound"));

function PrivateRoute({ element }) {
  const { isAuthenticated } = useAuth();
  const location = useLocation();

  if (!isAuthenticated) {
    // Redirect to login, but remember where they were trying to go
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  return element;
}

function App() {
  return (
    <>
      <ToastContainer
        position="top-right"
        autoClose={3000}
        rtl={true}
        theme="colored"
      />

      <Router basename="/HTI_Housing/">
        <Suspense
          fallback={
            <div className="text-center mt-5" role="status">
              ...جاري التحميل
            </div>
          }
        >
          <Routes>
            {/* Public Routes */}
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />

            {/* Protected Routes Wrapper */}
            <Route path="/" element={<PrivateRoute element={<Layout />} />}>
              <Route index element={<Home />} />

              <Route path="requests" element={<StudentRequests />}>
                <Route index element={<PendingRequests />} />
                <Route path="accepted" element={<AcceptedRequests />} />
                <Route path="rejected" element={<RejectedRequests />} />
              </Route>

              <Route path="receipts" element={<Receipts />} />
              <Route path="receipts/:id" element={<ReceiptDetails />} />
              <Route path="settings" element={<Settings />} />

              <Route path="*" element={<NotFound />} />
            </Route>
          </Routes>
        </Suspense>
      </Router>
    </>
  );
}

export default App;
