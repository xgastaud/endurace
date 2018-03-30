function addToMyWishList() {
  document.addEventListener('DOMContentLoaded', () => {
    const maListButton = document.getElementById('ma-liste');
    if (maListButton) {
      maListButton.addEventListener('click', (e) => {
        if (e.target.id === 'ma-liste') {
          const formId = e.target.dataset.formId;
          document.getElementById(formId).submit();
        } else {
          const formId = e.target.parentElement.dataset.formId;
          document.getElementById(formId).submit();
        }
      });
    }
  });
}

export { addToMyWishList };
