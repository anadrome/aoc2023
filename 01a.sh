digits=$(<input01 tr -d -c 0-9'\n')
sum=$(paste -d "" <(echo "$digits" | cut -c1)\
                  <(echo "$digits" | rev | cut -c1)\
      | paste -s -d "+" | bc)
echo $sum
