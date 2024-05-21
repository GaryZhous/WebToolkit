# This Repo include a few wrappers I made to ensure a smoother web app development & hosting process (For Unix/Linux Environment)

### Serveo.sh
Serveo is an SSH server just for remote port forwarding, which doesn't require an account or client software. Servo.sh is a wrapper that allows users to expose their application to the public easily through servo.net
```
  #usage
  ./Serveo.sh <local_port> [remote_port]
  #or
  ./Serveo.sh <local_port>
  #if you wish to change the subdomain, do
  ./Serveo.sh <local_port> [remote_port] change
```
