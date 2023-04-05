// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import './add_jquery'
import "./components/WebSocket";
import "./channels/sensors";

document.addEventListener("DOMContentLoaded", loadMaterialize)
document.addEventListener('turbo:render', loadMaterialize)

function loadMaterialize(event) {
  M.AutoInit();

  $(function() {
    $('#state-button').on('click', function() {
      var sensorId = $(this).data('sensor-id');
      var newState = $(this).data('new-state');

      $.ajax({
        url: '/sensors/' + sensorId + '.json',
        type: 'PUT',
        data: { sensor: {state: newState } },
        success: function(data) {
          $('#state-button').data('newState', !data.state);
          $('#state-button').text((data.state ? 'Activo' : 'Inactivo'));
        },
        error: function() {
          alert('No se pudo cambiar el estado del sensor');
        }
      });

      return false;
    });
  });
}
