class UsersController < ApplicationController
  autocomplete :user, :name,:full => true

  def search

  end
end
