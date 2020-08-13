class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: [:unassigned, :employee, :company, :admin]

  has_one :employee, :dependent => :destroy



  def set_default_role
    self.role ||= :unassigned
  end
end
