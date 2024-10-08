// const controls = document.querySelectorAll('.control')

// let currentItem = 0;

// const items = document.querySelectorAll('.item');

// const maxItems = items.length;

// controls.forEach(control => {
//   control.addEventListener('click', () => {
//     const isLeft = control.classList.contains('arrow-left');

//     if (isLeft) {
//       currentItem -= 1;
//     } else {
//       currentItem += 1;
//     }

//     if (currentItem >= maxItems) {
//       currentItem = 0;
//     }

//     if (currentItem < 0) {
//       currentItem = maxItems - 1;
//     }

//     // console.log("control", isLeft, currentItem);

//     // items.forEach(item => {
//       items[currentItem].scrollIntoView({
//         // inline: "center",
//         block: "center",
//         behavior: "smooth",
//       });
//     // });
//   })
// });
document.addEventListener('turbo:load', () => {
  const controls = document.querySelectorAll('.control');
  let currentItem = 0; // Reset currentItem on each load

  const items = document.querySelectorAll('.item');
  const maxItems = items.length;

  controls.forEach(control => {
    control.addEventListener('click', () => {
      const isLeft = control.classList.contains('arrow-left');

      if (isLeft) {
        currentItem -= 1;
      } else {
        currentItem += 1;
      }

      if (currentItem >= maxItems) {
        currentItem = 0;
      }

      if (currentItem < 0) {
        currentItem = maxItems - 1;
      }

      // console.log("control", isLeft, currentItem);

      items[currentItem].scrollIntoView({
        block: "center",
        behavior: "smooth",
      });
    });
  });
});
