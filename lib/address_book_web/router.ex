defmodule AddressBookWeb.Router do
  use AddressBookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AddressBookWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/address", AddressController, except: [:new, :edit]
  end

  if Application.compile_env(:address_book, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: AddressBookWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
