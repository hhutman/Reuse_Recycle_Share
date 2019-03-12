class Chat {
  constructor() {
    this.channel = null;
    this.client = null;
    this.identity = null;
    this.messages = ["Connecting..."];
    this.initialize();
  }

  initialize = _ => {
    this.renderMessages();
    Rails.ajax({
      url: "/tokens",
      type: "POST",
      success: ({ token, identity }) => {
        this.identity = identity;
        Twilio.Chat.Client.create(token).then(client =>
          this.setupClient(client)
        );
      }
    });
  };

  joinChannel = _ => {
    if (this.channel.state.status !== "joined")
      this.channel.join().then(channel => console.log(channel));
  };

  setupChannel = channel => {
    this.channel = channel;
    this.joinChannel();
    this.addMessage({ body: `Joined general channel as ${this.identity}` });
    this.channel.on("messageAdded", message => this.addMessage(message));
    this.setupForm();
  };

  setupForm = _ => {
    const form = document.querySelector(".chat form");
    const input = document.querySelector(".chat form input");
    form.addEventListener("submit", event => {
      event.preventDefault();
      this.channel.sendMessage(input.value);
      input.value = "";
      return false;
    });
  };

  setupClient = client => {
    this.client = client;
    this.client
      .getChannelByUniqueName("general")
      .then(channel => this.setupChannel(channel))
      .catch(_ => {
        this.client
          .createChannel({
            uniqueName: "general",
            friendlyName: "General Chat Channel"
          })
          .then(channel => this.setupChannel(channel));
      });
  };

  renderMessages = _ => {
    let messageContainer = document.querySelector(".chat .messages");
    messageContainer.innerHTML = this.messages
      .map(message => `<div class="message">${message}</div>`)
      .join("");
  };

  addMessage = message => {
    let html = "";
    if (message.author) {
      const className = message.author == this.identity ? "user me" : "user";
      html += `<span class="${className}">${message.author}: </span>`;
    }
    html += message.body;
    this.messages.push(html);
    this.renderMessages();
  };
}
