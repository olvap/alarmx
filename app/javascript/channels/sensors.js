import consumer from "./consumer"

consumer.subscriptions.create("SensorChannel", {
  received(data) {
    console.log('data:', data)
    const sensorId = data.sensor.id
    const sensorState = data.sensor.state

    const sensorRow = document.getElementById(`sensor-${sensorId}`)
    console.log("tr: ", sensorRow)
    if (sensorRow) {
      if(sensorState){
        sensorRow.classList.remove('resource__item--red');
        sensorRow.classList.add('resource__item--green');
      }else{
        sensorRow.classList.add('resource__item--red');
        sensorRow.classList.remove('resource__item--green');
      }
    }
  }
})
