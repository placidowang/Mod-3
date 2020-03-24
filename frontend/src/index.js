

document.addEventListener('DOMContentLoaded', () => {
  const button = document.querySelector('button')
  
  fetch("http://localhost:3000/cars")
  .then(resp => resp.json())
  .then(data => console.log(data))



  button.addEventListener('click',()=>{
    fetch("http://localhost:3000/attachments",{
      method: "POST",
      headers:{
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
    
      })
  
    })
    .then(resp=>resp.json())
    // .then(resp=>resp.json())
    // .then(idk=>console.log(idk))
  })
  

})

