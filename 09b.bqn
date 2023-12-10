str ← •Import "util/strings.bqn"

lines ← str.ToNums¨ •FLines "input09"

diffs ← (-˜˝˘ 2⊸↕)⍟(↕≠)¨ ⌽¨ lines
•Show +´ (+´ (⊑⌽)¨)¨ diffs
