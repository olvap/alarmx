// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./components/WebSocket";
import "./channels/sensors";

function loadMaterialize(event) { M.AutoInit();}
document.addEventListener("DOMContentLoaded", loadMaterialize)
document.addEventListener('turbo:render', loadMaterialize)

