module Main exposing (..)

import Html exposing (Html, div, text, button, h1, input)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Html.App
import Random exposing (..)
import String exposing (..)

--MODEL

type alias Model =
  { dieFace : Int
  , content : String
  , maxNum : Int
  }

init : (Model, Cmd Msg)
init =
  (Model 1 "Choose a Max" 10, Cmd.none)

--MESSAGES

type Msg
  = Roll
  | NewFace Int
  | Max String

--VIEW

view : Model -> Html Msg
view model =
  div [ class "text-center" ]
    [ h1 [] [ text (toString model.dieFace) ]
    , button [ onClick Roll ] [ text "Get New Number" ]
    , div [] [input [ placeholder "Max Number", onInput Max ] []
      , div [] [ text (model.content) ]
      ]
    ]

--UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 model.maxNum))

    NewFace newFace ->
      (Model newFace "Choose a Max" model.maxNum, Cmd.none)

    Max number ->
      (Model model.dieFace "Choose a Max" (toInt number |> Result.toMaybe |> Maybe.withDefault 10), Cmd.none)

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
