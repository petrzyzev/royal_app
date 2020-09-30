class HomeController < ApplicationController
  def index
    params.require(:user_id)
    @companies = Company.includes(:tags).eager_load(:contacts)
                        .where('contacts.user_id = ?', params[:user_id])
                        .order('companies.name ASC')
  end
end
