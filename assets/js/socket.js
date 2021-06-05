// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import { Socket } from "phoenix";

let authSocket = new Socket("/auth_socket", {
  params: { token: window.authToken },
});

authSocket.onOpen(() => console.log("authSocket connected"));
authSocket.connect();

const recurringChannel = authSocket.channel("recurring");

recurringChannel
  .join()
  .receive("ok", (resp) => {
    console.log("Joined successfully", resp);
  })
  .receive("error", (resp) => {
    console.log("Unable to join", resp);
  });
recurringChannel.on("new_token", (payload) =>
  console.log("received new auth token", payload)
);

export default authSocket;
