module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Actions exposing (Action)
import Models exposing (Player)
import RemoteData

fetchPlayers : Cmd Action
fetchPlayers =
  let
    url = "http://localhost:4000/players"
    decoder = 
      decode Player 
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "level" Decode.int
        |> Decode.list

  in
    Http.get url decoder
      |> RemoteData.sendRequest
      |> Cmd.map Actions.OnFetchPlayers
