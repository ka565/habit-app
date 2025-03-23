



console.log("Chart.js is loaded:", window.Chart);

document.addEventListener("turbo:load", drawChart);
document.addEventListener("turbo:render", drawChart);

  
  function drawChart(){
  const graphelement = document.getElementById("habit-graph");
  if(!graphelement) 
  { console.warn("no progress data found");
    return;
  }

  const progressdata = JSON.parse(graphelement.dataset.progress);
  console.log("graph data:",progressdata);
  const labels = progressdata.map((record) => record.date);
  const values = progressdata.map((record) => record.value);

  console.log("graph labels:", labels);
  console.log("graph values:", values);

const canvas = document.getElementById("progress-graph");
if(!canvas){
  console.warn("progress-graph canvas not found");
  return;
}


  const ctx = canvas.getContext("2d");
  new Chart(ctx, {
    type: "line",
    data: {
      labels: labels,
      datasets: [{
        label: "進捗",
        data: values,
        borderColor: "blue",
        borderWidth: 2,
        fill: false
      }]

    }
  });

};