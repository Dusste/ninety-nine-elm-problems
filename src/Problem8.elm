module Problem8 exposing (main, noDupes)

import Html exposing (Html, text)
import Html.Attributes exposing (style)


noDupes : List a -> List a
noDupes lst =
    case lst of
        [] ->
            []

        [ _ ] ->
            lst

        f :: s :: xs ->
            if f == s then
                noDupes (s :: xs)

            else
                f :: noDupes (s :: xs)


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "green" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "orange" ] [ text "Your implementation failed one test." ]

        x ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString x ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ noDupes [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ] == [ 1, 2, 5, 2, 1 ]
            , noDupes [ 2, 1, 1, 1 ] == [ 2, 1 ]
            , noDupes [ 2, 2, 2, 1, 1, 1 ] == [ 2, 1 ]
            , noDupes [ 3, 3, 4, 3, 4, 4 ] == [ 3, 4, 3, 4 ]
            , noDupes [ 1 ] == [ 1 ]
            , noDupes [ '-', '-', '?', '?', '_', '+', '-', '_', '_', '_' ] == [ '-', '?', '_', '+', '-', '_' ]
            , noDupes [] == []
            , noDupes [ "aa", "aa", "aa" ] == [ "aa" ]
            , noDupes [ "aab", "b", "b", "aa", "aab" ] == [ "aab", "b", "aa", "aab" ]
            ]
