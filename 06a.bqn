str ← •Import "util/strings.bqn"

⟨ts,ds⟩ ← str.ToNats¨ •FLines "input06"

wins ← ds <¨ {𝕩×(¯1+≠𝕩)-𝕩}¨ ↕¨ 1+ts
•Show ×´ +´¨ wins
