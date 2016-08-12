module Main exposing (..)

import Html exposing (Html, div, text, button, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Html.App
import Random exposing (..)

--MODEL

type alias Model =
  { dieFace : Int
  }

init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)

--MESSAGES

type Msg
  = Roll
  | NewFace Int

--VIEW

view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (toString model.dieFace) ]
    , button [ onClick Roll ] [ text "Roll" ]
    ]

--UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 6))

    NewFace newFace ->
      (Model newFace, Cmd.none)

--SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- MAIN

main : Program Never
main =
  Html.App.program
    { init = init,
      view = view,
      update = update,
      subscriptions = subscriptions
    }
