module Main exposing (..)

import Html exposing (..)
import Actions exposing (Action)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Subscriptions exposing (subscriptions)
import Commands exposing (fetchPlayers) 

init : (Model, Cmd Action)
init = 
  (initialModel, fetchPlayers)

main : Program Never Model Action
main = program 
  {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }