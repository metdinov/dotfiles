timestamp = fn ->
  {_date, {hour, minute, _second}} = :calendar.local_time
  [hour, minute]
  |> Enum.map(&(String.pad_leading(Integer.to_string(&1), 2, "0")))
  |> Enum.join(":")
end

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: IO.ANSI.color(140),
      boolean: :red,
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
  ],
  default_prompt:
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "[#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] #{IO.ANSI.yellow}λ ⇒ #{IO.ANSI.reset}",
  alive_prompt:
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "(#{IO.ANSI.yellow}%node#{IO.ANSI.reset}) " <>
    "[#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] #{IO.ANSI.yellow}λ ⇒#{IO.ANSI.reset}",
  history_size: 50,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: 80
  ],
  width: 80
)

defmodule :_toolbox do
  @doc "Adds a (nested) key inside a configuration"
  def update_config(app, key, sub_key, value) do
    config =
      app
      |> Application.get_env(key)
      |> Keyword.put(sub_key, value)

    Application.put_env(app, key, config)
  end

  defdelegate exit, to: System, as: :halt

  @doc "Disable logger"
  def logoff do
    Logger.configure(level: :none)
  end
end

import :_toolbox
