str ← •Import "util/strings.bqn"

Chop ← (1⊸+⊐⟜⟨':'⟩)⊸↓                   # chop off the "Card n:" prefix
lines ← Chop¨ •FLines "input04"

winning ← str.ToNats¨ ⊐⟜⟨'|'⟩⊸↑¨ lines
ours    ← str.ToNats¨ ⊐⟜⟨'|'⟩⊸↓¨ lines
n       ← ours (≠∊/⊣)¨ winning          # cardinality of intersection

# Part 1
# Score per card: 0 if no winning numbers, 2⋆(n-1) otherwise
# Total score: sum of card scores
•Show +´ ⌊2⋆(n-1)

# Part 2
# Get one extra copy of the following n cards for n wins
# Result: total number of cards
extra_mask ← (⥊⟜⟨0⟩¨ (1+↕≠n)) »¨ ((≠n)↑⥊⟜⟨1⟩)¨ n
•Show +´ 1+ {𝕩+𝕨×1+(¯1+⊑𝕨⊐⟨1⟩)⊑𝕩}´⌽ extra_mask
