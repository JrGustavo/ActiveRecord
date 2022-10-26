# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  visible     :boolean
#  duration    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: {maximum: 200, minimum: 2 }

  validate :validate_custome_title

  before_create :send_mail, if :has_description?
  after_update :show_title

  before_save :show_title

  scope :has_duration, ->{where('duration >=?', 0)}
  scope :has_description, ->{where.not('duration >=?', 0)}

  scope :has_description_duration,  -> { has_description.has_duration}


 def has_description?
     !description.nil? && !description.empty?
 end

  private

  def valida_course
    course.nil?
  end

 def send_mail
   puts ">>> Send Mail"
 end

  def send_tilte
    puts ">>> Nosencontramos en el metodo Show Title "
  end

  def validate_custome_title
    errors.add(:title, 'No es posible usar ese titulo.') if title == 'Codigo facilito'
  end
                            end
end

