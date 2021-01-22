// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

const theme = {
  padding: "3px 5px 5px 5px",
  backgroundColor: "#191724",
  foregroundColor: "#e0def4",
  cursorColor: "#e0def4",
  cursorAccentColor: "#000",
  selectionColor: "rgba(112, 110, 134, 0.3)",
  borderColor: "#000",
  colors: {
    black: "#706e86",
    lightBlack: "#706e86",
    white: "#e0def4",
    lightWhite: "#e0def4",
    blue: "#31748f",
    lightBlue: "#31748f",
    cyan: "#ebbcba",
    lightCyan: "#ebbcba",
    green: "#9ccfd8",
    lightGreen: "#9ccfd8",
    magenta: "#c4a7e7",
    lightMagenta: "#c4a7e7",
    red: "#eb6f92",
    lightRed: "#eb6f92",
    yellow: "#f6c177",
    lightYellow: "#f6c177",
  },
};

module.exports = {
  config: {
    updateChannel: "stable",
    fontSize: 16,
    fontFamily: '"Fira Code", monospace',
    fontWeight: "normal",
    fontWeightBold: "bold",
    lineHeight: 1,
    letterSpacing: 0,
    cursorShape: "BLOCK",
    cursorBlink: false,
    css: "",
    termCSS: "",
    showHamburgerMenu: "",
    showWindowControls: "",
    ...theme,
    shell: "/usr/local/bin/zsh",
    shellArgs: ["--login"],
    env: {},
    bell: "SOUND",
    copyOnSelect: true,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: "vertical",
    webGLRenderer: false, // False so that ligatures work.
    webLinksActivationKey: "meta",
  },
  plugins: [
    "hyper-font-ligatures",
    "hyper-tabs-enhanced",
    "hyper-fading-scrollbar",
  ],
  localPlugins: [],
  keymaps: {
    "tab:new": "meta+t",
  },
};
