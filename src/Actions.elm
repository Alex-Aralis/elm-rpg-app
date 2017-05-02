module Actions exposing (..)

import Models exposing (Player)
import RemoteData exposing (WebData)

type Action
  = NoOp
  | OnFetchPlayers (WebData (List Player))
