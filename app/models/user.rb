class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:validatable
  has_many :groups
  has_many :posts
  has_many :group_relationships
  has_many :participated_groups, :through => :group_relationships, :source => :group
  def is_member_of?(group)
    participated_groups.include?(group)
  end

  def join!(group)
    participated_groups << group

  end

  def quit!(group)
    participated_groups.delete(group)

  end

end
