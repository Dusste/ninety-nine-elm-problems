module Main exposing (main)

import Browser
import Html exposing (Html)
import Problem1


main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, update = update, view = view }


initialModel : Model
initialModel =
    { something = ""
    }


type Msg
    = NoOp


type alias Model =
    { something : String
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html msg
view _ =
    Html.div []
        [ mainHeading
        , infoSection
        , problem1Wrapper
        ]



-- main : Html msg
-- main =
--     Problem1.problem1
--         |> Debug.toString
--         |> Html.text


mainHeading : Html msg
mainHeading =
    Html.div []
        [ Html.h1 []
            [ Html.text "99 Problems solved in ELM by Dusan Stevanovic"
            ]
        ]


infoSection : Html msg
infoSection =
    Html.div []
        [ Html.p []
            [ Html.text "These problems are adaptations for Elm from Ninety-Nine Haskell Problems, which are adaptations of Ninety-Nine Prolog Problems developed by Werner Hett. The title is more figurative than literal. There weren't 99 problems in the original Prolog collection. A few of the original Prolog problems don't apply to Elm. The numbering of the problems is consistent with the other collections to ease comparisons. Other adaptations include Lisp, Scala, OCaml, Python and R."
            ]
        ]


problem1Wrapper : Html msg
problem1Wrapper =
    Html.div []
        [ Html.h2 [] [ Html.text "Problem 1" ]
        , Html.div []
            [ Html.p [] [ Html.text "Write a function last that returns the last element of a list. An empty list doesn't have a last element, therefore last must return a Maybe." ]
            , Problem1.mainHtml
            ]
        , Html.div []
            [ Html.p [] [ Html.text "Input:" ]
            , Html.p [] [ Html.text "[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]" ]
            , Html.p [] [ Html.text "Solution:" ]
            , Html.text (Debug.toString (Problem1.last [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]))
            ]
        ]
