module Players.Table exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Actions exposing (Action(..))
import Models exposing (Player)
import RemoteData exposing (WebData, RemoteData(..))

view : WebData (List Player) -> Html Action
view players = 
  div [] [
    playersTable players
  ]

playersTable : WebData (List Player) -> Html Action
playersTable res = 
  case res of 
    NotAsked -> 
      text "Data unfetched"

    Loading -> 
      text "Loading..."

    Failure error ->
      text <| toString error
    
    Success players ->
      div [] [
        div [class "col-12 table p2"] [ 
          thead [class "h3 left-align bg-gray"] [
            tr [] [
              th [] [ text "ID" ],
              th [] [ text "Name" ],
              th [] [ text "Level" ]
            ]
          ],
          tbody [] <| List.map playerRow players
        ]
      ]

playerRow : Player -> Html Action
playerRow player = 
  tr []
    [
      td [] [ text player.id ],
      td [] [ text player.name ],
      td [] [ text <| toString player.level ]
    ]
