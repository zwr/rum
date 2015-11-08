class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    if current_user.superadmin?
      @organizations = Organization.all
    else
      @organizations = current_user.organizations
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    fail Rck::NotSuperAdminError unless current_user.superadmin?
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
    fail NotSuperAdminError unless current_user.administers? @organization
  end

  # POST /organizations
  # POST /organizations.json
  def create
    fail NotSuperAdminError unless current_user.superadmin?
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    fail NotSuperAdminError unless current_user.administers? @organization
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    fail NotSuperAdminError unless current_user.administers? @organization
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
    fail ActionController::RoutingError, 'Not Found' unless current_user.superadmin? ||
                                                            @organization.users.include?(current_user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name)
  end
end
