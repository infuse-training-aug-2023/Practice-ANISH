var id = null
var apikey = "fd717b92";


var titleId = document.getElementById("titleId");
var showId = document.getElementById("showId")
var noshowId = document.getElementById("noshowId");
var runtimeId = document.getElementById("runtimeId");
var LanguageId = document.getElementById("LanguageId");
var RatingId = document.getElementById("RatingId");
var plotId = document.getElementById("plotId");
var imgId = document.getElementById("imgId")


showId.style.display = "none"



window.addEventListener("message",async  function (event) {
    try {
        console.log(event.data, "im data");
        id = event.data;
        if (event.data != null) {
          
          const req = await fetch(
            `http://www.omdbapi.com/?apikey=${apikey}&i=${event.data}&plot=full`
          );
          const data = await req.json();
          populateData(data)
          showId.style.display = "flex";
          noshowId.style.display = "none";
        }
    } catch (error) {
        this.alert("somthing went Wrong")
    }
});

/*{
    "Title": "Der Generalmanager oder How to Sell a Tit Wonder",
    "Year": "2006",
    "Rated": "N/A",
    "Released": "09 Dec 2006",
    "Runtime": "93 min",
    "Genre": "Documentary",
    "Director": "Steffen Jürgens, Rüdiger Heinze",
    "Writer": "N/A",
    "Actors": "Martin Baldauf, Lolo Ferrari, Jürgen Drews",
    "Plot": "Der Generalmanager oder How To Sell A Tit Wonder is the over-the-top story of overextended erotic manager Martin Baldauf. The former agent of top celebrity Lolo Ferrari is on an e-ride either to the gutter or to cult status. After the sudden death of world famous Lolo Ferrari, Martin Baldauf goes on a papparazzi-ridden, whirlwind promotion tour to push new English model Ashley Bond from Manchester as her successor. From tanning studio to the new Miss Silicon? \"B\" or \"C\" celebrity? A high speed movie full of coruscating humor and absurd situations from a promotion date on a Autobahn service area to the measurement of tits with a dog leash at a lawyer's.",
    "Language": "English, German",
    "Country": "Germany",
    "Awards": "N/A",
    "Poster": "https://m.media-amazon.com/images/M/MV5BZDg0ZTE4NjktNWZiYi00MWJmLWE0ODQtYmNkOWQzYzMzMmNlXkEyXkFqcGdeQXVyMTQ0MzMwNQ@@._V1_SX300.jpg",
    "Ratings": [
        {
            "Source": "Internet Movie Database",
            "Value": "6.1/10"
        }
    ],
    "Metascore": "N/A",
    "imdbRating": "6.1",
    "imdbVotes": "41",
    "imdbID": "tt0907741",
    "Type": "movie",
    "DVD": "N/A",
    "BoxOffice": "N/A",
    "Production": "N/A",
    "Website": "N/A",
    "Response": "True"
}*/

function populateData(data){
    console.log(data,"im data");

    titleId.innerText = data.Title
    runtimeId.innerText = data.Runtime;
    var languages = data.Language.split(", ");
    while (LanguageId.firstChild) {
      LanguageId.removeChild(LanguageId.firstChild);
    }
    while (RatingId.firstChild) {
      RatingId.removeChild(RatingId.firstChild);
    }
    languages.forEach(element => {
        var p = document.createElement("p");
        p.innerText = element;
        p.className = "pill";
        LanguageId.appendChild(p);
    });

    plotId.innerText = data.Plot;
    imgId.setAttribute("src",data.Poster)

    data.Ratings.forEach(ele=>{
         var p = document.createElement("p");
         p.innerText = ele.Source + "  " + ele.Value;
         p.className = "pill"
         RatingId.appendChild(p);
    })

}




