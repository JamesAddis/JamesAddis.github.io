(function (doc, win) {
  var checkbox = doc.querySelector("input[name=mode]");

  checkbox.addEventListener("change", function () {
    if (this.checked) {
      doc.documentElement.setAttribute("data-theme", "dark");
      var moon = doc.getElementById("moon");
      moon.innerHTML = feather.icons["sun"].toSvg({
        fill: "var(--fg-color-dark)",
      });
    } else {
      doc.documentElement.setAttribute("data-theme", "light");
      var moon = doc.getElementById("moon");
      moon.innerHTML = feather.icons["moon"].toSvg({
        fill: "var(--fg-color-dark)",
      });
    }
    (function (local) {
      local.setItem("darkMode", this.checked);
    })(win.localStorage);
  });
  // keep dark mode preference
  // (function (local) {
  //   checkbox.checked = local.getItem("darkMode");
  //   checkbox.dispatchEvent(new Event("change"));
  // })(win.localStorage);
})(document, window);

