class User < ApplicationRecord

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: [:unassigned, :employee, :company, :admin]

  has_one :employee, :dependent => :destroy
  has_one :company, :dependent => :destroy
  has_one :manager, :dependent => :destroy



  def set_default_role
    self.role ||= :unassigned
  end
end
