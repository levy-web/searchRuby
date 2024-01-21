import consumer from "channels/consumer"

consumer.subscriptions.create("SearchChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to SearchChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from SearchChannel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data:", data);

    // Example: Update the UI with the received data
    const searchList = document.getElementById("search-list");
    const listItem = document.createElement("li");
    listItem.textContent = `${data.query} - ${data.user_ip}`;
    searchList.appendChild(listItem);

  }
});
