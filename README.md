# PhxRealtime

```
npm i -g wscat
mix phx.server
# another terminal
wscat -c 'ws://localhost:4000/socket/websocket?vsn=2.0.0'
> ["1", "1", "ping", "phx_join", {}]
< ["1","1","ping","phx_reply",{"response":{},"status":"ok"}]
> ["1", "1", "ping", "ping", {}]
< ["1","1","ping","phx_reply",{"response":{"ping":"pong"},"status":"ok"}]
> ["1", "1", "ping", "ping", {"ack": "hi!"}]
< ["1","1","ping","phx_reply",{"response":{"ping":"hi!"},"status":"ok"}]
```
