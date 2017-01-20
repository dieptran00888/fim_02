class AlbumMailer < ApplicationMailer
  def notify_mail album
    @user = User.all
    mail to: @user.email, subject: t(".mailler_song")
  end
end
