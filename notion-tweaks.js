console.log("-|- TWEAKS SCRIPT -|-");

const tweaks = () => {
  console.log("Running tweaks");

  // resize checkbox rows in tables
  w = "32px";
  document
    .querySelectorAll(".notion-table-view svg.checkboxSquare")
    .forEach((x) => (x.parentNode.parentNode.parentNode.style.width = w));
  document
    .querySelectorAll(".notion-table-view svg.check")
    .forEach((x) => (x.parentNode.parentNode.parentNode.style.width = w));
  document
    .querySelectorAll(".notion-table-view svg.typesCheckbox")
    .forEach(
      (x) => (x.parentNode.parentNode.parentNode.parentNode.style.width = w)
    );

  // page properties double column
  let propertiesWrapper = document.querySelector(
    'div[style="padding-left: calc(96px + env(safe-area-inset-left)); padding-right: calc(96px + env(safe-area-inset-right)); max-width: 100%; width: 100%;"] div[style="width: 100%; max-width: 100%; padding-top: 8px; padding-bottom: 8px; margin: 0px auto;"] > div'
  );
  if (propertiesWrapper) {
    propertiesWrapper.style.display = "flex";
    propertiesWrapper.style.flexWrap = "wrap";
    propertiesWrapper.classList.add("propertiesWrapper");

    let childs = propertiesWrapper.children;
    for (let i = 0; i < childs.length; i++) {
      propertiesWrapper.children.item(i).style.width = "50%";
    }
  }
};

let customTweaks = setInterval(tweaks, 5000);
