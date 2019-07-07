#! /bin/bash -e

# alias
alias e="vim"
alias ss="sudo systemctl"
alias stop="sudo systemctl stop"
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias restart="sudo systemctl restart"

# install sdkman and java scala sbt kotlin groovy gradle maven in subshell
curl -s "https://get.sdkman.io" | bash

(
  sdk install java
  sdk install scala
  sdk install kotlin
  sdk install groovy
  sdk instann gradle
  sdk instann maven
  sdk instann sbt
)

