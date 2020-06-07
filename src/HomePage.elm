module HomePage exposing (main)

import Browser
import Html exposing (Html, button, div, h1, hr, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import String exposing (repeat)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { weeks : Int
    , week : Int
    , yacht1Progress : Int
    , yacht2Progress : Int
    , yacht3Progress : Int
    }


init : Model
init =
    { weeks = 12
    , week = 1
    , yacht1Progress = 1
    , yacht2Progress = 1
    , yacht3Progress = 1
    }


type Msg
    = IncrementWeek
    | DecrementWeek
    | IncrementYacht1
    | DecrementYacht1
    | IncrementYacht2
    | DecrementYacht2
    | IncrementYacht3
    | DecrementYacht3
    | ResetAll


update : Msg -> Model -> Model
update msg model =
    case msg of
        IncrementWeek ->
            { model | week = model.week + 1 }

        DecrementWeek ->
            { model | week = model.week - 1 }

        IncrementYacht1 ->
            { model | yacht1Progress = model.yacht1Progress + 1 }

        DecrementYacht1 ->
            { model | yacht1Progress = model.yacht1Progress - 1 }

        IncrementYacht2 ->
            { model | yacht2Progress = model.yacht2Progress + 1 }

        DecrementYacht2 ->
            { model | yacht2Progress = model.yacht2Progress - 1 }

        IncrementYacht3 ->
            { model | yacht3Progress = model.yacht3Progress + 1 }

        DecrementYacht3 ->
            { model | yacht3Progress = model.yacht3Progress - 1 }

        ResetAll ->
            { model | week = 1, yacht1Progress = 1, yacht2Progress = 1, yacht3Progress = 1 }


view : Model -> Html Msg
view model =
    div [ Html.Attributes.class "jumbotron" ]
        [ h1 [] [ Html.text ("The Race week: " ++ String.fromInt model.week ++ " of " ++ String.fromInt model.weeks) ]
        , hr [] []
        , svg
            [ width "1200"
            , height "330"
            , viewBox "0 0 1200 330"
            ]
            [ -- Weeks across the top
              rect
                [ x "1"
                , y "10"
                , width "1200"
                , height "10"
                ]
                []

            -- Weeks progress
            , rect
                [ x "1"
                , y "21"
                , width (String.fromInt (model.week * 100))
                , height "10"
                , fill "grey"
                ]
                []

            -- Yacht 1
            , rect
                [ x "1"
                , y "33"
                , width (String.fromInt (model.yacht1Progress * 100))
                , height "50"
                , rx "15"
                , ry "15"
                , fill "red"
                ]
                []

            -- Yacht 2
            , rect
                [ x "1"
                , y "85"
                , width (String.fromInt (model.yacht2Progress * 100))
                , height "50"
                , rx "15"
                , ry "15"
                , fill "green"
                ]
                []

            -- Yacht 3
            , rect
                [ x "1"
                , y "137"
                , width (String.fromInt (model.yacht3Progress * 100))
                , height "50"
                , rx "15"
                , ry "15"
                , fill "blue"
                ]
                []
            ]
        , hr [] []
        , p []
            [ Html.text ("Week : " ++ String.fromInt model.week ++ " / " ++ String.fromInt model.weeks)
            , button [ onClick IncrementWeek ] [ Html.text "+" ]
            , button [ onClick DecrementWeek ] [ Html.text "-" ]
            ]
        , p []
            [ Html.text ("Yacht 1 : " ++ String.fromInt model.yacht1Progress)
            , button [ onClick IncrementYacht1 ] [ Html.text "+" ]
            , button [ onClick DecrementYacht1 ] [ Html.text "-" ]
            ]
        , p []
            [ Html.text ("Yacht 2 : " ++ String.fromInt model.yacht2Progress)
            , button [ onClick IncrementYacht2 ] [ Html.text "+" ]
            , button [ onClick DecrementYacht2 ] [ Html.text "-" ]
            ]
        , p []
            [ Html.text ("Yacht 3 : " ++ String.fromInt model.yacht3Progress)
            , button [ onClick IncrementYacht3 ] [ Html.text "+" ]
            , button [ onClick DecrementYacht3 ] [ Html.text "-" ]
            ]
        , p []
            [ button [ onClick ResetAll ] [ Html.text "RESET" ]
            ]
        ]
