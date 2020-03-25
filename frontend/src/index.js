document.addEventListener('DOMContentLoaded', () => {
  const button = document.querySelector('button')
  const attachBtn = document.getElementById('attach-attachment')
  const parent_div = document.getElementById('attachment-bar')
  fetch("http://localhost:3000/attachments")
  .then(resp => resp.json())
  .then(data => data.forEach(attachment =>{
    makeAttachmentCard(attachment)

  }))

  const makeAttachmentCard = (attachment)=>{
    const div = document.createElement('div')
    const h3 = document.createElement('h3')
    h3.className = "attachment-name"
    h3.innerText = attachment.name
    const img = document.createElement('img')
    img.className = "attachment-img"
    img.src = attachment.img_url
    div.append(h3,img)
    parent_div.append(div)
  }

  button.addEventListener('click',()=>{
    // debugger
    fetch("http://localhost:3000/attachments",{
      method: "POST",
      headers:{
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        
      })
    })
    .then(resp=>{
      // debugger
      return resp.json()
    })
    .then(idk=>console.log(idk))
    // .catch(() => {console.error('what happened')})
  })
  

  attachBtn.addEventListener('click', () => {
    fetch('http://localhost:3000/part_attachment_joiners', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        part_id: 2,
        attachment_id: 2
      })
    })
    .then(r => r.json())
    .then(pa_joiner => {
      if (pa_joiner.id) {
        console.log(pa_joiner)
      } else {
        console.error('part or attachment already has a pair')
      }
    })
  })

  
})