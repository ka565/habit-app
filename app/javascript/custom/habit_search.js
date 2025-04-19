document.addEventListener("turbo:load", function () {
  const searchInput = document.getElementById("habit-searchid");
  console.log(searchInput);
  const habits = document.querySelectorAll(".each-habit");

  if (!searchInput || habits.length === 0) {
    return;
  }

  searchInput.addEventListener("input", function () {
    const query = searchInput.value.toLowerCase();

    habits.forEach((habit) => {
      const habitTitle = habit.querySelector(".habit-title").textContent.toLowerCase();
      if (habitTitle.includes(query)) {
        habit.style.display = "flex";
      } else {
        habit.style.display = "none";
      }
    });
  });
});

