module Subscriptions exposing (subscriptions)

import Actions exposing (Action)
import Models exposing (Model)

subscriptions : Model -> Sub Action
subscriptions model =
  Sub.none
