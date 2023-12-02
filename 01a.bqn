input ← •FLines "input01"
digits ← ≤⟜9⊸/¨ (input-'0')
sum ← +´(¯1⊑¨digits)+10×⊑¨digits
•Show sum
