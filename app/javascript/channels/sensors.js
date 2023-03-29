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
        sensorRow.classList.remove('red');
        sensorRow.classList.add('teal');
      }else{
        sensorRow.classList.add('red');
        sensorRow.classList.remove('teal');
      }
    }
  }
})
