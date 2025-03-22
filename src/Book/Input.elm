module Book.Input exposing (..)

import ElmBook.Chapter exposing (..)
import ElmBook.ElmCSS exposing (Chapter)
import Html.Styled exposing (text)
import Input exposing (..)



-- import ElmBook.Actions exposing (logAction)


componentsList =
    [ ( "Text Input", textInput { label = "Enter text here", id = "textInput" } [] )
    , ( "Password Input", passwordInput { label = "Enter password here", id = "passwordInput" } [] )
    , ( "Email Input", emailInput { label = "Enter email here", id = "passwordInput" } [] )
    , ( "Number Input", numberInput { label = "Enter number here", id = "numberInput" } [] )
    , ( "TextArea", textareaInput { label = "Enter text here", id = "textArea", textValue = "" } [] )
    , ( "Checkbox Input", checkboxInput { label = "Checkbox", id = "Checkbox Input" } [] )
    , ( "Radio button", radioInput { label = "Radio", id = "Checkbox " } [] )
    , ( "Select", selectInput { label = "Select", id = "Checkbox", options = [ Html.Styled.text "Option 1", Html.Styled.text "Option 2" ] } [] )
    ]


docs : Chapter x
docs =
    chapter "Input"
        |> withComponentList
            componentsList
        |> render """
   Input components.

<component-list />

"""
