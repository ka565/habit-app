# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "custom/habit_search", to: "custom/habit_search.js"
pin "custom/habit_sort", to: "custom/habit_sort.js"
pin "custom/habit_delete", to: "custom/habit_delete.js"
pin "custom/habit_graph", to: "custom/habit_graph.js"

pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"

