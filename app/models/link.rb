class Link < ActiveRecord::Base

  has_many :visits
  has_one :url

  DIRTY_WORDS = ["donald", "trump"]

  def self.shorten(original, custom=nil)
    url = Url.first(:original => original)
    return url.link if url
    link = nil
    if custom
      raise 'Someone has already taken this custom URL, sorry' unless
   Link.first(:identifier => custom).nil?
      raise 'This custom URL is not allowed because of profanity' if
   DIRTY_WORDS.include?(custom)
      transaction do |txn|
        link = Link.new(:custom => custom)
        linl.url = Url.create(:original => original)
        link.save
      end
    else
      transaction do |txn|
        link = create_link(original)
      end
    end
    return link
  end          

  def self.create_link(original)
    url = Url.create(:original => original)
    if Link.first(:identifier => url.id.to_s(36)).nil? or !DIRTY_WORDS.include?url.id.to_s(36)
      link.url = url
      link.save
      return link
    else 
      create_link(original)
    end 
  end      

  




end  