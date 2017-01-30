module Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Decode.Extra exposing (date)
import Models exposing (Url, EarthData)
import Messages exposing (..)
import Earth exposing (..)


fetchNatural : Cmd Msg
fetchNatural =
    Http.get naturalUrl collectionDecoder
        |> Http.send OnFetchNatural


collectionDecoder : Decode.Decoder (List EarthData)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder EarthData
memberDecoder =
    Decode.map2 EarthData
        (field "date" date)
        (field "image" Decode.string)
