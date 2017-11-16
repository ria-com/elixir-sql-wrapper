# Ria.SQL

```elixir
alias Ria.SQL

# ...

SQL.query("SELECT current_date()")
# [%{"current_date()" => {2017, 11, 16}}]
SQL.query("SELECT ? AS one", [1])
# [%{"one" => 1}]
SQL.query(MyProject.Repo, "SELECT ? AS two", [2])
# [%{"two" => 2}]
```

## Installation

```elixir
def deps do
  [{:ria_sql, git: "https://github.com/ria-com/elixir-sql-wrapper.git"}]
end
```

## Configuration

```elixir
# config/dev.exs, config/prod.exs, config/test.exs
config :mariaex,
  default_repo: MyProject.Repo
```
