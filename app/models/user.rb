# frozen_string_literal: true

class User < ApplicationRecord
  enum permission_level: [ :user, :manager, :admin ]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :jogging_time, dependent: :destroy
end
