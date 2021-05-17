globals[dumpextended1 dumpextended2 extended water-flow ]
patches-own[river disease]
to setup
  clear-all

  set extended false
  set dumpextended1 false
  set dumpextended2 false

  ask patches
  [
    set river false

    if (pxcor > 3 and pxcor < 12) and (pycor > -1 and pycor < 26)
    [
      set pcolor blue
      set river true

    ]
    if pxcor > 10 and (pycor > 20 and pycor < 26)
    [
       set pcolor blue
      set river true
    ]

    if (pxcor = 4 and (pycor > -1 and pycor < 26))
    [
      let g random-float 10
      if g > 3.0
      [
        set pcolor brown
      ]
    ]
    if (pxcor = 11  and (pycor > -1 and pycor < 21))
    [
      let g random-float 10
      if g > 3.0
      [
        set pcolor brown
      ]
    ]
    if (pxcor = 5 or pxcor = 10) and (pycor > 11 and pycor < 22)
    [
      let g random-float 10
      if g > 3.0
      [
        set pcolor brown
      ]
    ]
    if (pxcor = 5) and (pycor > 21 and pycor < 26)
    [
      let g random-float 10
      if g > 3.0
      [
        set pcolor brown
      ]
    ]
    if (pxcor > 5 and pycor = 25) or (pxcor > 10 and pycor = 21)
    [
      let g random-float 10
      if g > 3.0
      [
        set pcolor brown
      ]
    ]
    if (pxcor > 18 and (pycor = 22 or pycor = 24))
    [
      let g random-float 10
      if g > 3.0
      [
        set pcolor brown
      ]
    ]

    if (pxcor = 12 or pxcor = 13) and (pycor > -1 and pycor < 21)
    [
      let x random-float 1
      ifelse x > 0.5
      [
        set pcolor green - 1

      ]
      [
        set pcolor white
      ]
    ]
   if (pxcor = 3) and (pycor > -1 and pycor < 26)
    [
      let x random-float 1
      ifelse x > 0.5
      [
        set pcolor green - 1

      ]
      [
        set pcolor white
      ]
    ]
    if (pxcor > 13) and (pycor = 20 or pycor = 19 or pycor = 26 or pycor = 27)
    [
      let x random-float 1
      ifelse x > 0.5
      [
        set pcolor green - 1

      ]
      [
        set pcolor white
      ]
    ]
    if (pxcor > 2 and pxcor < 14) and (pycor = 26 or pycor = 27)
    [
      let x random-float 1
      ifelse x > 0.5
      [
        set pcolor green - 1

      ]
      [
        set pcolor white
      ]
    ]
    if (pxcor > 13 and pycor < 19) or (pxcor < 4) or (pxcor > 3 and pycor > 27)
    [
      let a random-float 1
      ifelse a > 0.5
      [
        set pcolor red

      ]
      [
        set pcolor white
      ]
    ]
  ]


  reset-ticks
end

to go
  if (remainder ticks 52 > 0 and remainder ticks 52 < 25) or (remainder ticks 48 > 34 and remainder ticks 52 < 52)
  [
    increase-hh
    clean
    increase-dump
  ]
  if (remainder ticks 52 > 23 and remainder ticks 52 < 28)
  [
    rain
    increase-dump
  ]

;  if remainder ticks 104 = 32 ;this for only removing of the dump.
;  [remove-dump]
;  if remainder ticks 265 = 96 ;both of these for removing dump and extension of the Nullah.
;  [extend-nullah]

  if remainder ticks 52 = 28 [disease1 cyan blue - 1 increase-dump]
  if remainder ticks 52 = 29 [disease1 blue - 1 blue - 2 increase-dump]
  if remainder ticks 52 = 30 [disease1 blue - 2 blue - 3 increase-dump]
  if (remainder ticks 52 > 30 and remainder ticks 52 < 33) [disease2 increase-dump]
  if (remainder ticks 52 > 32 and remainder ticks 52 < 34) [clean-after-rain]
  if remainder ticks 52 = 34 [reset]


  tick

  if ticks = 520 [stop]
end

