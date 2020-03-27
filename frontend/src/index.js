document.addEventListener('DOMContentLoaded', () => {
  const button = document.querySelector('button')
  const attachBtn = document.getElementById('attach-attachment')
  const parent_div = document.getElementById('attachment-bar')
  const car_container_div = document.querySelector('.car-container')
  const form = document.getElementById('add-car')

  fetch("http://localhost:3000/attachments")
  .then(resp => resp.json())
  .then(data => data.forEach(attachment =>{
    makeAttachmentCard(attachment)

  }))

  const makeAttachmentCard = (attachment)=>{
    
    const div = document.createElement('div')
    div.className = "attachment"
    div.setAttribute('data-attachment-id', attachment.id)
    const h3 = document.createElement('h3')
    h3.className = "attachment-name"
    h3.innerText = attachment.name
    const img = document.createElement('img')
    img.className = "attachment-img"
    img.src = attachment.img_url
    div.append(h3,img)
    parent_div.append(div)
  }

  fetch("http://localhost:3000/cars")
  .then(resp => resp.json())
  .then(car_data => {
    car_data["cars"].forEach(car=>{
    makeCarCard(car)
    
  })})
  const makeCarCard = (car) =>{
    
    const div_car = document.createElement('div')
    div_car.className = "car-card"
    div_car.setAttribute("data-car-id", car.id)
    const div = document.createElement('div')
    const li_car_make = document.createElement('li')
    const li_car_model = document.createElement('li')
    const li_car_year = document.createElement('li')
    const p_car_weight = document.createElement('p')
    const img = document.createElement('img')
    const specs_container = document.createElement('div')
    specs_container.className = 'specs-container'
    div.className="mmy"
    li_car_make.className = "car-make"
    li_car_make.innerText = car.make
    li_car_model.className = "car-model"
    li_car_model.innerText = car.model
    li_car_year.className = "car-year"
    li_car_year.innerText = car.year
    p_car_weight.className = "car-weight"
    p_car_weight.innerText = car.weight
    img.src = car.img_url
    img.className = 'car-image'

    const part_container_div = document.createElement('div')
    part_container_div.className = "part-container"
    fetch("http://localhost:3000/parts")
      .then(resp => resp.json())
      .then(parts_data => {
        const car_parts = parts_data.filter(part=>{
          return part.car_id === car.id
        })
      car_parts.forEach(part=>{
        makePartCard(part,part_container_div)
      })
    })

    specs_container.append(div, p_car_weight)
    div.append(li_car_year, li_car_make, li_car_model)
    div_car.append(img, specs_container, part_container_div)
    car_container_div.append(div_car)
    
  }
  const makePartCard = (part, part_container_div) =>{
    const div_part = document.createElement('div')
    div_part.className = "part-card"
    div_part.setAttribute("data-part-id", part.id)
    div_part.addEventListener('click', ()=>{
      console.log("SELECT ATTACHMENT")
      const div_id = document.querySelectorAll('.attachment')
      div_id.forEach(attachment => {
        attachment.addEventListener('click', ()=>{
          const attach_id = attachment.dataset.attachmentId
          fetch('http://localhost:3000/part_attachment_joiners',{
            method: "POST",
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify({
              part_id: part.id,
              attachment_id: parseInt(attach_id)
            })
          })
          .then(resp=> resp.json())
          .then(pa_joiner=>{
            if (pa_joiner.id) {
              console.log(pa_joiner)
            } else {
              console.error('part or attachment already has a pair')
            }
          })
        })
      })
    })

    const div = document.createElement('div')
    const h3_part_name = document.createElement('h3')
    h3_part_name.innerText = part.name
    h3_part_name.className = 'part-name'
    const img = document.createElement('img')
    img.className = 'part-image'
    img.src = part.img_url
    div.append(h3_part_name, img)
    div_part.append(div)
    part_container_div.append(div_part)
  }



  button.addEventListener('click',()=>{
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
  

 

  form.addEventListener('submit',()=>{
    event.preventDefault()
    fetch("http://localhost:3000/cars",{
      method: "POST",
      headers:{
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        model: form[0].value
      })
    })
    .then(resp => resp.json())
    .then(car =>console.log(car))
  })

  
})