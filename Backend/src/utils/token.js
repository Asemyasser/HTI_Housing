import jwt from "jsonwebtoken";

export const generateToken = ({
  payload,
  secretKey = process.env.GENERATE_SECRET,
}) => {
  return jwt.sign(payload, secretKey);
};

export const verifyToken = ({
  token,
  secretKey = process.env.GENERATE_SECRET,
}) => {
  try {
    return jwt.verify(token, secretKey);
  } catch (error) {
    return { message: error.message };
  }
};
