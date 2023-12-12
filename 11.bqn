map ← >•FLines "input11"

# Double the blank rows and columns
map (1⊸+ ∘ =⟜0 ∘ (+˝) ∘ =⟜'#')⊸(/⎉1)↩
map (1⊸+ ∘ =⟜0 ∘ (+˝⎉1) ∘ =⟜'#')⊸/↩

# indices of galaxies
xs ← ∾ /¨ <˘  '#'=map
ys ← ∾ /¨ <˘ ⍉'#'=map
coords ← xs∾¨ys

# pairwise manhattan distances (sum and divide by 2, since we double-count)
Mdist ← {(1⊑𝕩) (+´|∘-) (⊑𝕩)}        # adapted from bqncrate
•Show 2÷˜ +´⥊ Mdist¨ coords ⋈⌜ coords
