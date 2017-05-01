module Main exposing (..)

import Html exposing (..)

type alias Model = 
  String


init : (Model, Cmd Action)
init = 
  ("Hello", Cmd.none)

type Action 
  = NoOp


view : Model -> Html Action
view model = 
  div [] [
    text model
  ]


update : Action -> Model -> (Model, Cmd Action)
update action model = case action of 
  NoOp -> 
    (model, Cmd.none)

subscriptions : Model -> Sub Action
subscriptions model = 
  Sub.none

main : Program Never Model Action
main = program 
  {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }