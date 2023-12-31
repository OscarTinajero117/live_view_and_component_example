defmodule Organization.Word do
  defstruct [:word, :first_letter, :size, :histogram]

  def new(word) do
    word = String.trim(word)

    %__MODULE__{
      word: word,
      first_letter: String.first(word),
      size: String.length(word),
      histogram: histogram(word)
    }
  end

  defp histogram(word) do
    word
    |> String.graphemes()
    |> Enum.frequencies()
  end
end
