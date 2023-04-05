import consumer from "./consumer"

consumer.subscriptions.create("SensorChannel", {
  received(data) {
    console.log('data:', data)
    const sensorId = data.sensor.id
    const sensorState = data.sensor.state

    const sensorRow = document.getElementById(`sensor-${sensorId}`)
    const navbar = document.getElementById(`nav-sensors-${sensorId}`)

    if(navbar){
      if(sensorState){
        navbar.classList.remove('blue');
        navbar.classList.remove('red');
        navbar.classList.add('teal');
      }else{
        navbar.classList.remove('blue');
        navbar.classList.add('red');
        navbar.classList.remove('teal');
      }
    }
    console.log("tr: ", sensorRow)
    if (sensorRow) {
      if(sensorState){
        sensorRow.classList.remove('red');
        sensorRow.classList.add('teal');
      }else{
        sensorRow.classList.add('red');
        sensorRow.classList.remove('teal');
      }
    }
  }
})
