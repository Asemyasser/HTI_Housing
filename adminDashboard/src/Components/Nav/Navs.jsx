import React, { useState } from "react";
import SideNav from "./SideNav/SideNav";
import TopNav from "./TopNav/TopNav";
import styles from "./Navs.module.css";

const Navs = ({
  collapsed,
  setCollapsed,
  setIsAuthenticated,
  onSearch,
  setSearchQuery,
  searchQuery,
}) => {
  const [title, setTitle] = useState("الواجهة الرئيسية");

  return (
    <div className={styles.navs}>
      <SideNav
        setTitle={setTitle}
        collapsed={collapsed}
        setCollapsed={setCollapsed}
        setIsAuthenticated={setIsAuthenticated}
      />
      <TopNav
        title={title}
        collapsed={collapsed}
        setCollapsed={setCollapsed}
        onSearch={onSearch}
        setSearchQuery={setSearchQuery}
        searchQuery={searchQuery}
      />
    </div>
  );
};

export default Navs;
