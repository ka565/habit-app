document.addEventListener("turbo:load", function(){
const editBtn = document.getElementById("edit-mode-btn");
const cancelBtn = document.getElementById("cancel-edit-btn");
const deleteBtn = document.getElementById("delete-selected-btn");
const checkboxes = document.querySelectorAll(".habit-checkbox");
if(!editBtn) return;

editBtn.addEventListener("click", function(){
  checkboxes.forEach((cb) => cb.classList.remove("hidden"));
  editBtn.classList.add("hidden");
  cancelBtn.classList.remove("hidden");
  deleteBtn.classList.remove("hidden");

});

cancelBtn.addEventListener("click",function(){
  checkboxes.forEach((cb) => {
    cb.classList.add("hidden");
    cb.checked = false;

  });
  editBtn.classList.remove("hidden");
  cancelBtn.classList.add("hidden");
  deleteBtn.classList.add("hidden");

});

deleteBtn.addEventListener("click", async function(){
  const selectedIds = Array.from(checkboxes)
  .filter(cb => cb.checked)
  .map(cb => Number(cb.dataset.id));

  if(selectedIds.length === 0){
    alert("削除する習慣を選択してください");
    return;
  }

  if(!confirm(`${selectedIds.length}件の習慣を削除`)) return;
  const csrfToken = document.querySelector("meta[name='csrf-token']")?.content;

  const response = await fetch("/habits/destroy_multiple", {
    method: "DELETE",
    headers: {"Content-Type": "application/json",
      "X-CSRF-Token": csrfToken
    },
    body: JSON.stringify({habit_ids: selectedIds})
  });
  
  
    if(response.ok){
      selectedIds.forEach(id => {
        document.querySelector(`.each-habit[data-id='${id}']`).remove();
      });
      cancelBtn.click();
    } else{
      alert("削除に失敗しました");
    }
  });
});


