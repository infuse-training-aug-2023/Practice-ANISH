var clock = document.getElementById("clock")


function tick(){
    clock.innerText = new Date().toLocaleTimeString()
}

setInterval(tick, 1000);