#let systemFontSize = 8pt
#let nameFontSize = 17pt
#let inputFontSize = 10pt

#let addSpace(input) = {
  box(
    [#pad(left:1cm,[#input])],
  )
}

#let 私(性読み: "",名読み: "", 性: "",名: "",生年月日: "",年齢: 0) = {
  stack(
    place(
      top + right,
      dy: -10pt,
      datetime.today().display(
        "[year]年[month]月[day]日現在",
      )
    ),
    rect(
      stroke: (
        bottom: none,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: auto,
      width: 100%,
      [
        #grid(
          columns: (1.5cm,4cm,1fr),
          [ふりがな],
          [#align(center,性読み)],
          [#align(start,名読み)]
        )
      ] 
    ),
    line(
      length: 100%,
      stroke: (
        dash:"dashed",
      )
    ),
    rect(
      stroke: (
        bottom: 0.5pt,
        top: none,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: auto,
      width: 100%,
      [
        #align(top,
          grid(
            columns: (1.5cm,4cm,1fr),
            [氏 #h(0.6cm)名],
            [
              #pad(y: 0.4cm,align(center + horizon,text(nameFontSize,性)))
            ],
            [
              #pad(y: 0.4cm,align(start + horizon,text(nameFontSize,名)))
            ]
              
          )
        )
      ]
    ),
    rect(
      stroke: (
        bottom: 0.5pt,
        top: none,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: auto,
      width: 100%,
      [
        #align(start + top,
          grid(
          columns: (1.5cm,1fr),
          [生年月日],
            pad(y: 0.2cm,[#addSpace(text(inputFontSize,[#生年月日 生 #h(0.6cm) (満 #h(0.5em) #年齢 才)]))])
          )
        )
      ]
    )
  )
}

#let 証明写真(写真: "") = {
  set text(size: 7pt)
  pad(
    bottom: 0.3cm,
    left: 0.4cm,
    box(
      stroke: (
        dash:"dashed",
      ),
      height: 4cm,
      width: 3cm,
      [
        #if (写真 == ""){
          align(
            center + horizon,
            [
              写真を貼る位置\
              (縦 40mm, 横 30mm)
            ]
          )
        } else {
          image(写真, width: 3cm, height: 4cm)
        }
      ]
    )
  )
}

#let アドレス(住所ふりがな1: "", 住所1: "",住所ふりがな2: "", 住所2: "",郵便番号1: "",郵便番号2: "", 電話番号1:"",Email1:"",電話番号2:"",Email2:"", enable2ndAddress: true) = {
  stack(
    grid(
      columns: (5fr,2fr),
      [
        #stack(
          rect(
            stroke: (
              bottom: none,
              top: none,
              left: 1.5pt,
              right: 0.5pt
            ),[
              #grid(
                columns: (1.5cm,1fr),
                [ふりがな],
                [#align(center,住所ふりがな1)]
              )
            ]
          ),
          line(stroke: (dash:"dashed"), length: 100%)
        )
      ],
      [
        #rect(
          width: 100%,
          stroke: (
            bottom: 0.5pt,
            top: 1.5pt,
            left: none,
            right: 1.5pt
          ),[
          電話 #h(10pt) #電話番号1
          ]
        )
      ]
    ),
    grid(
      columns: (5fr,2fr),
      [
        #rect(
          width: 100%,
          height: 1.8cm,
          stroke: (
            bottom: if enable2ndAddress { 0.5pt } else { 1.5pt },
            top: none,
            left: 1.5pt,
            right: 0.5pt
          ),[
            #if (郵便番号1 == "") {
              [現住所 (〒 #h(20pt) - #h(20pt))]
            } else {
              [現住所 (〒 #text(tracking: 1pt,systemFontSize,郵便番号1))]
            }
            #pad(y: 0.2cm ,align(center,text(inputFontSize,住所1)))
          ]
        )
      ],
      [
        #rect(
          width: 100%,
          height: 1.8cm,
          stroke: (
            bottom: if enable2ndAddress { 0.5pt } else { 1.5pt },
            top: none,
            left: none,
            right: 1.5pt
          ),[
            E-mail
            #pad(
              y: 0.3cm,
              align(center, text(size: inputFontSize)[
                #Email1
              ])
            )
          ]
        )
      ]
    ),
    if enable2ndAddress {
      grid(
        columns: (5fr,2fr),
        [
          #stack(
            rect(
              stroke: (
                bottom: none,
                top: none,
                left: 1.5pt,
                right: 0.5pt
              ),[
                #grid(
                  columns: (1.5cm,1fr),
                  [ふりがな],
                  [#align(center,住所ふりがな2)]
                )
              ]
            ),
            line(stroke: (dash:"dashed"), length: 100%)
          )
        ],
        [
          #rect(
            width: 100%,
            stroke: (
              bottom: 0.5pt,
              top: none,
              left: none,
              right: 1.5pt
            ),[
              電話 #h(10pt) #電話番号2
            ]
          )
        ]
      )
    },
    if enable2ndAddress {
      grid(
        columns: (5fr,2fr),
        [
          #rect(
            width: 100%,
            height: 1.8cm,
            stroke: (
              bottom: 1.5pt,
              top: none,
              left: 1.5pt,
              right: 0.5pt
            ),[
              #if (郵便番号2 == "") {
                [連絡先 (〒 #h(20pt) - #h(20pt))]
              } else {
                [連絡先 (〒 #text(tracking: 1pt,systemFontSize,郵便番号2))]
              }
              #pad(y: 0.2cm ,align(center,text(inputFontSize,住所2)))
            ]
          )
        ],
        [
          #rect(
            width: 100%,
            height: 1.8cm,
            stroke: (
              bottom: 1.5pt,
              top: none,
              left: none,
              right: 1.5pt
            ),[
              E-mail
              #pad(y: 0.3cm ,align(center,Email2))
            ]
          )
        ]
      )
    }
  )
}

