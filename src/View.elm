module View exposing (view)

import Actions exposing (Action(..))
import Models exposing (Model)
import Html exposing (..)

view : Model -> Html Action
view model = 
  div [] [
    text model
  ]