module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (PlayerId, Route(..))
import UrlParser exposing (..)

matcher : Parser (Route -> a) a
matcher = 
  oneOf [
    map PlayersRoute top,
    map PlayerRoute (s "players" </> string),
    map PlayersRoute (s "players")
  ]

parseLocation : Location -> Route
parseLocation location = 
  case (parseHash matcher location) of
    Just route -> route

    Nothing -> NotFoundRoute
