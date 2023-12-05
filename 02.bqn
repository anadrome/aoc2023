str ← •Import "util/strings.bqn"

Chop ← (1⊸+⊐⟜⟨':'⟩)⊸↓                              # chop off the "Game n:" prefix
lines ← Chop¨ •FLines "input02"

Counts ← {str.ToNats˘ (3 ⌽ 𝕩 ⍷ 𝕨) / (2-≠𝕩)↓2↕𝕨}    # extract array of counts for a given color from a single game
max ← ⌈´∘⥊¨ lines Counts⌜ ⟨"red", "green", "blue"⟩ # max r/g/b count per game

# Part 1: sum of indices (1-indexed) of games that pass a possibility test
threshold ← ⟨12, 13, 14⟩
passed ← ∧´˘(threshold⊸≥˘ max)
•Show +´ /⟜(1⊸+∘↕≠) passed 

# Part 2: sum of the products of each game's max r/g/b
•Show +´×´˘max
