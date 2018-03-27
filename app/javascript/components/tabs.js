// foreach
// AddEvenbt listener
// recuperer data target dataset mdn
// get element by id du contenu de data-target
// rajouter class active -> ds scss class list.add
// active = display block
// other display: none
function changeTabs() {
  const tabs = document.querySelectorAll(".tabs a");
  const tabsContainer = document.querySelectorAll(".topo-show");
  tabs.forEach((tab) => {
    tab.addEventListener("click", (event) => {
      tabs.forEach((tabContainer) => {
        tabContainer.classList.remove("active");
      });
      tab.classList.toggle("active");
      tabsContainer.forEach((tabContainer) => {
        tabContainer.classList.remove("active");
      });
      document.getElementById(tab.dataset.target).classList.toggle("active");
    });
  });
}

export {changeTabs};
