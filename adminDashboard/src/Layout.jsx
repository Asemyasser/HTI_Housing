import React, { useState } from "react";
import { Outlet, useLocation } from "react-router-dom";
import Navs from "./Components/Nav/Navs";
import "./Layout.css";
function Layout({ setIsAuthenticated }) {
  const [collapsed, setCollapsed] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [filteredData, setFilteredData] = useState([]); // Filtered student data
  const [data, setData] = useState([]);

  // Use `useLocation` to get the current route
  const location = useLocation();

  // Define routes where `Navs` and `section` class should not be displayed
  const excludedRoutes = ["/login", "/register"];

  // Check if the current route is excluded
  const isExcludedRoute = excludedRoutes.includes(location.pathname);

  const handleSearch = (e) => {
    const query = e.target.value; // Get the current value from the input field
    setSearchQuery(query); // Update the search query state (still necessary for state tracking)

    if (query) {
      const filtered = data.filter((item) => {
        // Filter based on the current query (e.target.value)
        return Object.values(item)
          .join("")
          .toLowerCase()
          .includes(query.toLowerCase());
      });
      setFilteredData(filtered); // Update the filtered data
    } else {
      setFilteredData(data); // Reset to original data if input is empty
    }
  };

  return (
    <>
      {/* Render `Navs` only if the route is not excluded */}
      {!isExcludedRoute && (
        <Navs
          collapsed={collapsed}
          setCollapsed={setCollapsed}
          setIsAuthenticated={setIsAuthenticated}
          onSearch={handleSearch}
          setSearchQuery={setSearchQuery}
          searchQuery={searchQuery}
        />
      )}

      {/* Conditionally apply `section` class */}
      <div
        className={
          isExcludedRoute ? "" : `section ${collapsed ? "collapsed" : ""}`
        }
      >
        {/* Render the nested routes */}
        <Outlet context={{ filteredData, setFilteredData, setData, data }} />
      </div>
    </>
  );
}

export default Layout;
