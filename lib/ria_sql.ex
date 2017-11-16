defmodule Ria.SQL do
  @moduledoc """
  Documentation for RiaSql.
  """
  def query(sql), do: query(Application.get_env(:mariaex, :default_repo), sql)
	def query(repo, sql) when is_binary(sql), do: query(repo, sql, [])
	def query(sql, params) when is_list(params), do: query(Application.get_env(:mariaex, :default_repo), sql, params)
	def query(repo, sql, params) do
	  try do
		 case Ecto.Adapters.SQL.query!(repo,
        sql
        |> String.split("\n")
        |> Enum.map(fn(row) -> String.strip(row) end)
        |> Enum.join("\n"),
        params
     ) do
     %{columns: [], rows: nil, last_insert_id: last_insert_id, num_rows: num_rows} -> %{last_insert_id: last_insert_id, num_rows: num_rows}
     %{columns: [], rows: nil, last_insert_id: last_insert_id} -> %{last_insert_id: last_insert_id}
     %{columns: columns, rows: rows} ->
        case rows do
           nil -> nil
           _ -> Enum.map(rows, fn(row) ->
              columns
              |> Enum.zip(row)
              |> Map.new
           end)
        end
     end
    rescue
      _ -> nil
    end
  end
end