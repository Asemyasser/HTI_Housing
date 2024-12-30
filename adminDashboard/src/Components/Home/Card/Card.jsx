import React, { useEffect, useState } from "react";
import styles from "./Card.module.css";
import { useNavigate } from "react-router-dom";

const Card = ({ percentage, title, bgColor, path }) => {
  const [currentPercentage, setCurrentPercentage] = useState(
    typeof percentage === "string" ? 100 : 0
  );
  const navigate = useNavigate();
  function cardClickHandler() {
    navigate(path);
  }

  useEffect(() => {
    if (typeof percentage === "string") {
      // Skip animation and set the white section to 100%
      setCurrentPercentage(100);
      return;
    }
    // Animate the percentage from 0 to the desired value
    let progress = 0;
    const interval = setInterval(() => {
      if (progress < percentage) {
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
            {typeof percentage === "string"
              ? percentage
              : `${currentPercentage}%`}{" "}
            {/* Show percentage normally */}
          </span>
        </div>
      </span>
      <p className={styles.title}>{title}</p>
    </div>
  );
};

export default Card;
