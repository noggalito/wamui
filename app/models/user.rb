class User < ActiveRecord::Base
  devise :trackable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :orders, ->{ order(id: :asc) }

  serialize :info, JSON
  serialize :credentials, JSON

  def to_s
    short_name
  end

  def short_name
    @short_name ||= name.split(" ").first(2).join(" ")
  end

  def self.from_omniauth(auth)
    where(
      uid: auth.uid,
      provider: auth.provider
    ).first_or_create.tap do |user|
      user.name = auth.info.name
      user.info = auth.info
      user.credentials = auth.credentials
      user.save(validate: false)
    end
  end
end