#let 学歴(年:"", 月:"",学歴: "") = {
  set text(inputFontSize)
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [
      #align(center,年)
    ],
    [
      #align(center,月)
    ],
    [
      #if (年 == "" and 月 == "" and 学歴 == "") {
        align(center,[学歴])
      } else {
        align(start + horizon,[#h(5pt)#学歴])
      }
    ]
  )
}

#let 職歴(年:"", 月:"",職歴:"") = {
  set text(inputFontSize) 
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [
      #align(center,年)
    ],
    [
      #align(center,月)
    ],
    [
      #if (年 == "" and 月 == "" and 職歴 == "") {
        align(center,[職歴])
      } else {
        align(start + horizon,[#h(5pt)#職歴])
      }
    ]
  )
}

#let 資格(年:"", 月:"",資格:"") = {
  set text(inputFontSize)
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [
      #align(center,年)
    ],
    [
      #align(center,月)
    ],
    [
      #align(start + horizon,[#h(5pt)#資格])
    ]
  )
}

#let 以上() = {
  set text(inputFontSize)
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [],
    [],
    [
      #align(end + horizon,[以上#h(2cm)])
    ]
  )
}

// mode: "学歴・職歴" or "資格"
#let 経歴(children,hegithLength: 12.6cm,columns: 0,mode:"") = {
  stack(
    box(
      stroke: (
        bottom: 1.5pt,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: hegithLength,
      width: 100%,
      [
        #grid(
          columns: (1.5cm,0.8cm,1fr),
          [
            #rect(
              stroke: (
                bottom: none,
                top: none,
                left: none,
                right: 0.5pt
              ),
              height: 100%,
              width: 100%,
              [
                #align(center,[年])
              ]
            )
          ],
          [
            #rect(
              stroke: (
                bottom: none,
                top: none,
                left: none,
                right: 0.5pt
              ),
              height: 100%,
              width: 100%,
              [
                #align(center,[月])
              ]
            )
          ],
          [
            #rect(
              width: 100%,
              height: 100%,
              stroke: (
                bottom: none,
                top: none,
                left: none,
                right: none,
              ),
              align(center,[
                #if (mode == "学歴・職歴") {
                  [学歴・職歴(各別にまとめて書く)]
                } else if (mode == "資格") {
                  [免許・資格]
                }]
              )
            )
          ]
        )
        #place(
          start + top,
          dy: 10pt,
          [
            #let n = 0
            #while n < columns {
              [#pad(y: 0.26cm,line(stroke: 0.5pt, length: 100%))]
              n = n + 1
            }
          ]
        )
        #place(
          top + left,
          dy: 0.9cm,
        children
        )
      ]
    ),
  )
}

#let 自由記述欄(description: "", height: 5cm, children) = {
  stack(
    rect(
      stroke: (
        bottom: 1.5pt,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: height,
      width: 100%,
      [
        #description
        #linebreak()
        #set par(justify: true, leading: 0.65em, spacing: 0.7em, first-line-indent: 1em)
        #set text(inputFontSize)
        #children
      ]
    )
  )
}

#let 志望動機(height: 5cm, children) = 自由記述欄(description: "志望の動機", height: height, children)

#let 自己PR(height: 5cm, children) = 自由記述欄(description: "自己PR・その他アピールしたいこと", height: height, children)

#let 事務事項欄(height: 2.2cm, 最寄り駅: "", 扶養家族人数: 0, 配偶者の有無: false, 配偶者の扶養義務: false) = {
  let 有無情報(bool) = {
    let 有りの丸 = if bool { color.black }  else { color.white }
    let 無しの丸 = if bool { color.white }  else { color.black }

    align(center, text(size: nameFontSize)[
      #grid(
        columns: (1fr, 1fr),
        circle(stroke: 有りの丸, inset: 1pt)[
          #set align(center + horizon)
          有
        ],
        circle(stroke: 無しの丸, inset: 1pt)[
          #set align(center + horizon)
          無
        ],
      )
    ])
  }

  stack(
    grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      rect(
        stroke: (bottom: 1.5pt, top: 1.5pt, left: 1.5pt, right: 0.5pt),
        width: 100%,
        height: height,
        [
          #align(center,[最寄り駅])
          #pad(
            y: 0.1cm,
            align(center, text(size: inputFontSize + 4pt)[
              #最寄り駅
            ])
          )
        ]
      ),
      rect(
        stroke: (bottom: 1.5pt, top: 1.5pt, left: none, right: 0.5pt),
        width: 100%,
        height: height,
        [
          #align(center,[扶養家族数(配偶者を除く)])
          #pad(
            y: 0.35cm,
            align(center, text(size: nameFontSize)[
              #扶養家族人数 人
            ])
          )
        ]
      ),
      rect(
        stroke: (bottom: 1.5pt, top: 1.5pt, left: 0.5pt, right: 0.5pt),
        width: 100%,
        height: height,
        [
          #align(center,[配偶者])
          #pad(
            y: 0.1cm,
            有無情報(配偶者の有無)
          )
        ]
      ),
      rect(
        stroke: (bottom: 1.5pt, top: 1.5pt, left: none, right: 1.5pt),
        width: 100%,
        height: height,
        [
          #align(center,[配偶者の扶養義務])
          #pad(
            y: 0.1cm,
            有無情報(配偶者の扶養義務)
          )
        ]
      ),
    ),
  )
}
