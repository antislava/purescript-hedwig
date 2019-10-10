module Examples.HelloSvg where

import Prelude

import Effect (Effect)
import Hedwig as H
import Hedwig ((:>))
import Hedwig.Svg

data FillColor = Red | Blue

instance showFillColor :: Show FillColor where
  show Red  = "red"
  show Blue = "blue"

type Model = FillColor

init :: Model
init = Blue

data Msg = Toggle

update :: H.Update Model Msg
update model _ = case model of
  Red  -> Blue :> []
  Blue -> Red  :> []

view :: Model -> H.Html Msg
view model =
  H.main [] [
    H.div [] [
      svg [ H.width 200, H.height 200 ] [
        g [ transform "scale(1 1) rotate(0) translate(50 50)" ]
        [ title [] [ H.text "Hello SVG" ]
        , circle [ H.onClick Toggle, fill (show model), stroke "black", cx "50", cy "50", r "50" ] []
        ]
      ]
    ]
  ]

main :: Effect Unit
main = do
  let
    app = {
      init: init :> [],
      update,
      view,
      inputs: []
    }
  H.mount "main" app
