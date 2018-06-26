# IEx.configure colors: [enabled: true]
# IEx.configure colors: [eval_result: [:cyan, :bright]]
Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
  history_size: 50,
  width: 100,
  colors: [
    eval_result: [:green, :bright] ,
    eval_error: [[:red, :bright, "\n▶▶▶\n"]],
    eval_info: [:yellow, :bright ],
  ],
  default_prompt: [
    "\e[G", # cursor ⇒ column 1
    :green, "%prefix", :white, "|", :green, "%counter", " ", :blue, "▶", :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string
)
