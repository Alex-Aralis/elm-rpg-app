module Main exposing (..)

import Html exposing (..)
import Actions exposing (Action)
import Models exposing (Model)
import Update exposing (update)
import View exposing (view)
import Subscriptions exposing (subscriptions)

init : (Model, Cmd Action)
init = 
  ("Hello", Cmd.none)

main : Program Never Model Action
main = program 
  {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }