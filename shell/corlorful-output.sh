#!/bin/bash

function info_prompt()
{
  printf "\e[1;3;7;32m[--INFO--]\e[0m $* \n" 
}


function error_prompt()
{
  printf "\e[1;3;7;31m[--ERROR--]\e[0m $* \n"
}
