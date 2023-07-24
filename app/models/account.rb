# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  address                :string(255)      not null
#  birth_of_date          :datetime         not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string(255)      not null
#  full_name              :string(255)      not null
#  last_name              :string(255)      not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locked_at              :datetime
#  phone_number           :bigint           not null
#  photo_url              :text(65535)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :integer          default("user"), not null
#  sign_in_count          :integer          default(0), not null
#  status                 :integer          default("active"), not null
#  unconfirmed_email      :string(255)
#  unlock_token           :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_accounts_on_confirmation_token    (confirmation_token) UNIQUE
#  index_accounts_on_email                 (email) UNIQUE
#  index_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#  index_accounts_on_unlock_token          (unlock_token) UNIQUE
#
class Account < ApplicationRecord
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :confirmable, :lockable

  validates :first_name, :last_name, :email, :birth_of_date, :address, :phone_number, presence: true
  validates :phone_number,
    format: { with: /(\+84|0[3|5789])+([0-9]{8,9})\b/, message: "Không đúng định dạng số điện thoại Việt Nam" }

  enum role: { user: 1, admin: 2 }
  enum status: { active: 1, inactive: 2 }

  before_save :trigger_full_name

  private

  def trigger_full_name
    self.full_name = "#{first_name}#{last_name}"
  end
end
