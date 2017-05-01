module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Actions exposing (Action(..))
import Models exposing (Model)
import Players.Table

view : Model -> Html Action
view model = 
  div [class "m2"] [
    nav,
    Players.Table.view model.players
  ]

nav : Html Action
nav = 
  let 
    navItem clickAction content = 
      div [class "bg-gray black rounded px2"] [
        text content
      ]
  in 
    div [class "col-12 flex bg-black rounded gray p2 h2"] [
      div [class "flex-auto"] [
        text "RPG App"
      ],
      navItem NoOp "List"
    ]