var prevScrollpos = window.pageYOffset;
var navbar = document.getElementById("navbar")
window.onscroll = function () {
  if (navbar) {
    var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      navbar.style.top = "0";
    } else {
      navbar.style.top = "-15vh";
    }
  }
  prevScrollpos = currentScrollPos;
}

// const windowOnscroll = () => {
//   const currentScrollPos = window.pageYOffset;
//   if (navbar) {
//     if (prevScrollpos > currentScrollPos) {
//       navbar.style.top = "0";
//     } else {
//       navbar.style.top = "-12vh";
//     }
//   };
//   prevScrollpos = currentScrollPos;
// }

// export { windowOnscroll };
export { prevScrollpos };
