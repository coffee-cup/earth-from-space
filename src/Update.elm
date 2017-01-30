port module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, initEarthData, Status(..))
import Routing exposing (parseLocation, navigateTo, Sitemap(..))


port scrollToTop : Bool -> Cmd msg


port pageView : String -> Cmd msg


port changeMetadata : String -> Cmd msg


changePage : Sitemap -> Cmd msg
changePage page =
    Cmd.batch
        [ navigateTo page
        , scrollToTop True
        , changeMetadata (Routing.pageTitle page)
        , pageView (Routing.toString page)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        ShowHome ->
            ( model, changePage HomeRoute )

        ShowAbout ->
            ( model, changePage AboutRoute )

        OnFetchNatural (Ok allEarthDatas) ->
            let
                headEarth =
                    allEarthDatas
                        |> List.head
                        |> Maybe.withDefault initEarthData
            in
                ( { model | earthData = headEarth, status = Fetched }, Cmd.none )

        OnFetchNatural (Err error) ->
            ( { model | status = Loading }, Cmd.none )
