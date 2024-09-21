defmodule FolderOrganizerTest do
  use ExUnit.Case

  doctest FolderOrganizer

  test "displays help" do
    assert FolderOrganizer.scan([]) == :help
  end

  test "displays invalid mode error" do
    assert FolderOrganizer.scan(['aaa', 'abbbb', 'ccc']) == :error_invalid_mode
  end

  test "displays few arguments error" do
    assert FolderOrganizer.scan(['aaa']) == :error_few_arguments
  end

  test "scan by single extension pass" do
    assert FolderOrganizer.scan(['--extension', 'exe', './subjects']) == :error_few_arguments
  end
end
