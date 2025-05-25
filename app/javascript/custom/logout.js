document.addEventListener("turbo:load",function(){
  const dropdownBtn = document.getElementById("dropdownbtn");
  const dropdownMenu = document.getElementById("dropdownmenu");

  dropdownBtn.addEventListener("click",function(){
    dropdownMenu.classList.toggle("hidden");
  })

})