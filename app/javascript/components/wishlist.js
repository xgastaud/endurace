function addToMyWishList() {
  const maListButton = document.getElementById('ma-liste');
  if (maListButton) {
    maListButton.addEventListener('click', (e) => {
      const formId = e.target.dataset.formId;
      document.getElementById(formId).submit();
    });
  }
}

export { addToMyWishList };
