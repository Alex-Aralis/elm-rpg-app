module Players.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Player)
import Actions exposing (..)

view : Player -> Html Action
view player = 
  div [] [
    nav player,
    form player
  ]

nav : Player -> Html Action
nav { name } =
  div [class "h3 bg-darkblue yellow"] [
    text name
  ]

form : Player -> Html Action
form player = 
  let 
    lvlIncButton { id } = button [class "btn"] [ i [ class "fa fa-plus-circle" ] [] ]
    lvlDecButton { id } = button [class "btn"] [ i [ class "fa fa-minus-circle" ] [] ]
  in
    div [class "flex"] [
      div [] [text "Change Level"],
      lvlIncButton player,
      div [] [text <| toString player.level],
      lvlDecButton player
    ]