to increase-hh
  ask patches with [pcolor = white]
  [
    if (pxcor > 13 and pycor < 19) or (pxcor < 3) or (pxcor > 3 and pycor > 27)
    [
      let z random-float 1
      if z > 0.996
      [
        set pcolor red

      ]
    ]
    if (pxcor = 3 and pycor > 19)
    [
      let z random-float 1
      if z > 0.996
      [
        set pcolor red

      ]
    ]
    if (pxcor = 3) and (pycor > -1 and pycor < 26)
    [
      let q random-float 1
      if q > 0.996
      [
        set pcolor green - 1

      ]
    ]
    if(pxcor > 2 and pxcor < 12) and (pycor = 26 or pycor = 27)
    [
      let q random-float 1
      if q > 0.996
      [
        set pcolor green - 1

      ]
    ]
    if (pxcor > 13) and (pycor = 20 or pycor = 19 or pycor = 26 or pycor = 27)
    [
      let q random-float 1
      if q > 0.996
      [
        set pcolor green - 1

      ]
    ]
    if (pxcor = 12 or pxcor = 13) and (pycor > -1 and pycor < 21)
    [
      let q random-float 1
      if q > 0.996
      [
        set pcolor green - 1

      ]
    ]
    if (pxcor = 3) and (pycor > -1 and pycor < 27)
    [
      let q random-float 1
      if q > 0.996
      [
        set pcolor green - 1

      ]
    ]
  ]
end

to clean
  ask patches
  [
    if (pcolor = brown)
    [

      let q random-float 100
      if q < 0.1
      [
        set pcolor blue
      ]
    ]
  ]
end

to clean-after-rain
  ask patches
  [
    if (pxcor > 18 and pycor = 21) or (pxcor > 3 and pycor = 24)
    [
      let g random-float 100
      if (g < 1.9)
      [
        set pcolor blue
      ]
    ]
  ]
end

to increase-dump

  ask patches with [pcolor = blue]
  [
  ;show g
    ;random-float 100 < virus-spread-chance
    if (pxcor = 4 and (pycor > -1 and pycor < 26))
    [
        let g random 100
        if (Dump > g + 1 )
          [
            set pcolor brown

          ]
     ]

    if (pxcor = 11  and (pycor > -1 and pycor < 21))
    [
      let g random 100
        if (Dump > g + 1 )
          [
            set pcolor brown

          ]
    ]
    if (pxcor = 5 or pxcor = 10) and (pycor > 11 and pycor < 22)
    [
      let g random 100
      if (Dump > g + 1 )
      [
        set pcolor brown

      ]
    ]
    if (pxcor = 5) and (pycor > 21 and pycor < 26)
    [
      let g random 100
      if (Dump > g + 1 )
      [
        set pcolor brown

      ]
    ]
    if (pxcor > 5 and pycor = 25) or (pxcor > 10 and pycor = 21)
    [
      let g random 100
      if (Dump > g + 1)
      [
        set pcolor brown

      ]
    ]

    if (pxcor > 18 and (pycor = 22 or pycor = 24))
    [
      let g random 100
      if (Dump > g + 1)
      [
        set pcolor brown

      ]
    ]

    if ticks > 85
    [
      if (pxcor > 3 and pycor = 24) or (pxcor > 17 and pycor = 22) or ((pxcor = 5 or pxcor = 10)  and pycor < 11)
      [
        let g random 100
        if (Dump > g + 1)
        [
          set pcolor brown

        ]
      ]
    ]

    if ticks > 175
    [
     if (pxcor = 6 and pycor > -1 and pycor < 24) or (pxcor = 9 and pycor > -1 and pycor < 22)
      [
        let g random 100
        if (Dump > g + 3)
        [
          set pcolor brown

        ]
      ]
    ]

    if dumpextended1 = true ;if the Nullah is extended
    [
      if (pxcor > 18 and (pycor = 22 or pycor = 24))
      [
        let g random 100
        if (Dump > g)
        [
          set pcolor brown

        ]
      ]
    ]
    if dumpextended2 = true
    [
      if (pxcor > 11 and pycor = 20 )
      [
        let g random 100
        if (Dump > g)
        [
          set pcolor brown

        ]
      ]
      if (pxcor > 3 and pycor = 26)
      [
        let g random 100
        if (Dump > g)
        [
          set pcolor brown

        ]
      ]
      if (pxcor > 18 and (pycor = 22 or pycor = 24))
      [
        let g random 100
        if (Dump > g)
        [
          set pcolor brown

        ]
      ]

    ]
  ]
end

