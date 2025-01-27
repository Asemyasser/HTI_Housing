import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  base: "/HTI_Housing/",
  server: {
    // proxy: {
    //   "/api": {
    //     target: "https://htihousing-eel315fa.b4a.run",
    //     changeOrigin: true,
    //     rewrite: (path) => path.replace(/^\/api/, ""),
    //   },
    // },
  },
});
