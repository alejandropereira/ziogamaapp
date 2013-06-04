class ProspectsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource

  # GET /prospects
  # GET /prospects.json
  def index

    # @day_goal = current_user.prospects.today
    # @week_goal = current_user.prospects.this_week

    # @order = current_user.prospects.group("date(created_at)").select("created_at, count(created_at) as suma")


    if current_user.admin? || current_user.sales_manager?
      @prospects = Prospect.all
    else
      @prospects = current_user.prospects.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prospects }
    end
  end

  # GET /prospects/1
  # GET /prospects/1.json
  def show
    @prospect = Prospect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prospect }
    end
  end

  # GET /prospects/new
  # GET /prospects/new.json
  def new
    @prospect = current_user.prospects.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prospect }
    end
  end

  # GET /prospects/1/edit
  def edit
    @prospect = Prospect.find(params[:id])
  end

  # POST /prospects
  # POST /prospects.json
  def create
    @prospect = current_user.prospects.new(params[:prospect])

    respond_to do |format|
      if @prospect.save
        format.html { redirect_to prospects_path , notice: 'Prospect was successfully created.' }
        format.json { render json: @prospect, status: :created, location: @prospect }
      else
        format.html { render action: "new" }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prospects/1
  # PUT /prospects/1.json
  def update
    @prospect = Prospect.find(params[:id])

    respond_to do |format|
      if @prospect.update_attributes(params[:prospect])
        format.html { redirect_to @prospect, notice: 'Prospect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospects/1
  # DELETE /prospects/1.json
  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy

    respond_to do |format|
      format.html { redirect_to prospects_url }
      format.json { head :no_content }
    end
  end
end
