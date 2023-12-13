str ← •Import "util/strings.bqn"

lines ← •FLines "input12"

# rename: .=0, #=1, ?=2
records ← ({𝕩='.'?0;𝕩='#'?1;2}¨ ⊐⟜⟨' '⟩⊸↑)¨ lines
counts ← (str.ToNats ⊐⟜⟨' '⟩⊸↓)¨ lines

# from bqncrate
Binary ← 2{⌽𝕗|⌊∘÷⟜𝕗⍟(↕1+·⌊𝕗⋆⁼1⌈⊢)} # natural number to binary
Onelen ← {-˜˝˘∘‿2⥊/0(∾≠∾˜) 𝕩}      # counts of consecutive ones

ns ← (+´ 2⊸=)¨ records             # numbers of ?'s
subs ← {((-𝕩)↑Binary)¨ ↕2⋆𝕩}¨ ns   # all possible substitutions

# Insert a substitution (𝕩) into record (𝕨)
# TODO: messy
Possible ← {𝕨 {𝕨=2 ? 𝕩 ; 𝕨}¨ (≠𝕨)↑/⁼ ≥⟜0⊸/ 𝕩 {𝕨=0 ? -1 ; 𝕩}¨ / 𝕨=2}

# Check each possible substitution against the correct counts
correct ← counts {𝕨⊸≡¨ 𝕩}¨ Onelen¨¨ records {𝕨⊸Possible¨ 𝕩}¨ subs

# Result: Number of matching substitutions
•Show +´∾ correct
