str ← •Import "util/strings.bqn"

# from bqncrate
_ReplaceElems_ ← {(𝕘⊏˜𝕗⊸⊐)⌾((𝕩∊𝕗)/○⥊⊢)𝕩}

lines ← •FLines "input07"

facecards ← ⟨'T', 'J', 'Q', 'K', 'A'⟩
facevals  ← ⟨ 10,  11,  12,  13,  14⟩

hands ← ((facecards _ReplaceElems_ (facevals+'0'))¨ 5↑¨ lines) - '0'
bets  ← (⊑ (str.ToNats 6⊸↓))¨ lines

matches ← (2↑(∨ (/⁼⊐)))¨ hands
ranks ← (⍋⍋ matches ∾¨ hands) + 1

•Show +´ bets ×¨ ranks
