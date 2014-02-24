class DonationsController < ApplicationController

  def physical
    @donation ||= Donation.new
    @donation.detail ||= Physical.new
  end

  def voucher
    @donation ||= Donation.new
    @donation.detail ||= Voucher.new
  end

  def experience
    @donation ||= Donation.new
    @donation.detail ||= Experience.new
  end

  def create
    klass = params[:detail_class].camelize.constantize
    detail = klass.new(params[:donation].delete(:detail))
    @donation = Donation.new(params[:donation])
    @donation.detail = detail
    @donation.user = current_user
    
    if @donation.save
      redirect_to root_path
    else
      render params[:detail_class]
    end
  end

  def update
    @donation = Donation.find(params[:id])
    detail = params[:donation].delete(:detail)
    @donation.update_attributes(params[:donation])
    @donation.detail.update_attributes(detail)
    
    if @donation.save
      redirect_to root_path
    else
      render params[:detail_class]
    end

  end

  def show
    @donation = Donation.find(params[:id])
    type = @donation.detail.class.name.downcase.to_sym

    render type
  end

  def destroy
    donation = Donation.find(params[:id])
    donation.destroy
    
    redirect_to root_path
  end
end
