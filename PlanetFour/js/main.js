function setAuthors(authors) {
  var authorList = document.getElementById("author_list");
  const authorsWithSpace = authors.join(', ');
  authorList.innerText = authorsWithSpace;
}