to rain
  set water-flow (count patches with [river = true] - count patches with [pcolor = brown])

  ifelse extended = false
  [
    if water-flow > 200 and amount-of-rain > 7
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor = 26 or pycor = 27 or pycor = 28 or (pycor < 22 and pycor > 17))) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 200 and water-flow > 175 and amount-of-rain > 5
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor = 26 or pycor = 27 or pycor = 28 or (pycor < 22 and pycor > 17))) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 175 and amount-of-rain > 3 and amount-of-rain < 6
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor = 26 or pycor = 27 or pycor = 28 or (pycor < 22 and pycor > 17))) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 175 and amount-of-rain > 5
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 30) or (pycor < 22 and pycor > 15)) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 150 and amount-of-rain > 3
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 30) or (pycor < 22 and pycor > 15)) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 150 and amount-of-rain > 5
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 31) or (pycor < 22 and pycor > 12)) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 125 and amount-of-rain > 1
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 31) or (pycor < 22 and pycor > 12)) or (pxcor = 12 or pxcor = 13 or pxcor = 3 or pxcor = 4 )  and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
  ]
  ;ifelse condition
  [
    if water-flow > 200 and amount-of-rain > 8
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor = 26 or pycor = 27 or pycor = 28 or (pycor < 22 and pycor > 17))) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 200 and water-flow > 175 and amount-of-rain > 7
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor = 26 or pycor = 27 or pycor = 28 or (pycor < 22 and pycor > 17))) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 175 and amount-of-rain > 3 and amount-of-rain < 6
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor = 26 or pycor = 27 or pycor = 28 or (pycor < 22 and pycor > 17))) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 175 and amount-of-rain > 5
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 31) or (pycor < 22 and pycor > 15)) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 150 and amount-of-rain > 3
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 31) or (pycor < 22 and pycor > 15)) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 150 and amount-of-rain > 5
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 33) or (pycor < 22 and pycor > 12)) and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]
    if water-flow < 125 and amount-of-rain > 1
    [
      ask patches
      [
        if ((pxcor > 2 and (pycor > 25 and pycor < 31) or (pycor < 22 and pycor > 12)) or (pxcor = 12 or pxcor = 13 or pxcor = 3 or pxcor = 4 )  and pcolor = white)
        [
          set pcolor cyan
        ]
      ]
    ]

  ]


  ask patches
  [
    if pcolor = cyan[


        let prob random-float 1
        if (prob < amount-of-rain)
        [
          let target one-of neighbors4 with [pcolor = brown or pcolor = white]
          if target != nobody and (pycor < 21 and pycor > 26)
          [
            ask target
            [
              set pcolor cyan

            ]
          ]
        ]
      ]
  ]
end

to reset
  ask patches
  [
    if (pcolor = green - 3)
    [
      set pcolor green - 1
    ]
    if( pcolor = blue - 3)
    [
      set pcolor white
    ]
    if (pcolor = red - 2)
    [
      set pcolor red
    ]
  ]
end


to disease1 [c d]
  ask patches with [pcolor = c]
  [
    set pcolor d

  ]
end

to disease2

  ifelse water-flow < 125 and amount-of-rain > 1 and ticks > 468
  [
    ask patches
    [
      if (pxcor = 12 or pxcor = 13) and (pycor > -1 and pycor < 21)
      [
        let x random-float 1
        if x > 0.5
        [
          set pcolor green - 2

        ]
      ]
      if (pxcor > 13 and pycor = 19) or (pxcor > 2 and pycor = 27)
      [
        let x random-float 1
        if x > 0.5
        [
          set pcolor green - 2

        ]

      ]
      if (pxcor > 13 and (pycor < 19 and pycor > 12)) or (pxcor > 2 and (pycor > 27 and pycor < 32))
      [
        let x random-float 1
        if x > 0.5
        [
          set pcolor red - 2

        ]
      ]
    ]
  ]

  [
    ask patches
    [

      if pcolor = blue - 3
      [
        let target one-of neighbors4 with [pcolor = red]
        if target != nobody
        [
          ask target
          [
            set pcolor red - 2

          ]
        ]
        let target1 one-of neighbors4 with [pcolor = green - 1 ]
        if target1 != nobody
        [
          ask target1
          [
            set pcolor green - 2

          ]
        ]
      ]
    ]
  ]


  if ( random-float 100 < disease-spread-chance)
  [
    ask patches
    [
      if pcolor = red - 2
      [
        ;      [ if random-float 100 < virus-spread-chance
        ;      [ become-infected ] ] ]
        ;      let prob random Disease-rate

        let target one-of neighbors4 with [pcolor = red]
        if target != nobody
        [
          ask target
          [
            set pcolor red - 2

          ]
        ]
      ]
    ]

  ]
  disease1 green - 2 green - 3
