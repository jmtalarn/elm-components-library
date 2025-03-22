module Book.Typography exposing (..)

import ElmBook.Chapter exposing (..)
import ElmBook.ElmCSS exposing (Chapter)
import Html.Styled exposing (text)
import Typography exposing (..)



-- import ElmBook.Actions exposing (logAction)


componentsList =
    [ ( "Heading 1", heading1 [ text "Heading 1" ] )
    , ( "Heading 2", heading2 [ text "Heading 2" ] )
    , ( "Heading 3", heading3 [ text "Heading 3" ] )
    , ( "Heading 4", heading4 [ text "Heading 4" ] )
    , ( "Heading 5", heading5 [ text "Heading 5" ] )
    , ( "Heading 6", heading6 [ text "Heading 6" ] )
    , ( "Paragraph", paragraph [ text "Minim sit esse anim irure ea voluptate est occaecat cupidatat tempor anim duis. Laboris officia esse sint voluptate. Ullamco magna ipsum esse occaecat qui sint sunt proident magna non magna mollit laboris. Magna esse ut ipsum consectetur Lorem. Nulla laborum sint velit aute aute aliquip occaecat aliqua quis voluptate adipisicing ipsum. Irure nostrud incididunt ad Lorem elit ea elit ad labore est cillum laborum." ] )
    , ( "Small Text", smallText [ text "Small Text" ] )
    ]



-- docs : Chapter x
-- docs =
--     chapter "Typography"
--         |> renderComponentList
--             componentsList


docs : Chapter x
docs =
    --let
    --     props =
    --         { label = "Click me!"
    --         , disabled = False
    --         , onClick = logAction "Clicked button!"
    --         }
    -- in
    chapter "Typography with MD"
        |> withComponentList
            componentsList
        |> render """
Typography components in this markdown.

<component-list />

"""
