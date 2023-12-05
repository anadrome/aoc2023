str ← •Import "util/strings.bqn"

Chop ← (1⊸+⊐⟜⟨':'⟩)⊸↓                              # chop off the "Card n:" prefix
lines ← Chop¨ •FLines "input04"

winning ← str.ToNats¨ ⊐⟜⟨'|'⟩⊸↑¨ lines
ours    ← str.ToNats¨ ⊐⟜⟨'|'⟩⊸↓¨ lines
n       ← ours (≠∊/⊣)¨ winning

# Score per card: 0 if no winning numbers, 2⋆(n-1) otherwise
# Total score: sum of card scores
•Show +´ ⌊2⋆(n-1)

# TODO: Part 2
