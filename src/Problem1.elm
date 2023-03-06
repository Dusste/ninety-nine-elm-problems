module Problem1 exposing (last, mainHtml)

import Html exposing (Html)
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


mainHtml : Html a
mainHtml =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ Debug.toString x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ last [ 1, 2, 3, 4 ] == Just 4
            , last [ 1 ] == Just 1
            , last [] == Nothing
            , last [ 'a', 'b', 'c' ] == Just 'c'
            ]