end



to remove-dump

  if remove-dump-rate = 1
  [
    set dumpextended1 true
    ask patches with [pcolor = brown]
    [
      if ticks < 86
      [
        if (pxcor > 18 and (pycor = 22 or pycor = 24))
        [set pcolor blue]
      ]
      if ticks > 85
      [
        if (pxcor > 18 and (pycor = 22 or pycor = 24)) or (pxcor > 3 and pycor = 24) or (pxcor > 17 and pycor = 22) or ((pxcor = 5 or pxcor = 10)  and pycor < 11)
        [set pcolor blue]
      ]
      if ticks > 175
      [
        if (pxcor = 6 and pycor > -1 and pycor < 24) or (pxcor = 9 and pycor > -1 and pycor < 22) or (pxcor > 17 and pycor = 22) or ((pxcor = 5 or pxcor = 10)  and pycor < 11)
        [set pcolor blue]
      ]
    ]
  ]
  if remove-dump-rate = 2
  [
    set dumpextended2 true
    ask patches with [pcolor = brown]
    [
      ;if ticks >
      ifelse ticks < 86
      [
        if (pxcor > 18 and (pycor = 22 or pycor = 24))
        [set pcolor blue]
      ]
      [
        ifelse ticks > 85
        [
          if (pxcor > 18 and (pycor = 22 or pycor = 24)) or (pxcor > 3 and pycor = 24) or (pxcor > 17 and pycor = 22) or ((pxcor = 5 or pxcor = 10)  and pycor < 11)
          [set pcolor blue]
        ]

        [
          if (pxcor = 6 and pycor > -1 and pycor < 24) or (pxcor = 9 and pycor > -1 and pycor < 22) or (pxcor > 17 and pycor = 22) or ((pxcor = 5 or pxcor = 10)  and pycor < 11)
          [set pcolor blue]
        ]

      ]
      let q random-float 1
      if q > 0.7
      [
        set pcolor blue
      ]
    ]
  ]
end


