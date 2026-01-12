import styles from "./Home.module.css";
import Card from "./Card/Card";
import { useDashboardStats } from "../../hooks/useDashboardStats";

const Home = () => {
  const { stats, loading, error } = useDashboardStats();

  if (loading)
    return (
      <p role="status" className="text-center mt-5">
        ...جاري التحميل
      </p>
    );
  if (error)
    return (
      <p role="alert" className="text-danger text-center">
        {error}
      </p>
    );

  const getPercentage = (value) => {
    return stats.total > 0 ? (value / stats.total) * 100 : 0;
  };

  const cardData = [
    {
      title: "جميع الطلبات",
      number: stats.total,
      gradientClass: "gradientAll",
    },
    {
      title: "الطلبات قيد الانتظار",
      number: stats.pending,
      gradientClass: "gradientPending",
    },
    {
      title: "الطلبات الموافق عليها",
      number: stats.approved,
      gradientClass: "gradientApproved",
    },
    {
      title: "الطلبات المرفوضة",
      number: stats.rejected,
      gradientClass: "gradientRejected",
    },
  ];

  return (
    <div className="container">
      <section className={styles.dashboard} aria-label="لوحة التحكم">
        <div className="row my-2 pe-5">
          <div className="col-12">
            <h2 className={`${styles.header} mb-3`}>الطلاب (%)</h2>
            <h3 className="text-secondary h5 mb-2">إجمالى عدد الطلاب</h3>
            <p className={styles.total}>{stats.total} طالب</p>
          </div>
        </div>

        <div className="row">
          {/* Status Bars */}
          <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
            {cardData.map((item, index) => (
              <div key={index} className={styles.statusCard}>
                <div
                  className={`${styles.bar} ${styles[item.gradientClass]}`}
                ></div>
                <div>
                  <h3 className={`${styles.title} h6`}>{item.title}</h3>
                  <p className={styles.number}>{item.number} طالب</p>
                </div>
              </div>
            ))}
          </div>

          {/* Large Cards */}
          <div className="col-lg-9 col-md-6 col-sm-12 ps-5 pe-md-0 pe-5">
            <div className="row mb-4 justify-content-end gap-4">
              <Card
                percentage={stats.total.toString()}
                title="جميع الطلبات"
                bgColor="linear-gradient(227.32deg, #AC39D5 -5.2%, #D539C5 73.99%)"
                path={"/requests"}
              />
              <Card
                percentage={getPercentage(stats.pending)}
                title="طلبات قيد الانتظار"
                bgColor="linear-gradient(198.93deg, #461EE7 12.77%, #1EB6E7 94.68%)"
                path={"/requests"}
              />
            </div>
            <div className="row justify-content-end gap-4">
              <Card
                percentage={getPercentage(stats.approved)}
                title="الطلبات الموافق عليها"
                bgColor="linear-gradient(204.11deg, #40D5A8 15.46%, #40BAD5 95.79%)"
                path={"/requests/accepted"}
              />
              <Card
                percentage={getPercentage(stats.rejected)}
                title="الطلبات المرفوضة"
                bgColor="linear-gradient(221.17deg, #F33D3D 5.91%, #F56565 97.67%)"
                path={"/requests/rejected"}
              />
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Home;
