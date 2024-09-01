defmodule Mix.Tasks.RunWithArgs do
  use Mix.Task

  @shortdoc "Runs the application with command-line arguments"
  def run(args) do
    IO.inspect(args, label: "Folder organizer arguments: ")
    Application.put_env(:elixir, :argv, args)

    FolderOrganizer.scan(args)
  end

end
