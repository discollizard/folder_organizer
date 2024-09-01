defmodule FolderOrganizer do
  @moduledoc """
  Documentation for `FolderOrganizer`.
    """

  @is_debug true

 @doc """
  Entry point for the program. Detects the scan type
  then calls the appropriate function
  """
  def scan(args) do
    if length(args) == 0 do
      help()
    else

      try do
        # IO.puts(is_list(args))
        [scanMode, scanArgs, folderToScan] = args
        case scanMode do
          "--extension" -> scan_by_extension(scanArgs, folderToScan)
          "--regex" -> scan_by_regex(scanArgs, folderToScan)
          _  -> error(:invalid_mode)
        end
      catch
        :error -> error(:generic)
      rescue
        MatchError -> error(:few_arguments)
      end
    end
  end

  def scan_by_extension(_scanArgs, _folderToScan) do
    IO.puts("\n scan by extension \n")
  end

  def scan_by_regex(_scanArgs, _folderToScan) do
    IO.puts("\n scan by regex \n")
  end

  #error treatment
  def error(:generic) do
    IO.puts("Incorrect usage. Correct usage is: forg --mode scan_arg folder/to/scan")
    :error
  end

  def error(:few_arguments) do
    IO.puts("There were too few arguments. Correct usage is: forg --mode scan_arg folder/to/scan")
    :error
  end

  def error(:invalid_mode) do
    IO.puts("The selected mode is invalid. The existing modes are: --extension, --regex")
    :error
  end

 @doc """
  Shows command help

  ## Examples

      iex> FolderOrganizer.hello()
      :world

  """
  def help do
    IO.puts("disco's Folder Organizer: scans your files and puts them into the right folder \n
      basic usage: forg --mode scan_arg folder/to/scan
    ")
    :ok
  end
end
