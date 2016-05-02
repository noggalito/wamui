class User < ActiveRecord::Base
  devise :trackable,
         :omniauthable, omniauth_providers: [:facebook]

  def to_s
    name
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
