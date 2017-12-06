input = 325489
result = input - :math.pow(:math.sqrt(input) |> round, 2)
IO.puts "Steps: #{result |> round}"
