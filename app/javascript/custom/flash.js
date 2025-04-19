console.log("flash.js読み込み成功")

document.addEventListener("turbo:load", () => {
  const toast = document.getElementById("toast");
  if(toast && toast.textContent.trim() !== ''){
    toast.classList.add("show");

    setTimeout(() =>{
      toast.classList.remove("show");
      toast.classList.add("hide");
    }, 3000);
  }

})