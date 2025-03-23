console.log("再確認");

document.addEventListener("turbo:load", function () {
  console.log("検索機能が実行されました");
  const searchInput = document.getElementById("habit-searchid");
  console.log(searchInput);
  const habits = document.querySelectorAll(".each-habit");

  if (!searchInput || habits.length === 0) {
    console.log("検索ボックスまたは習慣リストが見つかりません");
    return;
  }

  searchInput.addEventListener("input", function () {
    console.log("入力イベントが発火", searchInput.value);
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

