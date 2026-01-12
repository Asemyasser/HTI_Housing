import nodemailer from "nodemailer";

export const sendEmail = async ({ to, subject, html }) => {
  try {
    const transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 465,
      secure: true, // Use SSL
      service: "gmail",
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASSWORD,
      },
    });

    console.log("Attempting to send email to:", to);

    const info = await transporter.sendMail({
      to,
      from: `"HTI Housing System" <${process.env.EMAIL_USER}>`,
      subject,
      html,
    });

    console.log("Email sent successfully:", {
      messageId: info.messageId,
      response: info.response,
    });

    return true;
  } catch (error) {
    console.error("Failed to send email:", {
      errorMessage: error.message,
      errorCode: error.code,
      errorResponse: error.response,
    });
    return false;
  }
};
