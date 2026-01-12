import { User } from "../../db/index.js";
import { AppError } from "../utils/appError.js";
import { status } from "../utils/constant/enums.js";
import { messages } from "../utils/constant/messages.js";
import { verifyToken } from "../utils/token.js";

export const isAuthenticated = () => {
  return async (req, res, next) => {
    // 1. Try to find the token in two places
    let { token } = req.headers;

    // If not in "token" header, check "Authorization" header
    if (!token && req.headers.authorization) {
      // Format is usually "Bearer <token>"
      if (req.headers.authorization.startsWith("Bearer ")) {
        token = req.headers.authorization.split(" ")[1];
      } else {
        token = req.headers.authorization;
      }
    }

    // 2. If still no token found, stop here
    if (!token) {
      return next(new AppError("Token not provided", 401));
    }

    // 3. Verify token
    const payload = verifyToken({ token });
    if (payload.message) {
      return next(new AppError(payload.message, 401));
    }

    // 4. Check existence and verification status
    const authUser = await User.findOne({
      _id: payload._id,
      status: status.VERIFIED,
    });
    if (!authUser) {
      return next(new AppError(messages.user.notFound, 404));
    }

    req.authUser = authUser;
    req.authUser.gender = payload.gender; // Note: Ensure gender is actually in the token payload
    next();
  };
};
