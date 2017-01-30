module Utils exposing (..)

import Date exposing (Date)


classify : String -> String
classify s =
    s
        |> String.toLower
        |> String.split " "
        |> String.join "-"


boolToInt : Bool -> Int
boolToInt b =
    case b of
        True ->
            1

        False ->
            0


formatDate : Date -> String
formatDate date =
    let
        year =
            Date.year date

        month =
            Date.month date

        day =
            Date.day date

        hour =
            Date.hour date

        minute =
            Date.minute date

        padTime : Int -> String
        padTime time =
            time |> toString |> String.padLeft 2 '0'
    in
        (toString day)
            ++ " "
            ++ (toString month)
            ++ " "
            ++ (toString year)
            ++ " , "
            ++ (padTime hour)
            ++ ":"
            ++ (padTime minute)
            ++ " GMT"
