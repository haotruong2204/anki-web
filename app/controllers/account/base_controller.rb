# frozen_string_literal: true

class Account::BaseController < ApplicationController
  before_action :authenticate_account_account!
end
