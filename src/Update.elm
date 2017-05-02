module Update exposing (update)

import Models exposing (Model, Player)
import Actions exposing (Action(..))
import Routing exposing (parseLocation)
import Commands exposing (fetchPlayers, savePlayer)
import RemoteData

update : Action -> Model -> (Model, Cmd Action)
update action model = 
  case action of 
    NoOp -> 
      (model, Cmd.none)

    OnFetchPlayers resp -> 
      ({ model | players = resp }, Cmd.none)

    OnLocationChange loc -> 
      ({ model | route = parseLocation loc }, Cmd.none)

    OnSavePlayer res -> 
      case res of 
        Err err -> 
          (model, Cmd.none)
        
        Ok player ->
          (model |> updatePlayer player, Cmd.none )

    SavePlayer player ->
      (model, savePlayer player)

updatePlayer : Player -> Model -> Model
updatePlayer player model =
  let 
    test p = 
      if p.id == player.id
      then
        player
      else
        p

    map = 
      List.map test |> RemoteData.map
  in 
    { model | players = map model.players}
      