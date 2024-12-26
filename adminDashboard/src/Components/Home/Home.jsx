import React from "react";
import styles from "./Home.module.css";
import Card from "./Card/Card";
import "bootstrap/dist/css/bootstrap.min.css";

const Home = () => {
  const data = [
    { title: "جميع الطلبات", number: 1000, gradientClass: "gradientAll" },
    {
      title: "الطلبات قيد الانتظار",
      number: 200,
      gradientClass: "gradientPending",
    },
    {
      title: "الطلبات الموافق عليها",
      number: 700,
      gradientClass: "gradientApproved",
    },
    {
      title: "الطلبات المرفوضة",
      number: 100,
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
            <p className={styles.total}>1000 طالب</p>
          </div>
        </div>

        <div className="row">
          <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
            {data.map((item, index) => (
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
                percentage={"1000"}
                title="جميع الطلبات"
                bgColor="linear-gradient(227.32deg, #AC39D5 -5.2%, #D539C5 73.99%)"
                path={"/requests"}
              />
              <Card
                percentage={20}
                title="طلبات قيد الانتظار"
                bgColor="linear-gradient(198.93deg, #461EE7 12.77%, #1EB6E7 94.68%)"
                path={"/requests"}
              />
            </div>
            <div className="row justify-content-end gap-4">
              <Card
                percentage={70}
                title="الطلبات الموافق عليها"
                bgColor="linear-gradient(204.11deg, #40D5A8 15.46%, #40BAD5 95.79%)"
                path={"/requests/accepted"}
              />
              <Card
                percentage={10}
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
