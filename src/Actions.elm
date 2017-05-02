module Actions exposing (..)

import Models exposing (Player, PlayerId)
import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Http

type Action
  = NoOp
  | OnFetchPlayers (WebData (List Player))
  | OnLocationChange Location
  | SavePlayer Player
  | OnSavePlayer (Result Http.Error Player)
