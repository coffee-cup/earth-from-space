module Utils exposing (..)

import Date exposing (Date, Month(..))


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


stringToDate : String -> Date
stringToDate s =
    s
        |> String.split "-"
        |> String.join "/"
        |> Date.fromString
        |> Result.withDefault (Date.fromTime 0)


formatDate : String -> String
formatDate dateString =
    let
        date =
            stringToDate dateString

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


monthToNumber : Month -> Int
monthToNumber m =
    case m of
        Jan ->
            1

        Feb ->
            2

        Mar ->
            3

        Apr ->
            4

        May ->
            5

        Jun ->
            6

        Jul ->
            7

        Aug ->
            8

        Sep ->
            9

        Oct ->
            10

        Nov ->
            11

        Dec ->
            12
