module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model = 
  {
    players: WebData (List Player),
    route: Route
  }

type Route 
  = PlayersRoute
  | PlayerRoute PlayerId
  | NotFoundRoute


type alias Player = 
  {
    id: PlayerId,
    name: String,
    level: Int
  }

type alias PlayerId =
  String

initialModel : Route -> Model
initialModel route = 
  {
    players = RemoteData.Loading,
    route = route
  }

