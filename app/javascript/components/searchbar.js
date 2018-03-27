function classUpdate() {
  const searchbar = document.querySelector(".searchbar");
  searchbar.classList.toggle("active");
}

function toggleClass() {
  const search = document.querySelector("#search-item");
  search.addEventListener("click", classUpdate);
}

export { toggleClass };
