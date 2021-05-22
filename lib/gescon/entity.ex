defmodule Gescon.Entity do
  @moduledoc """
  The Entity context.
  """

  import Ecto.Query, warn: false
  alias Gescon.Repo

  alias Gescon.Entity.Administrator

  @doc """
  Returns the list of administrators.

  ## Examples

      iex> list_administrators()
      [%Administrator{}, ...]

  """
  def list_administrators do
    Repo.all(Administrator)
  end

  @doc """
  Gets a single administrator.

  Raises `Ecto.NoResultsError` if the Administrator does not exist.

  ## Examples

      iex> get_administrator!(123)
      %Administrator{}

      iex> get_administrator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_administrator!(id), do: Repo.get!(Administrator, id)

  @doc """
  Creates a administrator.

  ## Examples

      iex> create_administrator(%{field: value})
      {:ok, %Administrator{}}

      iex> create_administrator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_administrator(attrs \\ %{}) do
    %Administrator{}
    |> Administrator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a administrator.

  ## Examples

      iex> update_administrator(administrator, %{field: new_value})
      {:ok, %Administrator{}}

      iex> update_administrator(administrator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_administrator(%Administrator{} = administrator, attrs) do
    administrator
    |> Administrator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a administrator.

  ## Examples

      iex> delete_administrator(administrator)
      {:ok, %Administrator{}}

      iex> delete_administrator(administrator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_administrator(%Administrator{} = administrator) do
    Repo.delete(administrator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking administrator changes.

  ## Examples

      iex> change_administrator(administrator)
      %Ecto.Changeset{data: %Administrator{}}

  """
  def change_administrator(%Administrator{} = administrator, attrs \\ %{}) do
    Administrator.changeset(administrator, attrs)
  end
end
