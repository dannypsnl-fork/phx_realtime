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

// const recurringChannel = authSocket.channel("recurring");
// recurringChannel.join();
// recurringChannel.on("new_token", (payload) =>
//   console.log("received new auth token", payload)
// );

const dupeChannel = authSocket.channel("dupe");
dupeChannel.on("number", (payload) => console.log("new number", payload));
dupeChannel.join();

let statsSocket = new Socket("/stats_socket", {});
statsSocket.connect();

const statsChannelInvalid = statsSocket.channel("invalid");
statsChannelInvalid.join().receive("error", () => statsChannelInvalid.leave());

const statsChannelValid = statsSocket.channel("valid");
statsChannelValid.join();

for (let i=0; i<5; i++) {
  statsChannelValid.push("ping");
}

export default authSocket;
