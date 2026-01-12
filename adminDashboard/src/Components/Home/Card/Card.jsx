import React, { useEffect, useState } from "react";
import styles from "./Card.module.css";
import { Link } from "react-router-dom";

const Card = ({ percentage, title, bgColor, path }) => {
  const isString = typeof percentage === "string";
  const [currentPercentage, setCurrentPercentage] = useState(
    isString ? 100 : 0
  );

  useEffect(() => {
    if (isString) {
      setCurrentPercentage(100);
      return;
    }

    const target = Number(percentage);
    let progress = 0;

    const interval = setInterval(() => {
      if (progress < target) {
        progress++;
        setCurrentPercentage(progress);
      } else {
        clearInterval(interval);
      }
    }, 15);

    return () => clearInterval(interval);
  }, [percentage, isString]);

  return (
    <Link
      to={path}
      className={styles.card}
      style={{ background: bgColor }}
      aria-label={`${title}: ${
        isString ? percentage : `${currentPercentage}%`
      }`}
    >
      <span
        className={styles.circle}
        role="progressbar"
        aria-label={`نسبة ${title}`}
        aria-valuenow={isString ? 100 : currentPercentage}
        aria-valuemin="0"
        aria-valuemax="100"
        style={{
          background: `conic-gradient(white ${currentPercentage}%, #FFFFFF38 0%)`,
        }}
      >
        <div className={styles.innerCircle} style={{ background: bgColor }}>
          <span className={styles.percentageText}>
            {isString ? percentage : `${currentPercentage}%`}
          </span>
        </div>
      </span>
      <p className={`${styles.title} h5`}>{title}</p>
    </Link>
  );
};

export default Card;
