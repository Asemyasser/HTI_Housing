import React, { useState, useEffect } from "react";
import { Outlet, useLocation } from "react-router-dom";
import Navs from "./Components/Nav/Navs";
import "./Layout.css";

// This checks every property, even if it's inside another object (like booking.student.name)
const deepSearch = (item, query) => {
  if (!item) return false;

  // 1. If it's a string or number, check if it matches
  if (typeof item === "string" || typeof item === "number") {
    return String(item).toLowerCase().includes(query.toLowerCase());
  }

  // 2. If it's an array or object, loop through its children
  if (typeof item === "object") {
    return Object.values(item).some((value) => deepSearch(value, query));
  }

  return false;
};

function Layout() {
  const [collapsed, setCollapsed] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");

  // Data States
  const [data, setData] = useState([]);
  const [filteredData, setFilteredData] = useState([]);

  const location = useLocation();
  useEffect(() => {
    setSearchQuery("");
    setFilteredData(data);
  }, [location.pathname, data]);

  // Handle Input Change
  const handleSearch = (e) => {
    setSearchQuery(e.target.value);
  };

  // Debouncing Logic with Deep Search
  useEffect(() => {
    const handler = setTimeout(() => {
      if (searchQuery) {
        const filtered = data.filter((item) => deepSearch(item, searchQuery));
        setFilteredData(filtered);
      } else {
        setFilteredData(data);
      }
    }, 300);

    return () => {
      clearTimeout(handler);
    };
  }, [searchQuery, data]);

  return (
    <>
      <a
        href="#main-content"
        className="visually-hidden-focusable p-3 bg-light text-primary position-absolute top-0 start-0 z-3"
      >
        تخطى إلى المحتوى الرئيسي
      </a>

      <Navs
        collapsed={collapsed}
        setCollapsed={setCollapsed}
        onSearch={handleSearch}
        setSearchQuery={setSearchQuery}
        searchQuery={searchQuery}
      />

      <main
        id="main-content"
        className={`section ${collapsed ? "collapsed" : ""}`}
        role="main"
        tabIndex="-1"
      >
        <Outlet context={[filteredData, setFilteredData, setData]} />
      </main>
    </>
  );
}

export default Layout;
