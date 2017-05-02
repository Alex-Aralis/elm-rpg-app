module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Encode as Encode
import Json.Decode.Pipeline exposing (decode, required)
import Actions exposing (Action)
import Models exposing (Player)
import RemoteData

fetchPlayers : Cmd Action
fetchPlayers =
  let
    url = baseUrl ["players"]
  in
    playerDecoder 
      |> Decode.list 
      |> Http.get url  
      |> RemoteData.sendRequest
      |> Cmd.map Actions.OnFetchPlayers

savePlayer : Player -> Cmd Action
savePlayer player = 
  let 
    request = 
      Http.request {
        body = playerEncoder player |> Http.jsonBody,
        expect = Http.expectJson playerDecoder,
        url = baseUrl ["players", player.id],
        headers = [],
        method = "PATCH",
        timeout = Nothing,
        withCredentials = False
      }
  in
    Http.send Actions.OnSavePlayer request

playerDecoder : Decode.Decoder Player
playerDecoder = 
  decode Player 
    |> required "id" Decode.string
    |> required "name" Decode.string
    |> required "level" Decode.int

playerEncoder : Player -> Encode.Value
playerEncoder player =
  Encode.object [
    ("id", Encode.string player.id),
    ("name", Encode.string player.name),
    ("level", Encode.int player.level)
  ]


baseUrl : List String -> String
baseUrl path = 
  let
    base = "http://localhost:4000"
  in
    base::path |> List.intersperse "/" |> String.concat
    

