class HomeController < ApplicationController
  def add_new
   @object1 = Contact.new
  end

  def create_new
  @object1 = Contact.create(contact_params)
  unless (@object1.errors.any?)
    flash[:notice] = "Contact has been added"
    redirect_to root_path
  else
    flash[:error] = "Some error"
    render action: 'add_new'
  end
  end

  def edit
   
   @name = String.new
   
  end

  def update
    @record = Contact.find_by_name(params[:name])
     if @record.nil?
      @name = String.new
      render action: 'edit'
      flash[:error] = "Contact not found. Try again"
     end
  end
  def updation
  # render plain: params.inspect
@record = Contact.find_by_id(params[:contact][:id])
@record.name=params[:contact][:name]
@record.email=params[:contact][:email]
@record.mobile_no= params[:contact][:mobile_no]
if (@record.save)
   flash[:notice] = "Updated contact"
   redirect_to root_path
end
render action: 'update'
  end

  def delete
  @name=String.new
  
  end
  def delete_post
   @record = Contact.find_by_name(params[:name])
   unless @record.nil?
     @record.destroy
     flash[:notice] = "Contact has been deleted"
     redirect_to root_path
   else
     flash[:error] = "Contact not found. Try again"
     @name = String.new
     render action: 'delete'
   end
  end

  def search
    search_name = params[:search]
    @record = Contact.find_by_name(search_name)
    if @record.nil?
      flash[:error] = "Contact not found. Try again"
      redirect_to root_path
    end
      
  end

  def contact_params
      params.require(:contact).permit(:name, :email, :mobile_no)
    end
end
