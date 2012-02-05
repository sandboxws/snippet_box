class Snippet < ActiveRecord::Base
  def self.LANGS
    { 'Plain' => :plain, 'Ruby' => :ruby, 'JavaScript' => :javascript }
  end

  validates :content, :presence => true

  after_create :set_hash_code
  def set_hash_code
    self.hash_code = (self.id * 22411101310).alphadecimal
    self.save
  end

  def share_url
    "http://#{AppBox.host}/#{self.hash_code}"
  end
end
