module Problem2 exposing (main, penultimate)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List
import Maybe exposing (Maybe)


penultimate : List a -> Maybe a
penultimate list =
    case list of
        [] ->
            Nothing

        x :: xs ->
            if List.length xs == 1 then
                Just x

            else
                penultimate xs


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        x ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString x ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ penultimate [ 1, 2, 3, 4 ] == Just 3
            , penultimate [ 1, 2 ] == Just 1
            , penultimate [ 1 ] == Nothing
            , penultimate [] == Nothing
            , penultimate [ "a", "b", "c" ] == Just "b"
            , penultimate [ "a" ] == Nothing
            ]
