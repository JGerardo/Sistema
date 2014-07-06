class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    # asociar un nuevo cliente
    @sale.client = Client.new
    
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    #strong parameters >> http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html
     #se habilito strong parameters en el modelo
    @sale = Sale.new(sale_params)

    client = Client.new(client_params)
    @sale.fecha = Time.new #ponemos la fecha del sistema
    #al recibir los datos, comprobar si existe el cliente, entonces se pueden actualizar sus datos

    # si no existe el cliente, registrar uno nuevo
    if @sale.client_id.nil?
      @sale.client = client
    else
      @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
      @sale.client.direccion = client.direccion
      @sale.client.telefono = client.telefono
      @sale.client.e_mail = client.e_mail
      @sale.client.facebook = client.facebook
      @sale.client.twitter = client.twitter
      @sale.client.liked_in = client.liked_in

    end

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:client_id, :fecha)
    end
    def client_params
      params.require(:client).permit(:nombre, :direccion, :telefono, :e_mail, :facebook, :twitter, :liked_in)
    end

        def set_sale_detail
      @sale_detail = SaleDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_detail_params
      params.require(:sale_detail).permit(:sale_id, :book_id, :cantidad, :precio, :descuento, :total)
    end
end
