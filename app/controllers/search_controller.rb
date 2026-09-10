class SearchController < ApplicationController
  def index
    q = params[:q].to_s.strip

    @results = if q.present?
      Patient.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone ILIKE ?", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%")
             .or(Doctor.where("name ILIKE ? OR specialty ILIKE ? OR email ILIKE ?", "%#{q}%", "%#{q}%", "%#{q}%"))
             .limit(10)
    else
      []
    end
  end
end
