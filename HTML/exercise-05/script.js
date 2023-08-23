var movies = [];
var found = false;

// var BASE_URL = process.env.BASE_URL;

var textinput = document.getElementById("input");
var btn = document.getElementById("Search");
var cardCont = document.getElementsByClassName("cardCont")[0];
var paginationDiv = document.getElementById("paginationDiv");
var paginationP = document.getElementById("paginationP");
var prevBtn = document.getElementById("prevBtn");
var nextBtn = document.getElementById("nextBtn");
var sortOrderId = document.getElementById("sortOrderId");
var sortById = document.getElementById("sortbyId");
var ifram = document.getElementById("iframe");
var sortingDivCont = document.getElementsByClassName("sortingDivCont")[0];

sortingDivCont.style.display = "none";
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
    BASE_URL+"type=movie&s=" + textinput.value
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

            sortingDivCont.style.display = "flex";
            currettext = textinput.value;
            paginationP.innerText =
              page + " / " + Math.round(parseInt(r.totalResults) / 10);
          }
          while (cardCont.firstChild) {
            cardCont.removeChild(cardCont.firstChild);
          }
          ortCards();
        } else {
          alert(r.Error);
        }
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

function createCard(data, index) {
  let card_div = document.createElement("div");
  card_div.setAttribute("class", "card");
  // creating img div
  let imgcont = document.createElement("div");
  imgcont.setAttribute("class", "imgCont");
  let imgnode = document.createElement("img");
  imgnode.setAttribute("src", data.Poster);
  imgnode.setAttribute("alt", data.Title);
  imgcont.appendChild(imgnode);

  //creating title div
  let titlediv = document.createElement("div");
  titlediv.setAttribute("class", "desc");
  let titlep = document.createElement("p");
  titlep.innerText =
    "Title : " +
    (data.Title.length > 20 ? data.Title.slice(0, 20) + "..." : data.Title);
  titlediv.appendChild(titlep);

  //creating year div
  // let yeardiv = document.createElement("div")
  // yeardiv.setAttribute("class", "desc")
  let yearp = document.createElement("p");
  yearp.innerText =  data.Year;
  yearp.style.textAlign = "end"
  titlediv.appendChild(yearp);

  card_div.appendChild(imgcont);
  card_div.appendChild(titlediv);

  card_div.setAttribute("key", data.imdbID);

  card_div.onclick = () => {
    posterClick(data.imdbID);
  };
  cardCont.appendChild(card_div);
}

function getPage(pageNo) {
  // paginationDiv.style.display = "none";
  fetch(
    BASE_URL+"type=movie&s=" +
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
          ortCards();
        } else {
          alert(r.Error);
        }
      });
    })
    .catch((err) => {
      console.log(err);
    });
}

sortById.onchange = ortCards;
sortOrderId.onchange = ortCards;
function ortCards() {
  while (cardCont.firstChild) {
    cardCont.removeChild(cardCont.firstChild);
  }
  console.log(sortOrderId.value);
  console.log(sortById.value);

  switch (sortById.value) {
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

  movies.forEach((element, index) => {
    createCard(element, index);
  });
}

function posterClick(index) {
  console.log(index);

  ifram.contentWindow.postMessage(index, "*");
}
