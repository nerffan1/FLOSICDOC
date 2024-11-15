fetch('https://api.github.com/repos/yohyamamoto/NRLMOL_utility_codes/readme')
  .then(response => response.json())
  .then(data => {
    const readmeContent = data.content;
    // Display the README content on your page
    const readmeElement = document.getElementById('readme');
    readmeElement.innerHTML = markdownToHtml(readmeContent); // Convert markdown to HTML
  })
  .catch(error => console.error('Error fetching README:', error));
