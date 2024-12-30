import React, { useEffect, useState } from "react";
import styles from "./Home.module.css";
import Card from "./Card/Card";
import "bootstrap/dist/css/bootstrap.min.css";
import axios from "axios";

const Home = () => {
  const [data, setData] = useState({
    total: 0,
    pending: 0,
    approved: 0,
    rejected: 0,
  });

  useEffect(() => {
    const fetchData = async () => {
      try {
        const token = localStorage.getItem("authToken");

        const headers = {
          token: `${token}`,
          "Content-Type": "application/json", // Add any other headers as needed
        };

        const [pendingRes, approvedRes, rejectedRes] = await Promise.all([
          axios.get(`${import.meta.env.VITE_API_BASE_URL}/user/students`, {
            headers,
          }),
          axios.get(
            `${import.meta.env.VITE_API_BASE_URL}/user/students/approved`,
            { headers }
          ),
          axios.get(
            `${import.meta.env.VITE_API_BASE_URL}/user/students/rejected`,
            { headers }
          ),
        ]);

        const pending = pendingRes.data.users.length;
        const approved = approvedRes.data.users.length;
        const rejected = rejectedRes.data.users.length;
        const total = pending + approved + rejected;
        console.log(total);

        setData({ total, pending, approved, rejected });
        console.log(data);
        console.log(pendingRes);
      } catch (error) {
        console.error("Error fetching request data:", error);
      }
    };

    console.log(data.total);

    fetchData();
  }, []);

  const cardData = [
    {
      title: "جميع الطلبات",
      number: data.total,
      gradientClass: "gradientAll",
    },
    {
      title: "الطلبات قيد الانتظار",
      number: data.pending,
      gradientClass: "gradientPending",
    },
    {
      title: "الطلبات الموافق عليها",
      number: data.approved,
      gradientClass: "gradientApproved",
    },
    {
      title: "الطلبات المرفوضة",
      number: data.rejected,
      gradientClass: "gradientRejected",
    },
  ];

  return (
    <div className={`container `}>
      <div className={`${styles.dashboard}`}>
        <div className="row my-2 pe-5">
          <div className="col-12">
            <h2 className={`${styles.header} mb-3`}>الطلاب (%)</h2>
            <h3 className="text-secondary h5 mb-2">إجمالى عدد الطلاب</h3>
            <p className={styles.total}>{data.total} طالب</p>
          </div>
        </div>

        <div className="row">
          <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
            {cardData.map((item, index) => (
              <div key={index} className={styles.statusCard}>
                <div
                  className={`${styles.bar} ${styles[item.gradientClass]}`}
                ></div>
                <div>
                  <h6 className={styles.title}>{item.title}</h6>
                  <p className={styles.number}>{item.number} طالب</p>
                </div>
              </div>
            ))}
          </div>
          <div className="col-lg-9 col-md-6 col-sm-12 ps-5 pe-md-0 pe-5">
            <div className="row mb-4 justify-content-end gap-4">
              <Card
                percentage={data.total.toString()}
                title="جميع الطلبات"
                bgColor="linear-gradient(227.32deg, #AC39D5 -5.2%, #D539C5 73.99%)"
                path={"/requests"}
              />
              <Card
                percentage={
                  data.pending ? (data.pending / data.total) * 100 : 0
                }
                title="طلبات قيد الانتظار"
                bgColor="linear-gradient(198.93deg, #461EE7 12.77%, #1EB6E7 94.68%)"
                path={"/requests"}
              />
            </div>
            <div className="row justify-content-end gap-4">
              <Card
                percentage={
                  data.approved ? (data.approved / data.total) * 100 : 0
                }
                title="الطلبات الموافق عليها"
                bgColor="linear-gradient(204.11deg, #40D5A8 15.46%, #40BAD5 95.79%)"
                path={"/requests/accepted"}
              />
              <Card
                percentage={
                  data.rejected ? (data.rejected / data.total) * 100 : 0
                }
                title="الطلبات المرفوضة"
                bgColor="linear-gradient(221.17deg, #F33D3D 5.91%, #F56565 97.67%)"
                path={"/requests/rejected"}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;
