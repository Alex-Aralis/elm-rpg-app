module Models exposing (..)

type alias Model = 
  {
    players: List Player
  }

type alias Player = 
  {
    id: PlayerId,
    name: String,
    level: Int
  }

type alias PlayerId =
  String

initialModel : Model
initialModel = 
  {
    players = [
      {
        id = "1",
        name = "Bob",
        level = 1
      }
    ]
  }

