const colors = require("tailwindcss/colors");

module.exports = {
  purge: [
    "../**/*.html.eex",
    "../**/*.html.leex",
    "../**/views/**/*.ex",
    "../**/live/**/*.ex",
    "./js/**/*.js",
  ],
  darkmode: false,
  extend: {},
  theme: {
    extend: {
      maxHeight: {
        "(screen-24)": "calc(100vh - 6rem)",
      },
      height: {
        "screen-24": "calc(100vh - 6rem)",
        "screen-1/2": "calc(100vh - 50vh)",
      },
      fontSize: {
        xxs: "0.50rem",
      },
      colors: {
        "light-green": "#f1f5f4",
        blueGray: colors.blueGray,
        coolGray: colors.coolGray,
        gray: colors.gray,
        trueGray: colors.trueGray,
        warmGray: colors.warmGray,
        red: colors.red,
        orange: colors.orange,
        amber: colors.amber,
        yellow: colors.yellow,
        lime: colors.lime,
        green: colors.green,
        emerald: colors.emerald,
        teal: colors.teal,
        cyan: colors.cyan,
        lightBlue: colors.lightBlue,
        blue: colors.blue,
        indigo: colors.indigo,
        violet: colors.violet,
        purple: colors.purple,
        fuchsia: colors.fuchsia,
        pink: colors.pink,
        rose: colors.rose,
      },
      screens: {
        "2xl": "1366px",
        "3xl": "1800px",
      },
      spacing: {
        128: "32rem",
        144: "36rem",
      },
      transitionDuration: {
        2000: "2000ms",
        2500: "2500ms",
        3000: "3000ms",
      },
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/forms")],
};
