function checkPath() {
  const path = "/#/about/authors";
  const location = window.location.href;
  const redirectUrl = "https://www.zooniverse.org/projects/sassydumbledore/chimp-and-see/about/team";

  if (location.indexOf(path) >= 0) {
    window.location.replace(redirectUrl);
  }
}
