module Problem3 exposing (elementAt, main)

import Html exposing (Html)
import List
import Maybe exposing (Maybe)


elementAt : List a -> Int -> Maybe a
elementAt list n =
    let
        listStartFromGivenIndex =
            list
                |> List.drop (n - 1)
    in
    if List.length list < n then
        Nothing

    else if n < 0 then
        Nothing

    else
        case listStartFromGivenIndex of
            [] ->
                Nothing

            x :: _ ->
                Just x


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
            [ elementAt [ 1, 2, 3, 4 ] 2 == Just 2
            , elementAt [ 1 ] 2 == Nothing
            , elementAt [ 9288321, 2891823, 372871872, 2378765, 32, 4, 233232, 4355, 5445, 8727, 5996, 928882, 564, 78, 43, 555, 32, 6778, 90967, 454, 7, 0, 3 ] 11 == Nothing
            , elementAt [ 1 ] 1 == Just 1
            , elementAt [] 2 == Nothing
            , elementAt [] -1 == Nothing
            , elementAt [] 0 == Nothing
            , elementAt [ 1, 2, 3, 4 ] -1 == Nothing
            , elementAt [ 1, 2, 3, 4 ] 0 == Nothing
            , elementAt [ 'a', 'b', 'c' ] 2 == Just 'b'
            ]
