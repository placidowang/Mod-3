document.addEventListener('DOMContentLoaded', () => {
  // const attachBtn = document.getElementById('attach-attachment')
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

    const dltBtn = document.createElement('button')
    dltBtn.innerText = "DELETE ATTACHMENT"
    dltBtn.className = 'delete-attachment-btn'
    dltBtn.addEventListener('click', () => {
      fetch(`http://localhost:3000/attachments/${attachment.id}`, {
        method: 'DELETE'
      })
      .then(div.parentNode.removeChild(div))
    })

    div.append(h3,img, dltBtn)
    parent_div.append(div)
  }

  fetch("http://localhost:3000/cars")
  .then(resp => resp.json())
  .then(car_data => {
    // car_data["cars"].forEach(car=>{
    // makeCarCard(car, car_data["specs"])
    // })
    
    // refactor this garbage
    let i = 0
    while (i < car_data["cars"].length) {
      makeCarCard(car_data["cars"][i], car_data['specs'][`car${i}`])
      // console.log(car_data['specs'][`car${i}`])

      i++
    }
  })

  const makeCarCard = (car, specs = undefined) =>{
    // debugger
    const div_car = document.createElement('div')
    div_car.className = "car-card"
    div_car.setAttribute("data-car-id", car.id)
    const mmy_p = document.createElement('div')
    const li_car_make = document.createElement('li')
    const li_car_model = document.createElement('li')
    const li_car_year = document.createElement('li')
    const img = document.createElement('img')
    const p_specs_weight = document.createElement('p')
    const p_specs_top_speed = document.createElement('p')
    const p_specs_acceleration = document.createElement('p')
    const p_specs_handling = document.createElement('p')
    const specs_container = document.createElement('div')
    const bar_stats_container = document.createElement('div')
    
    mmy_p.className = "mmy"
    specs_container.className = 'specs-container'
    bar_stats_container.className = 'bar-stats-container'
    li_car_make.className = "car-make"
    li_car_make.innerText = car.make
    li_car_model.className = "car-model"
    li_car_model.innerText = car.model
    li_car_year.className = "car-year"
    li_car_year.innerText = car.year
    p_specs_weight.className = "car-weight"

    if (specs) {
      p_specs_weight.innerText = `WEIGHT: ${specs['final_weight']}`
      p_specs_top_speed.innerText = `TOP SPEED: ${specs['final_top_speed']}`
      p_specs_acceleration.innerText = `ACCELERATION: ${specs['final_acceleration']}`
      p_specs_handling.innerText = `HANDLING: ${specs['final_handling']}`
    } else {
      p_specs_weight.innerText = `WEIGHT: ${car.weight}`
      p_specs_top_speed.innerText = `TOP SPEED: ${car.base_top_speed}`
      p_specs_acceleration.innerText = `ACCELERATION: ${car.base_acceleration}`
      p_specs_handling.innerText = `HANDLING: ${car.base_handling}`
    }

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
      car_parts.forEach(part => {
        makePartCard(part, part_container_div, p_specs_weight, p_specs_top_speed, p_specs_acceleration, p_specs_handling)
      })
    })

    let dltBtn = document.createElement('button')
    // dltBtn.innerText = "DELETE CAR"
    // dltBtn.className = "delete-car-btn"
    Object.assign(dltBtn, {innerText: 'DELETE CAR', className: 'delete-car-btn'})
    dltBtn.addEventListener('click', () => {
      fetch(`http://localhost:3000/cars/${car.id}`, {
        method: 'DELETE'
      })
      .then(div_car.parentNode.removeChild(div_car))
    })

    mmy_p.innerHTML = `${car.year} ${car.make} ${car.model}`
    bar_stats_container.append(p_specs_top_speed, p_specs_acceleration, p_specs_handling)
    specs_container.append(mmy_p, p_specs_weight, bar_stats_container)
    div_car.append(dltBtn, img, specs_container, part_container_div)
    car_container_div.append(div_car)
  }

  const makePartCard = (part, part_container_div, p_specs_weight, p_specs_top_speed, p_specs_acceleration, p_specs_handling) =>{
    const div_part = document.createElement('div')
    div_part.className = "part-card"
    div_part.setAttribute("data-part-id", part.id)
    div_part.addEventListener('click', function clickOnPart(){
      console.log("SELECT ATTACHMENT")
      const div_id = document.querySelectorAll('.attachment')

      div_id.forEach(attachment => {
        attachment.addEventListener('click', function clickOnAttachment(){
          console.log('ATTACHMENT CLICKED')
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
              fetch(`http://localhost:3000/cars/${part.car_id}/specs`)
              .then(r => r.json())
              .then(specs => {
                p_specs_weight.innerText = `WEIGHT: ${specs['final_weight']}`
                p_specs_top_speed.innerText = `TOP SPEED: ${specs['final_top_speed']}`
                p_specs_acceleration.innerText = `ACCELERATION: ${specs['final_acceleration']}`
                p_specs_handling.innerText = `HANDLING: ${specs['final_handling']}`
              })
              attachment.removeEventListener('click', clickOnAttachment)
            } else {
              console.error('part or attachment already has a pair')
            }
          })
        })
      })
      div_part.removeEventListener('click', clickOnPart)
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

  const createAttachmentBtn = document.createElement('button')
  Object.assign(createAttachmentBtn, {innerText: 'CREATE ATTACHMENT', className: 'create-attachment-btn'})
  document.querySelector('#attachment-bar').append(createAttachmentBtn)
  createAttachmentBtn.addEventListener('click',()=>{
    fetch("http://localhost:3000/attachments",{
      method: "POST",
      headers:{
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        
      })
    })
    .then(resp=>resp.json())
    .then(attachment => makeAttachmentCard(attachment))
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
    .then(car => {
      fetch("http://localhost:3000/parts",{
        method: "POST",
        headers:{
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          car_id: car.id
        })
      }) 
      .then(resp => resp.json())
      .then(()=>{makeCarCard(car)})
    })
  })
 
})