to extend-nullah
  if extended = false
  [

    set extended true
    ask patches
    [
      set dumpextended2 true
      if ((pycor = 20 and pxcor > 11)  or (pycor = 26 and pxcor > 3))
      [
        set pcolor blue
        set river true
      ]

    ]
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
467
22
904
460
-1
-1
13.0
1
10
1
1
1
0
0
0
1
0
32
0
32
1
1
1
ticks
30.0

BUTTON
18
20
81
53
NIL
setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
21
68
84
101
NIL
Go\n
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
120
122
229
155
NIL
Extend-Nullah
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
33
181
205
214
amount-of-rain
amount-of-rain
0
10
6.5
0.5
1
NIL
HORIZONTAL

SLIDER
36
225
208
258
Dump
Dump
0
10
6.0
1
1
NIL
HORIZONTAL

SLIDER
237
183
421
216
Disease-spread-chance
Disease-spread-chance
0
10
5.5
0.5
1
NIL
HORIZONTAL

MONITOR
271
22
450
67
Number of regular households
count patches with [pcolor = red]
17
1
11

MONITOR
241
73
345
118
Number of slums
count patches with [pcolor = green + 1 or pcolor = green - 1 or pcolor = green - 2 ]
17
1
11

MONITOR
241
127
345
172
Amount of dump
round ((count patches with [pcolor = brown] / count patches with [river = true]) * 100)
17
1
11

TEXTBOX
96
17
249
117
Red are regular house holds\nGreen are the slums\nNullah is in light blue\nBrown is the Dump accumulated\nDark red and green patches show disease being spread amongst the population
11
0.0
1

BUTTON
15
122
110
155
NIL
Remove-dump
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
237
226
425
259
Remove-dump-rate
Remove-dump-rate
1
2
1.0
1
1
NIL
HORIZONTAL

MONITOR
351
127
454
172
People Infected %
(count patches with [pcolor = red - 2]) / (count patches with [pcolor = red]) * 100
1
1
11

PLOT
13
265
459
456
Rate of Dump
Tme
Dump Accumulated %
0.0
150.0
0.0
100.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot (count patches with [pcolor = brown] / count patches with [river = true]) * 100"

PLOT
903
18
1244
267
Spread of Disease
Time
People Infected %
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot (count patches with [pcolor = red - 2] / count patches with [pcolor = red]) * 100"

MONITOR
358
75
445
120
Water flow 
count patches with [river = true] - count patches with [pcolor = brown]
17
1
11

PLOT
904
271
1244
483
Water flow %
Time
Water flow rate
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot (((count patches with [river = true] - count patches with [pcolor = brown]) / count patches with [river = true]) * 100)"

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="Without Extension" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>((count patches with [river = true] - count patches with [pcolor = brown]) / count patches with [river = true]) * 100</metric>
    <metric>(count patches with [pcolor = brown] / count patches with [river = true]) * 100</metric>
    <metric>(count patches with [pcolor = red - 2] / count patches with [pcolor = red]) * 100</metric>
    <enumeratedValueSet variable="Remove-dump-rate">
      <value value="1"/>
    </enumeratedValueSet>
    <steppedValueSet variable="Dump" first="1" step="1" last="10"/>
    <steppedValueSet variable="Disease-spread-chance" first="1" step="1" last="10"/>
    <steppedValueSet variable="amount-of-rain" first="1" step="2" last="10"/>
  </experiment>
  <experiment name="Only dump removed pt2" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count patches with [river = true] - count patches with [pcolor = brown]</metric>
    <metric>round ((count patches with [pcolor = brown] / count patches with [pcolor = blue]) * 100)</metric>
    <metric>round ((count patches with [pcolor = red - 2] / count patches with [pcolor = red - 1]) * 100)</metric>
    <enumeratedValueSet variable="Remove-dump-rate">
      <value value="2"/>
    </enumeratedValueSet>
    <steppedValueSet variable="Dump" first="1" step="1" last="10"/>
    <steppedValueSet variable="Disease-spread-chance" first="1" step="1" last="10"/>
    <steppedValueSet variable="amount-of-rain" first="1" step="2" last="10"/>
  </experiment>
  <experiment name="Only dump removed" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>round((count patches with [river = true] - count patches with [pcolor = brown]) / count patches with [river = true]) * 100</metric>
    <metric>round (count patches with [pcolor = brown] / count patches with [river = true]) * 100</metric>
    <metric>round (count patches with [pcolor = red - 2] / count patches with [pcolor = red]) * 100</metric>
    <enumeratedValueSet variable="Remove-dump-rate">
      <value value="1"/>
    </enumeratedValueSet>
    <steppedValueSet variable="Dump" first="1" step="1" last="10"/>
    <steppedValueSet variable="Disease-spread-chance" first="1" step="1" last="10"/>
    <steppedValueSet variable="amount-of-rain" first="1" step="2" last="10"/>
  </experiment>
  <experiment name="Both done with removal p1" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count patches with [river = true] - count patches with [pcolor = brown]</metric>
    <metric>round ((count patches with [pcolor = brown] / count patches with [pcolor = blue]) * 100)</metric>
    <metric>round ((count patches with [pcolor = red - 2] / count patches with [pcolor = red - 1]) * 100)</metric>
    <enumeratedValueSet variable="Remove-dump-rate">
      <value value="1"/>
    </enumeratedValueSet>
    <steppedValueSet variable="Dump" first="1" step="1" last="10"/>
    <steppedValueSet variable="Disease-spread-chance" first="1" step="1" last="10"/>
    <steppedValueSet variable="amount-of-rain" first="1" step="2" last="10"/>
  </experiment>
  <experiment name="Both done with removal p2" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count patches with [river = true] - count patches with [pcolor = brown]</metric>
    <metric>round ((count patches with [pcolor = brown] / count patches with [pcolor = blue]) * 100)</metric>
    <metric>round ((count patches with [pcolor = red - 2] / count patches with [pcolor = red - 1]) * 100)</metric>
    <enumeratedValueSet variable="Remove-dump-rate">
      <value value="2"/>
    </enumeratedValueSet>
    <steppedValueSet variable="Dump" first="1" step="1" last="10"/>
    <steppedValueSet variable="Disease-spread-chance" first="1" step="1" last="10"/>
    <steppedValueSet variable="amount-of-rain" first="1" step="2" last="10"/>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
