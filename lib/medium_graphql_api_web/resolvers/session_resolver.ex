defmodule MediumGraphqlApiWeb.Resolvers.SessionResolver do
  alias MediumGraphqlApi.{Accounts, Guardian}
  def login_user(_,%{input: input},_) do
    # Check if the user is in the database
    # if the user is registered, return a token
    # and return the user
    with {:ok, user} <- Accounts.Session.authenticate(input),
     {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
