console.log("aaaaabbbbcccc")
document.addEventListener("turbo:load",showToast);
document.addEventListener("DOMContentLoaded",showToast);
  
  function showToast(){
  const toast = document.getElementById("toast");
  if(toast && toast.textContent.trim() !== ''){
    toast.classList.add("show");

    setTimeout(() =>{
      toast.classList.remove("show");
      toast.classList.add("hide");
    }, 3000);
  }
}