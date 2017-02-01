port module Update exposing (..)

import Array
import Messages exposing (Msg(..))
import Models exposing (Model, Status(..))
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

        Spin _ ->
            ( { model | index = (model.index + 1) % (Array.length model.earthDatas) }, Cmd.none )

        OnFetchNatural (Ok allEarthDatas) ->
            ( { model | earthDatas = Array.fromList allEarthDatas, status = Fetched }, Cmd.none )

        OnFetchNatural (Err error) ->
            ( { model | status = Error }, Cmd.none )
