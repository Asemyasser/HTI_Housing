import React, { useEffect, useState } from "react";
import styles from "./Card.module.css";
import { Navigate, useNavigate } from "react-router-dom";

const Card = ({ percentage, title, bgColor, path }) => {
  const [currentPercentage, setCurrentPercentage] = useState(percentage);
  const navigate = useNavigate();
  function cardClickHandler() {
    navigate(path);
  }

  useEffect(() => {
    // Animate the percentage from 0 to the desired value
    let progress = 0;
    const interval = setInterval(() => {
      if (progress < percentage && typeof percentage === "number") {
        progress++;
        setCurrentPercentage(progress);
      } else {
        clearInterval(interval);
      }
    }, 15); // Adjust the interval time to control animation speed

    return () => clearInterval(interval);
  }, [percentage]);
  return (
    <div
      onClick={cardClickHandler}
      className={styles.card}
      style={{
        background: bgColor,
      }}
    >
      <span
        className={styles.circle}
        style={{
          background: `conic-gradient(white ${currentPercentage}%, #FFFFFF38 0%)`,
        }}
      >
        <div className={styles.innerCircle} style={{ background: bgColor }}>
          <span>
            {currentPercentage}
            {typeof percentage === "string" ? "" : "%"}
          </span>
        </div>
      </span>
      <p className={styles.title}>{title}</p>
    </div>
  );
};

export default Card;
