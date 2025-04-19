document.addEventListener("turbo:load", ()=> {
  const recordbtn = document.getElementById("actualvalue-btn");
  const record = document.getElementById("actualvalue-record");
  record.style.display = "none";

  recordbtn.addEventListener("click",()=> {
    if(record.style.display === "none"){
      record.style.display = "block";
      recordbtn.textContent = "履歴を非表示";
    }
    else{
      record.style.display ="none";
      recordbtn.textContent = "履歴を表示";
    }
    
  });
});