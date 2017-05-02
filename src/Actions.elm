module Actions exposing (..)

import Models exposing (Player)
import Navigation exposing (Location)
import RemoteData exposing (WebData)

type Action
  = NoOp
  | OnFetchPlayers (WebData (List Player))
  | OnLocationChange Location