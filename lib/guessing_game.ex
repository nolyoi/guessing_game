defmodule GuessingGame do
  # Guess between range of numbers.
  # Tell user guess.

  def start do
    range = IO.gets("What range is your number in(ex. 1-100)? \n")
            |> String.trim
            |> String.split("-")
    low = List.first(range)
    high = List.last(range)

    guess(String.to_integer(low), String.to_integer(high))
  end

  def guess(low, high) do
    answer = IO.gets("Is your number #{mid(low, high)}? \n")

    case String.trim(answer) do
      "bigger" -> bigger(low, high)
      "smaller" -> smaller(low, high)
      "yes" -> "I'm always right!"
      _ -> IO.puts ~s(Please type "bigger", "smaller", or "yes".)
           guess(low, high)
    end
  end

  def mid(low, high) do
    div(high + low, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end

GuessingGame.start
