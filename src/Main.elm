module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes exposing (href)
import Problem1
import Problem10
import Problem11
import Problem12
import Problem14
import Problem15
import Problem16
import Problem17
import Problem18
import Problem19
import Problem2
import Problem20
import Problem21
import Problem3
import Problem4
import Problem5
import Problem6
import Problem7
import Problem8
import Problem9
import ProblemExtra1
import ProblemExtra2


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


mainHeading : Html msg
mainHeading =
    Html.div []
        [ Html.h1 []
            [ Html.a [ href "https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/" ] [ Html.text "99 Problems solved in ELM " ]
            , Html.text "by Dusan Stevanovic"
            ]
        ]


infoSection : Html msg
infoSection =
    Html.div []
        [ Html.p []
            [ Html.text "These problems are adaptations for Elm from Ninety-Nine Haskell Problems, which are adaptations of Ninety-Nine Prolog Problems developed by Werner Hett. The title is more figurative than literal. There weren't 99 problems in the original Prolog collection. A few of the original Prolog problems don't apply to Elm. The numbering of the problems is consistent with the other collections to ease comparisons. Other adaptations include Lisp, Scala, OCaml, Python and R."
            ]
        ]


type alias ProblemConfig a =
    { headline : String, description : String, textInput : String, solutionInString : String, main : Html a }


problem1Wrapper : Html msg
problem1Wrapper =
    Html.div []
        (problemsConfig
            |> List.map
                (\problem ->
                    Html.div []
                        [ Html.h2 [] [ Html.text problem.headline ]
                        , Html.div []
                            [ Html.p [] [ Html.text problem.description ]
                            , problem.main
                            ]
                        , Html.div []
                            [ Html.p [] [ Html.text "Input:" ]
                            , Html.p [] [ Html.text problem.textInput ]
                            , Html.p [] [ Html.text "Solution:" ]
                            , Html.text problem.solutionInString
                            ]
                        ]
                )
        )


