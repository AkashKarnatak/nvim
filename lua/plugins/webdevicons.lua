local colors = {
  bg = "#23272e",
  fg = "#bbc2cf",
  fg_alt = "#5B6268",
  yellow = "#E8D44D",
  cyan = "#46D9FF",
  green = "#98be65",
  orange = "#da8548",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ff6c6b",
}

require("nvim-web-devicons").set_icon {
  c = {
     icon = "",
     color = colors.blue,
     name = "c",
  },
  css = {
     icon = "",
     color = colors.blue,
     name = "css",
  },
  pdf = {
     icon = "",
     color = colors.red,
     name = "pdf",
  },
  deb = {
     icon = "",
     color = colors.cyan,
     name = "deb",
  },
  Dockerfile = {
     icon = "",
     color = colors.cyan,
     name = "Dockerfile",
  },
  [".dockerignore"] = {
     icon = "",
     color = colors.fg_alt,
     name = "dockerignore",
  },
  ["docker-compose.yml"] = {
     icon = "",
     color = colors.red,
     name = "DockerCompose",
  },
  html = {
     icon = "",
     color = colors.orange,
     name = "html",
  },
  gohtml = {
     icon = "",
     color = colors.orange,
     name = "gohtml",
  },
  jpeg = {
     icon = "",
     color = colors.magenta,
     name = "jpeg",
  },
  jpg = {
     icon = "",
     color = colors.magenta,
     name = "jpg",
  },
  js = {
     icon = "",
     color = colors.yellow,
     name = "js",
  },
  lock = {
     icon = "",
     color = colors.red,
     name = "lock",
  },
  lua = {
     icon = "",
     color = colors.blue,
     name = "lua",
  },
  Makefile = {
     icon = "",
     color = '#6d8086',
     name = "Makefile",
  },
  mp3 = {
     icon = "",
     color = colors.fg,
     name = "mp3",
  },
  mp4 = {
     icon = "",
     color = colors.fg,
     name = "mp4",
  },
  webm = {
     icon = "",
     color = colors.fg,
     name = "webm",
  },
  norg = {
     icon = "",
     color = colors.blue,
     name = "norg",
  },
  out = {
     icon = "",
     color = colors.fg,
     name = "out",
  },
  png = {
     icon = "",
     color = colors.magenta,
     name = "png",
  },
  py = {
     icon = "",
     color = colors.blue,
     name = "py",
  },
  ["robots.txt"] = {
     icon = "ﮧ",
     color = colors.red,
     name = "robots",
  },
  toml = {
     icon = "",
     color = colors.blue,
     name = "toml",
  },
  ts = {
     icon = "ﯤ",
     color = colors.blue,
     name = "ts",
  },
  ttf = {
     icon = "",
     color = colors.fg,
     name = "TrueTypeFont",
  },
  rb = {
     icon = "",
     color = colors.red,
     name = "rb",
  },
  rpm = {
     icon = "",
     color = colors.red,
     name = "rpm",
  },
  vue = {
     icon = "﵂",
     color = colors.green,
     name = "vue",
  },
  woff = {
     icon = "",
     color = colors.fg,
     name = "WebOpenFontFormat",
  },
  woff2 = {
     icon = "",
     color = colors.fg,
     name = "WebOpenFontFormat2",
  },
  xz = {
     icon = "",
     color = colors.yellow,
     name = "xz",
  },
  zip = {
     icon = "",
     color = colors.yellow,
     name = "zip",
  },
}
