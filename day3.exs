input = 1024
result = input - :math.pow(:math.sqrt(input) |> round, 2) |> abs
IO.puts "Steps: #{result |> round}"
