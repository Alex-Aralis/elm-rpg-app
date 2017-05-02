module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Actions exposing (Action(..))
import Models exposing (Model, Route(..))
import Players.Table
import Players.Edit
import RemoteData exposing (WebData, RemoteData(..))

view : Model -> Html Action
view model = 
  div [class "m2"] [
    nav,
    page model
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

page : Model -> Html Action
page model = 
  let
    getPlayer id players = 
      case players of 
        [] -> 
          Nothing 

        (p::ps) -> 
          if p.id == id then 
            Just p 
          else 
            getPlayer id ps
  in
    case model.route of 
      PlayersRoute -> 
        Players.Table.view model.players

      PlayerRoute id -> 
        case model.players of 
          NotAsked -> 
            text ""

          Failure err -> 
            text <| toString err

          Loading -> 
            text "Loading..."

          Success players -> 
            case getPlayer id players of 
              Nothing ->
                text <| "Player " ++ id ++ " does not exist."
              
              Just player ->
                Players.Edit.view player
        
      NotFoundRoute ->
        text "Page not found"