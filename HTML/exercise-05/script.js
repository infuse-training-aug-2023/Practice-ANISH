var apikey="fd717b92"

var movies = []
var found = false

var textinput = document.getElementById("input")
var btn = document.getElementById("Search")
var cardCont = document.getElementsByClassName("cardCont")[0]




btn.onclick = getData

function getData(){
    fetch("http://www.omdbapi.com/?apikey=fd717b92&type=movie&s="+textinput.value).then(res => {
        res.json().then(r => {
            if (r.Response === "True"){
                movies = r.Search
                console.log(r);
                found = true
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
    imgcont.appendChild(imgnode)

    //creating title div
    var titlediv = document.createElement("div")
    titlediv.setAttribute("class", "desc")
    var titlep = document.createElement("p")
    titlep.innerText = "Title : " + data.Title
    titlediv.appendChild(titlep)

    //creating year div
    var yeardiv = document.createElement("div")
    yeardiv.setAttribute("class", "desc")
    var yearp = document.createElement("p")
    yearp.innerText = "Year Of Release : " + data.Year
    yeardiv.appendChild(yearp)

    ele.appendChild(imgcont)
    ele.appendChild(titlediv)
    ele.appendChild(yeardiv)

    cardCont.appendChild(ele)
}

