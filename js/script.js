const svgWidth = 500;
const svgHeight = 400;

const svg = d3
  .select("body")
  .append("svg")
  .attr("viewBox", `0 0 ${svgWidth} ${svgHeight}`)
  .attr("width", svgWidth)
  .attr("height", svgHeight);
