str ← •Import "util/strings.bqn"

digit_subs ← ⟨⟨"one","two","three","four","five","six","seven","eight","nine"⟩
              ⟨  "1",  "2",    "3",   "4",   "5",  "6",    "7",    "8",   "9"⟩⟩

input ← •FLines "input01"

# My first attempt was to just add a line to substitute the strings:
#   input_subbed ← (digit_subs ⊸ str.Replaceall)¨ input
#   digits ← ≤⟜9⊸/¨ (inputsubbed-'0')
#   sum ← +´(¯1⊑¨digits)+10×⊑¨digits
# (The last 2 lines are the same as from 01a.bqn).

# But this produces the wrong result, because it seems we are supposed to
# interpret overlapping matches differently depending on where in the string we
# are: "twonetwone" should become 21. The first "twone" becomes a 2 (because
# "two" is syntactically the first number in the string) but the second becomes
# a 1 (because "one" is syntactically the last number in the string). Tricky.

# New strategy is to do everything once in the forward direction and then in
# reverse on the reversed strings.

first_dig ← ⊑¨ ≤⟜9⊸/¨ ((digit_subs⊸str.Replaceall)¨ input) - '0'
last_dig ← ⊑¨ ≤⟜9⊸/¨ (((⌽¨¨digit_subs)⊸str.Replaceall)¨ ⌽¨input) - '0'
sum ← +´(last_dig + 10×first_dig)

•Show sum
