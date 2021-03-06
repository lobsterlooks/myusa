class Api::V1::NotificationsController < Api::ApiController
  doorkeeper_for :create, scopes: ['notifications']

  def create
    @notification = current_resource_owner.notifications.build(notification_params)
    @notification.received_at = Time.now
    @notification.authorization = doorkeeper_token.authorization
    if @notification.save
      render :json => @notification, :status => 200
    else
      render :json => {:message => @notification.errors}, :status => 400
    end
  end

  protected

  def resource
    @notification
  end

  def notification_params
    params.require(:notification).permit(:body, :subject)
  end

end
