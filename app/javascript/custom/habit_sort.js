document.addEventListener("turbo:load",function(){
  const habitsort = document.getElementById("habit-sort");
  const habitlists = document.querySelector(".habit-lists");
  if(!habitsort || !habitlists) return;
  
  habitsort.addEventListener("change", function(){
    const habits = Array.from(habitlists.children);
    const sortby = habitsort.value;

    habits.sort((a, b) => {
     

      if(sortby === "newest"){
        return Number(b.dataset.id) - Number(a.dataset.id);
      }
      else if(sortby === "oldest"){
        return Number(a.dataset.id) - Number(b.dataset.id);
      }
    });
    habitlists.innerHTML = "";
    habits.forEach((habit) => habitlists.appendChild(habit));

  });

});