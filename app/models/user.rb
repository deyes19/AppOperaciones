class User < ApplicationRecord
<<<<<<< HEAD
=======
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    name: 'A',
    email: 'B'
}
>>>>>>> commit-huerfano
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  enum role: [:admin, :user]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
end

=======
  belongs_to :role
  has_many :actives, dependent: :destroy
  validates :name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end
  def admin?
    role.name == 'Admin'
  end
  def regular?
    role.name == 'Regular'
  end
  
end
>>>>>>> commit-huerfano
