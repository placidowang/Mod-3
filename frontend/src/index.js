document.addEventListener('DOMContentLoaded', () => {
  // const h1 = document.querySelector('h1')

  // h1.innerText = '??'

  fetch("http://localhost:3000/attachments")
  .then(resp => resp.json())
  .then(data => console.log(data))

})