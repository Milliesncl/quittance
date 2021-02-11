class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      redirect_to tenants_path
    else
      render :new
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    @tenant = Tenant.find(params[:id])
    if @tenant.update(tenant_params)
      redirect_to tenants_path
    else
      render :edit
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    if @tenant.destroy
      redirect_to tenants_path
    else
      render :delete
    end
  end

  private
    def tenants_params
      params.require(:tenant).permit(:name, :address, :rent, :charges)
    end
  end