problemsConfig : List (ProblemConfig a)
problemsConfig =
    [ { headline = "Problem 1"
      , description = "Write a function last that returns the last element of a list. An empty list doesn't have a last element, therefore last must return a Maybe."
      , textInput = "[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]"
      , solutionInString = Problem1.last [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] |> Debug.toString
      , main = Problem1.main
      }
    , { headline = "Problem 2"
      , description = "Implement the function penultimate to find the next to last element of a list."
      , textInput = "[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]"
      , solutionInString = Problem2.penultimate [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] |> Debug.toString
      , main = Problem2.main
      }
    , { headline = "Problem 3"
      , description = "Implement the function elementAt to return the n-th element of a list. The index is 1-relative, that is, the first element is at index 1."
      , textInput = "[ 1001, 44, 3, 789, 54, 33 ] find second(2) element in a list"
      , solutionInString = Problem3.elementAt [ 1001, 44, 3, 789, 54, 33 ] 2 |> Debug.toString
      , main = Problem3.main
      }
    , { headline = "Problem 4"
      , description = "Elm provides the function List.length. See if you can implement it yourself."
      , textInput = "[1, 2, 3, 4, 3, 2, 1]"
      , solutionInString = Problem4.countElements [ 1, 2, 3, 4, 3, 2, 1 ] |> Debug.toString
      , main = Problem4.main
      }
    , { headline = "Problem 5"
      , description = "Elm provides the function List.reverse to reverse the order of elements in a list. See if you can implement it."
      , textInput = "[ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k' ]"
      , solutionInString = Problem5.myReverse [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k' ] |> Debug.toString
      , main = Problem5.main
      }
    , { headline = "Problem 6"
      , description = "Determine if a list is a palindrome, that is, the list is identical when read forward or backward."
      , textInput = "[ 1, 3, 5, 8, 5, 3, 1 ]"
      , solutionInString = Problem6.isPalindrome [ 1, 3, 5, 8, 5, 3, 1 ] |> Debug.toString
      , main = Problem6.main
      }
    , { headline = "Problem 7"
      , description = "Flatten a nested lists into a single list. Because Lists in Elm are homogeneous we need to define what a nested list is."
      , textInput = List.range 1 10 |> Debug.toString
      , solutionInString = Problem7.flatten Problem7.nl2 |> Debug.toString
      , main = Problem7.main
      }
    , { headline = "Extra 1"
      , description = "Drop items from the start of a list until an item does not satisfy criteria specified by a function."
      , textInput = List.range 1 10 |> Debug.toString
      , solutionInString = ProblemExtra1.dropWhile ((>) 5) (List.range 1 10) |> Debug.toString
      , main = ProblemExtra1.main
      }
    , { headline = "Extra 2"
      , description = "Keep elements from the start of a list while they satisfy a condition."
      , textInput = List.range 1 10 |> Debug.toString
      , solutionInString = ProblemExtra2.takeWhile ((>) 5) (List.range 1 10) |> Debug.toString
      , main = ProblemExtra2.main
      }
    , { headline = "Problem 8"
      , description = "Write a function to remove consecutive duplicates of list elements."
      , textInput = [ 3, 3, 4, 3, 4, 4 ] |> Debug.toString
      , solutionInString = Problem8.noDupes [ 3, 3, 4, 3, 4, 4 ] |> Debug.toString
      , main = Problem8.main
      }
    , { headline = "Problem 9"
      , description = "Convert a list to a list of lists where repeated elements of the source list are packed into sublists. Elements that are not repeated should be placed in a one element sublist."
      , textInput = [ 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6 ] |> Debug.toString
      , solutionInString = Problem9.pack [ 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6 ] |> Debug.toString
      , main = Problem9.main
      }
    , { headline = "Problem 10"
      , description = "Run-length encode a list of list to a list of tuples. Unlike lists, tuples can mix types. Use tuples (n, e) to encode a list where n is the number of duplicates of the element e."
      , textInput =
            [ [ 'a', 'a', 'a' ]
            , [ 'b' ]
            , [ 'c', 'c', 'c' ]
            , [ 'd', 'd', 'd', 'd' ]
            , [ 'e' ]
            , [ 'f', 'f' ]
            ]
                |> Debug.toString
      , solutionInString =
            Problem10.runLengths
                [ [ 'a', 'a', 'a' ]
                , [ 'b' ]
                , [ 'c', 'c', 'c' ]
                , [ 'd', 'd', 'd', 'd' ]
                , [ 'e' ]
                , [ 'f', 'f' ]
                ]
                |> Debug.toString
      , main = Problem10.main
      }
    , { headline = "Problem 11"
      , description = "Write a function to run length encode a list, but instead of using a tuple as in problem 10, use a union data type"
      , textInput = [ 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 5, 5, 5, 5 ] |> Debug.toString
      , solutionInString = Problem11.rleEncode [ 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 5, 5, 5, 5 ] |> Debug.toString
      , main = Problem11.main
      }
    , { headline = "Problem 12"
      , description = "Decompress the run-length encoded list generated in Problem 11."
      , textInput = [ Problem12.Run 4 1, Problem12.Single 2, Problem12.Run 2 5, Problem12.Single 2, Problem12.Single 1 ] |> Debug.toString
      , solutionInString = Problem12.rleDecode [ Problem12.Run 4 1, Problem12.Single 2, Problem12.Run 2 5, Problem12.Single 2, Problem12.Single 1 ] |> Debug.toString
      , main = Problem12.main
      }
    , { headline = "Problem 14"
      , description = "Duplicate each element of a list."
      , textInput = [ 1, 2, 3, 5, 8, 8 ] |> Debug.toString
      , solutionInString = Problem14.duplicate [ 1, 2, 3, 5, 8, 8 ] |> Debug.toString
      , main = Problem14.main
      }
    , { headline = "Problem 15"
      , description = "Repeat each element of a list a given number of times."
      , textInput = "3 [ 1, 2, 3, 3 ]"
      , solutionInString = Problem15.repeatElements 3 [ 1, 2, 3, 3 ] |> Debug.toString
      , main = Problem15.main
      }
    , { headline = "Problem 16"
      , description = "Drop every nth element from a list."
      , textInput = "[ 1,2,3,4,5,6,7,8,9,10 ] 3"
      , solutionInString = Problem16.dropNth (List.range 1 10) 3 |> Debug.toString
      , main = Problem16.main
      }
    , { headline = "Problem 17"
      , description = "Split a list into two lists. The length of the first part is specified by the caller."
      , textInput = "[ 1,2,3,4,5,6,7,8,9,10 ] 3"
      , solutionInString = Problem17.split (List.range 1 10) 3 |> Debug.toString
      , main = Problem17.main
      }
    , { headline = "Problem 18"
      , description = "Extract a slice from a list.\n\nGiven a list, return the elements between (inclusively) two indices. Start counting the elements with 1. Indices outside of the list bounds (i.e. negative number, or beyond the length of the list) should be clipped to the bounds of the list.\n\n"
      , textInput = "3 7 [1,2,3,4,5,6,7,8,9,10 ]"
      , solutionInString = Problem18.sublist 3 7 (List.range 1 10) |> Debug.toString
      , main = Problem18.main
      }
    , { headline = "Problem 19"
      , description = "Rotate a list n places to the left (negative values will rotate to the right). Allow rotations greater than the list length."
      , textInput = "-1 [1,2,3,4,5]"
      , solutionInString = Problem19.rotate -1 (List.range 1 5) |> Debug.toString
      , main = Problem19.main
      }
    , { headline = "Problem 20"
      , description = "Remove the nth element from a list."
      , textInput = "3 [ 1,2,3,4,5,6,7,8,9,10 ]"
      , solutionInString = Problem20.dropAt 3 (List.range 1 10) |> Debug.toString
      , main = Problem20.main
      }
    , { headline = "Problem 21"
      , description = "Insert an element at a given position into a list. Treat the first position as index 1."
      , textInput = "6 99 [1,2,3,4,5]"
      , solutionInString = Problem21.insertAt 6 99 (List.range 1 5) |> Debug.toString
      , main = Problem21.main
      }
    ]
