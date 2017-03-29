function loadTxt() {
  document.getElementById("tab0").innerHTML = "\u0421\u0435\u0440\u0432\u0438\u0441 FLICKR";
  document.getElementById("tab1").innerHTML = "\u041c\u043e\u0438 \u0444\u0430\u0439\u043b\u044b";
  document.getElementById("tab2").innerHTML = "\u042d\u0444\u0444\u0435\u043a\u0442\u044b";
  document.getElementById("lblTag").innerHTML = "\u0422\u0435\u0433:";
  document.getElementById("lblFlickrUserName").innerHTML = "\u0418\u043c\u044f \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044f Flickr:";
  document.getElementById("lnkLoadMore").innerHTML = "\u0417\u0430\u0433\u0440\u0443\u0437\u0438\u0442\u044c \u0431\u043e\u043b\u044c\u0448\u0435";
  document.getElementById("lblImgSrc").innerHTML = "URL \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f:";
  document.getElementById("lblWidthHeight").innerHTML = "\u0420\u0430\u0437\u043c\u0435\u0440\u044b:";
  var optAlign = document.getElementsByName("optAlign");
  optAlign[0].text = "";
  optAlign[1].text = "\u0421\u043b\u0435\u0432\u0430";
  optAlign[2].text = "\u0421\u043f\u0440\u0430\u0432\u0430";
  document.getElementById("lblTitle").innerHTML = "\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a:";
  document.getElementById("lblAlign").innerHTML = "\u0412\u044b\u0440\u0430\u0432\u043d\u0438\u0432\u0430\u043d\u0438\u0435:";
  document.getElementById("lblMargin").innerHTML = "\u041e\u0442\u0441\u0442\u0443\u043f\u044b: (TOP / RIGHT / BOTTOM / LEFT)";
  document.getElementById("lblSize1").innerHTML = "SMALL SQUARE";
  document.getElementById("lblSize2").innerHTML = "THUMBNAIL";
  document.getElementById("lblSize3").innerHTML = "SMALL";
  document.getElementById("lblSize5").innerHTML = "MEDIUM";
  document.getElementById("lblSize6").innerHTML = "LARGE";
  document.getElementById("lblOpenLarger").innerHTML = "\u0423\u0432\u0435\u043b\u0438\u0447\u0438\u0442\u044c \u043a\u0430\u0440\u0442\u0438\u043a\u0443 \u0441 LIGHTBOX, \u0438\u043b\u0438";
  document.getElementById("lblLinkToUrl").innerHTML = "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u0441\u0441\u044b\u043b\u043a\u0443:";
  document.getElementById("lblNewWindow").innerHTML = "\u041e\u0442\u043a\u0440\u044b\u0442\u044c \u0432 \u043d\u043e\u0432\u043e\u043c \u043e\u043a\u043d\u0435.";
  document.getElementById("btnCancel").value = "\u041e\u0442\u043c\u0435\u043d\u0430";
  document.getElementById("btnSearch").value = " \u041f\u043e\u0438\u0441\u043a ";
}
function writeTitle() {
  document.write("<title>" + "\u0412\u0441\u0442\u0430\u0432\u043a\u0430 \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f" + "</title>")
}
function getTxt(s) {
  switch(s) {
    case "insert":
      return"\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c";
    case "change":
      return"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c"
  }
}
;