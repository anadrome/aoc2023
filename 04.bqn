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

# Note on why the dodgy indexing in Part 2 produces the right result.
# When we're on card n, we try to get the nth value of 𝕩 using the expression:
#     (¯1+⊑𝕨⊐⟨1⟩)⊑𝕩
# For winning cards, this works.
# For non-winning cards, the search for a 1 element fails, and the expression
# pulls out the last element of 𝕩 instead of the nth, which is not right. But,
# that value then gets multiplied by 𝕨, which for non-winning cards is the
# all-zero list, so it doesn't matter.
# Why are we doing this nonsense in the first place? To get the 'n' for which
# card n we're on from the data in extra_mask, without having to thread through
# another list containing indices. There is probably some more elegant way to
# do this.
