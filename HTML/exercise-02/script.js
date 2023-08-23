var clock = document.getElementById("clock")
var toggle  = false

function tick(){
    clock.innerText = new Date().toLocaleTimeString()
}



var toogle_btn_id = document.getElementById("Toogle");

setInterval(tick, 1000);

toogle_btn_id.onclick = ()=>{
    let container_div = document.getElementsByClassName("container")[0];
    // if(toggle){
    //     container.className = container.className +" dark"
        
    // }
    // else{
    //     container.className = container.classList[0]
    // }
    // toggle = !toggle

    container_div.classList.toggle("dark");
}