class ItemOptionsController < ApplicationController
  layout 'main'
  # GET /item_options
  # GET /item_options.xml
  def index
    @item_options = ItemOption.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_options }
    end
  end

  # GET /item_options/1
  # GET /item_options/1.xml
  def show
    @item_option = ItemOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_option }
    end
  end

  # GET /item_options/new
  # GET /item_options/new.xml
  def new
    @item_option = ItemOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_option }
    end
  end

  # GET /item_options/1/edit
  def edit
    @item_option = ItemOption.find(params[:id])
  end

  # POST /item_options
  # POST /item_options.xml
  def create
    @item_option = ItemOption.new(params[:item_option])

    respond_to do |format|
      if @item_option.save
        flash[:notice] = 'ItemOption was successfully created.'
        format.html { redirect_to(@item_option) }
        format.xml  { render :xml => @item_option, :status => :created, :location => @item_option }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_options/1
  # PUT /item_options/1.xml
  def update
    @item_option = ItemOption.find(params[:id])

    respond_to do |format|
      if @item_option.update_attributes(params[:item_option])
        flash[:notice] = 'ItemOption was successfully updated.'
        format.html { redirect_to(@item_option) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_options/1
  # DELETE /item_options/1.xml
  def destroy
    @item_option = ItemOption.find(params[:id])
    @item_option.destroy

    respond_to do |format|
      format.html { redirect_to(item_options_url) }
      format.xml  { head :ok }
    end
  end
end
