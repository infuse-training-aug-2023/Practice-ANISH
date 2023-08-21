var clock = document.getElementById("clock")
var toggle  = false

function tick(){
    clock.innerText = new Date().toLocaleTimeString()
}



var toggleBtn = document.getElementById("Toogle")
var container = document.getElementsByClassName("container")[0]
setInterval(tick, 1000);

toggleBtn.onclick = ()=>{
    if(toggle){
        container.className = container.className +" dark"
        
    }
    else{
        container.className = container.classList[0]
    }
    toggle = !toggle
}