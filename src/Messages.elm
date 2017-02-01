module Messages exposing (..)

import Http
import Time exposing (Time)
import Navigation exposing (Location)
import Models exposing (EarthData)


type Msg
    = OnLocationChange Location
    | OnFetchNatural (Result Http.Error (List EarthData))
    | ShowHome
    | ShowAbout
    | Spin Time
