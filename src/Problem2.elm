module Problem2 exposing (penultimate)

import Html exposing (Html)
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
            [ penultimate [ 1, 2, 3, 4 ] == Just 3
            , penultimate [ 1, 2 ] == Just 1
            , penultimate [ 1 ] == Nothing
            , penultimate [] == Nothing
            , penultimate [ "a", "b", "c" ] == Just "b"
            , penultimate [ "a" ] == Nothing
            ]
