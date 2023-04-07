module Problem12 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


type RleCode a
    = Run Int a
    | Single a


rleDecode : List (RleCode a) -> List a
rleDecode list =
    case list of
        [] ->
            []

        x :: xs ->
            case x of
                Run i v ->
                    List.repeat i v ++ rleDecode xs

                Single v ->
                    v :: rleDecode xs


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "green" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        n ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString n ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ rleDecode [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
                == [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
            , rleDecode [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
                == [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
            , rleDecode [ Run 4 "1", Single "b", Run 2 "5", Single "2", Single "a" ]
                == [ "1", "1", "1", "1", "b", "5", "5", "2", "a" ]
            ]
