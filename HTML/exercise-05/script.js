var apikey="fd717b92"

var movies = []
var found = false

var textinput = document.getElementById("input")
var btn = document.getElementById("Search")
var cardCont = document.getElementsByClassName("cardCont")[0]
var paginationDiv = document.getElementById("paginationDiv");
var paginationP = document.getElementById("paginationP");
var prevBtn = document.getElementById("prevBtn")
var nextBtn = document.getElementById("nextBtn")
var sortOrderId = document.getElementById("sortOrderId")
var sortbyId = document.getElementById("sortbyId")

paginationDiv.style.display = "none";
var currettext = ""
var page = 1


prevBtn.onclick   = ()=>{
    if(page -1 > 0){
        page = page-1
        getPage(page)
    }
}


nextBtn.onclick   = ()=>{
    // if(page -1 > 0){
        page = page+1
        getPage(page)
    // }
}


btn.onclick = getData


function getData(){
    paginationDiv.style.display = "none";
    fetch("http://www.omdbapi.com/?apikey=fd717b92&type=movie&s="+textinput.value).then(res => {
        res.json().then(r => {
            if (r.Response === "True"){
                // console.log(r,);
                movies = r.Search
                console.log(r);
                found = true
                if (parseInt(r.totalResults) > 10){
                    paginationDiv.style.display = "flex";
                    currettext = textinput.value
                    paginationP.innerText = page + " / " + Math.round(parseInt(r.totalResults) /10)
                }
                while (cardCont.firstChild) {
                  cardCont.removeChild(cardCont.firstChild);
                }
                movies.forEach(element => {
                    createCard(element)
                });
            }
            else{
                alert(r.Error)
            }
        })
    })
        .catch(err => {
            console.log(err);
        })
}



function createCard(data){
    var ele = document.createElement("div")
    ele.setAttribute("class", "card")
    // creating img div
    var imgcont = document.createElement("div")
    imgcont.setAttribute("class", "imgCont")
    var imgnode = document.createElement("img")
    imgnode.setAttribute("src", data.Poster)
    imgnode.setAttribute("alt",data.Title)
    imgcont.appendChild(imgnode)

    //creating title div
    var titlediv = document.createElement("div")
    titlediv.setAttribute("class", "desc")
    var titlep = document.createElement("p")
    titlep.innerText = "Title : " + (data.Title.length > 20 ? data.Title.slice(0,20)+ "..." : data.Title)
    titlediv.appendChild(titlep)

    //creating year div
    // var yeardiv = document.createElement("div")
    // yeardiv.setAttribute("class", "desc")
    var yearp = document.createElement("p")
    yearp.innerText = "Year : " + data.Year
    titlediv.appendChild(yearp)

    ele.appendChild(imgcont)
    ele.appendChild(titlediv)
    // ele.appendChild(yeardiv)

    cardCont.appendChild(ele)
}


function getPage(pageNo){
    // paginationDiv.style.display = "none";
    fetch(
      "http://www.omdbapi.com/?apikey=fd717b92&type=movie&s=" +
        currettext +
        "&page="+pageNo
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
            movies.forEach((element) => {
              createCard(element);
            });
          } else {
            alert(r.Error);
          }
        });
      })
      .catch((err) => {
        console.log(err);
      });
}


function Sort(){
  movies.sort((a, b) => {
    return parseInt(a.year) - parseInt(b.year);
});
}
