class ItemsController < ApplicationController
  layout 'main'
  # GET /items
  # GET /items.xml
  def index
    @items = Item.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    @image_i = 0

    respond_to do |format|
      if Category.find(:all).length == 0
        flash[:notice] = "Please Create a Category First."
        format.html { redirect_to( :controller => 'categories', :action => 'new') }
        format.xml  { render :xml => @item }
      else
        format.html # new.html.erb
        format.xml  { render :xml => @item }
      end
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @item.price = @item.price.to_precision
    
    respond_to do |format|
      if @item.save
        a = ItemImage.create({:uploaded_data => params[:item_images][params[:default_image].to_i], :item_id => @item.id})
        logger.info a.id
        @item.default_image_id = a.id
        @item.save
        params[:item_images].delete_at(params[:default_image].to_i)
        @image = ItemImage.new
        params[:item_images] ||= []
        params[:item_images].each do |file|
          @image = ItemImage.create({:uploaded_data => file, :item_id => @item.id}) unless file == ""
        end
        params[:item_options].each do |option|
          ItemOption.create :item_id => @item.id, :name => option["name"], :price => option["price"]
        end
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])
    params[:item]['price'] = params[:item]['price'].to_f.to_precision
    
    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_to_cart
    @item = Item.find(params[:id])
    @cart = session["cart"]
    @cart.items << @item
    @cart.save
    render :action => 'add_to_cart.rjs'
  end
  
  def remove_from_cart
    @item = Item.find(params[:id])
    @cart = session["cart"]
    @cart.items.delete(@item)
    @cart.save
    render :action => 'remove_from_cart.rjs'
  end
    
end
