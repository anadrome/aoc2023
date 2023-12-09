lines ← •FLines "input08"

inst  ← ⊑ lines
graph ← 2↓lines

nodes ← 3⊸↑¨ graph
ls    ← (3⊸↑∘(7⊸↓))¨ graph
rs    ← (3⊸↑∘(12⊸↓))¨ graph

node ← "AAA"
n    ← ⊑ nodes ⊐ <node
i    ← 0
Next ← {𝕩='L' ? n ⊑ ls ; n ⊑ rs}
{𝕤
 node ↩ Next ((≠inst)|i) ⊑ inst
 n    ↩ ⊑ nodes ⊐ <node
 i    ↩ i+1
} •_while_ {𝕤, node≢"ZZZ"} @
•Show i
