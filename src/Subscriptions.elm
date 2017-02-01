port module Subscriptions exposing (..)

import Time exposing (second)
import Models exposing (Model)
import Messages exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (second * 5) Spin
