var apikey = "fd717b92";

var movies = [];
var found = false;

var textinput = document.getElementById("input");
var btn = document.getElementById("Search");
var cardCont = document.getElementsByClassName("cardCont")[0];
var paginationDiv = document.getElementById("paginationDiv");
var paginationP = document.getElementById("paginationP");
var prevBtn = document.getElementById("prevBtn");
var nextBtn = document.getElementById("nextBtn");
var sortOrderId = document.getElementById("sortOrderId");
var sortbyId = document.getElementById("sortbyId");
var ifram = document.getElementById("iframe");

paginationDiv.style.display = "none";
var currettext = "";
var page = 1;

prevBtn.onclick = () => {
  if (page - 1 > 0) {
    page = page - 1;
    getPage(page);
  }
};

nextBtn.onclick = () => {
  // if(page -1 > 0){
  page = page + 1;
  getPage(page);
  // }
};

btn.onclick = getData;

function getData() {
  paginationDiv.style.display = "none";
  fetch(
    "http://www.omdbapi.com/?apikey=fd717b92&type=movie&s=" + textinput.value
  )
    .then((res) => {
      res.json().then((r) => {
        if (r.Response === "True") {
          // console.log(r,);
          movies = r.Search;
          console.log(r);
          found = true;
          if (parseInt(r.totalResults) > 10) {
            paginationDiv.style.display = "flex";
            currettext = textinput.value;
            paginationP.innerText =
              page + " / " + Math.round(parseInt(r.totalResults) / 10);
          }
          while (cardCont.firstChild) {
            cardCont.removeChild(cardCont.firstChild);
          }
          Sort()
        } else {
          alert(r.Error);
        }
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

function createCard(data,index) {
  var ele = document.createElement("div");
  ele.setAttribute("class", "card");
  // creating img div
  var imgcont = document.createElement("div");
  imgcont.setAttribute("class", "imgCont");
  var imgnode = document.createElement("img");
  imgnode.setAttribute("src", data.Poster);
  imgnode.setAttribute("alt", data.Title);
  imgcont.appendChild(imgnode);

  //creating title div
  var titlediv = document.createElement("div");
  titlediv.setAttribute("class", "desc");
  var titlep = document.createElement("p");
  titlep.innerText =
    "Title : " +
    (data.Title.length > 20 ? data.Title.slice(0, 20) + "..." : data.Title);
  titlediv.appendChild(titlep);

  //creating year div
  // var yeardiv = document.createElement("div")
  // yeardiv.setAttribute("class", "desc")
  var yearp = document.createElement("p");
  yearp.innerText = "Year : " + data.Year;
  titlediv.appendChild(yearp);

  ele.appendChild(imgcont);
  ele.appendChild(titlediv);

  ele.setAttribute("key", data.imdbID);

  ele.onclick = ()=>{
    posterClick(data.imdbID);
  }
  cardCont.appendChild(ele);
}

function getPage(pageNo) {
  // paginationDiv.style.display = "none";
  fetch(
    "http://www.omdbapi.com/?apikey=fd717b92&type=movie&s=" +
      currettext +
      "&page=" +
      pageNo
  )
    .then((res) => {
      res.json().then((r) => {
        if (r.Response === "True") {
          // console.log(r,);
          movies = r.Search;
          console.log(r);
          found = true;
          if (parseInt(r.totalResults) > 10) {
            //   paginationDiv.style.display = "flex";
            currettext = textinput.value;
            paginationP.innerText =
              page + " / " + Math.round(parseInt(r.totalResults) / 10);
          }
          while (cardCont.firstChild) {
            cardCont.removeChild(cardCont.firstChild);
          }
          Sort()
        } else {
          alert(r.Error);
        }
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

sortbyId.onchange = Sort;
sortOrderId.onchange = Sort;
function Sort() {
  while (cardCont.firstChild) {
    cardCont.removeChild(cardCont.firstChild);
  }
  console.log(sortOrderId.value);
  console.log(sortbyId.value);

  switch (sortbyId.value) {
    case "Name":
      switch (sortOrderId.value) {
        case "Ascending":
          movies.sort((a, b) => {
            let fa = a.Title.toLowerCase(),
              fb = b.Title.toLowerCase();

            if (fa < fb) {
              return -1;
            }
            if (fa > fb) {
              return 1;
            }
            return 0;
          });
          console.log("name asce");
          break;

        default:
          movies.sort((a, b) => {
            let fa = a.Title.toLowerCase(),
              fb = b.Title.toLowerCase();

            if (fa < fb) {
              return 1;
            }
            if (fa > fb) {
              return -1;
            }
            return 0;
          });
          console.log("name dsce");

          break;
      }
      break;

    default:
      switch (sortOrderId.value) {
        case "Ascending":
          movies.sort((a, b) => {
            return parseInt(a.Year) - parseInt(b.Year);
          });
          break;

        default:
          movies.sort((a, b) => {
            return parseInt(b.Year) - parseInt(a.Year);
          });
          break;
      }
      break;
  }

  movies.forEach((element,index) => {
    createCard(element,index);
  });
}


function posterClick (index)  {
  console.log(index);

  ifram.contentWindow.postMessage(index,"*")
}