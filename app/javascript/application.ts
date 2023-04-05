// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./add_jquery";
import "./components/WebSocket";
import "./channels/sensors";

document.addEventListener("DOMContentLoaded", loadMaterialize);
document.addEventListener("turbo:render", loadMaterialize);

function changeState(sensorId, newState) {
  const csrfToken = document.getElementsByName("csrf-token")[0].content;

  $.ajax({
    url: "/sensors/" + sensorId + ".json",
    type: "PUT",
    headers: {
      "X-CSRF-Token": csrfToken
    },
    data: { sensor: { state: newState } },
    success: function (data) {
      $("#state-button").data("newState", !data.state);
      $("#state-button").text(data.state ? "Activo" : "Inactivo");

      var checkboxes = document.querySelectorAll(
        'input[type="checkbox"][data-sensor-id="' + sensorId + '"]'
      );
      checkboxes.forEach(function (checkbox) {
        checkbox.dataset.sensorState = data.state;
      });
    },
    error: function () {
      console.log("No se pudo cambiar el estado del sensor");
    },
  });
}

function loadMaterialize(event) {
  M.AutoInit();

  $(function () {
    $("#state-button").on("click", function () {
      var sensorId = $(this).data("sensor-id");
      var newState = $(this).data("new-state");

      changeState(sensorId, newState);

      return false;
    });
  });

  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  checkboxes.forEach(function (checkbox) {
    checkbox.addEventListener("click", function () {
      var sensorId = checkbox.dataset.sensorId;
      var newState = checkbox.dataset.sensorState === "true" ? false : true;

      changeState(sensorId, newState);
    });
  });
}
