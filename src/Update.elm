module Update exposing (update)

import Models exposing (Model)
import Actions exposing (Action(..))
import Routing exposing (parseLocation)

update : Action -> Model -> (Model, Cmd Action)
update action model = 
  case action of 
    NoOp -> 
      (model, Cmd.none)

    OnFetchPlayers resp -> 
      ({ model | players = resp }, Cmd.none)

    OnLocationChange loc -> 
      ({ model | route = parseLocation loc }, Cmd.none)
