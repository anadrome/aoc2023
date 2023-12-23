lines ← > •FLines "input21"

# Add padding around the map
# adapted from bqncrate entries on appending/prefacing a column/row of 1s
Pad ← {∾⟜('#'¨∘⊏)'#'¨∘⊏⊸∾'#'∾˘𝕩∾˘'#'}

# Run one step.
# 'S' means reachable in exactly this many steps
# (the problem statement uses 'O', but keeping 'S' is slightly simpler).
# Look at 3x3 windows, with a padding of '#' around the map.
# The center element of a window is reachable in exactly this many steps iff:
#   it is a '.' and there's an 'S' above/below/left/right
#   otherwise, '#' and '.' remain unchanged, and 'S' reverts to '.'
Onestep ← {{c ← 1‿1 ⊑ 𝕩
 adjS ← 0< +´⥊ 'S' = ⟨0‿1,1‿0,1‿2,2‿1⟩ ⊑ 𝕩
 {adjS ∧ c='.' ? 'S' ;
  c='S' ? '.' ; c}
}˘˘ 3‿3 ↕ Pad 𝕩}

•Show +´⥊ 'S'= Onestep⍟64 lines

