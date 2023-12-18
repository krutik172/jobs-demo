import React from "react"
import ReactDOM  from "react-dom"
import jquery from "jquery"

// const root = ReactDOM.createRoot(document.getElementById("jsdemo"));
// const element = "Hello world";
// root.render(element);
// const Hello = props => (
//     React.createElement('p', null, `Hello ${props.name}`)
//   )
// document.addEventListener('DOMContentLoaded', () => {
//     ReactDOM.render(
//       React.createElement(Hello, {name: 'Rails'}, null),
//       document.getElementById('jsdemo'),
//     )
//   })
let demo = React.createElement(
    "h1", { style: { color: "green" } }, "Welcome to GeeksforGeeks"
)
ReactDOM.render(
    demo,
    document.getElementById('jsdemo')
);

console.log(`${16**2} Hello world`)
window.jQuery = jquery;
window.$ = jquery;

$(document).ready(function () {
    $("#jsdemo2").text("Hello, World! from jquery");
});
  