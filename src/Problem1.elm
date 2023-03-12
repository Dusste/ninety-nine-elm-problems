module Problem1 exposing (last, main)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List
import Maybe exposing (Maybe)


last : List a -> Maybe a
last lst =
    case lst of
        x :: xs ->
            if List.isEmpty xs then
                Just x

            else
                last xs

        [] ->
            Nothing


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "green" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        x ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString x ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ last [ 1, 2, 3, 4 ] == Just 4
            , last [ 1 ] == Just 1
            , last [] == Nothing
            , last [ 'a', 'b', 'c' ] == Just 'c'
            ]
