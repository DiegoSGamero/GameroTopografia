window.onload = function() {
  const buttons = document.querySelectorAll(".knowledge-topics .btn");
  const sections = document.querySelectorAll(".knowledge-texts > div");

  buttons.forEach(function(button, index) {
    button.addEventListener("click", function() {
      sections[index].scrollIntoView({ behavior: "smooth" });
    });
  });
};
