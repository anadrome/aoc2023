# TODO: This 'direct' implementation is infeasibly slow, but left here for
# reference.
lines ← •FLines "input08"

inst  ← ⊑ lines
graph ← 2↓lines

nodes ← 3⊸↑¨ graph
ls    ← (3⊸↑∘(7⊸↓))¨ graph
rs    ← (3⊸↑∘(12⊸↓))¨ graph

node ← ((=⟜'A')∘⊑∘⌽)¨⊸/ nodes
n    ← nodes ⊐ node
i    ← 0
Next ← {𝕩='L' ? n ⊏ ls ; n ⊏ rs}
{𝕤
 node ↩ Next ((≠inst)|i) ⊑ inst
 n    ↩ nodes ⊐ node
 i 1⊸+↩ i
} •_while_ {𝕤, (≠node) > +´ 'Z'= ⊑∘⌽¨ node} @
•Show i
