// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import { Socket } from "phoenix";

let authSocket = new Socket("/auth_socket", {
  params: { token: window.userToken },
});

authSocket.onOpen(() => console.log("authSocket connected"));
authSocket.connect();

export default authSocket;
