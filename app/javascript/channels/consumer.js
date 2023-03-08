// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

export default createConsumer()

createConsumer(getWebSocketURL)

function getWebSocketURL() {
  return "ws://194.195.222.217:8000/cable"
}
