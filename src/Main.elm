module Main exposing (..)

import Actions exposing (Action)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Subscriptions exposing (subscriptions)
import Commands exposing (fetchPlayers) 
import Routing
import Navigation exposing (Location)

init : Location -> (Model, Cmd Action)
init location = 
  let 
    currentRoute = 
      Routing.parseLocation location
  in 
    (initialModel currentRoute, fetchPlayers)


main : Program Never Model Action
main = Navigation.program Actions.OnLocationChange
  {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }