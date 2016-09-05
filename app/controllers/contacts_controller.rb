class ContactsController < ApplicationController

  def index
    render json: Contact.all
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: 422
    end
  end

  def show
    #Does not produce an error for out of scope contact id
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    #Does not produce an error for out of scope contact id
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: [contact, "Updated!"]
    else
      render json: contact.errors.full_messages, status: 422
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: [contact, "Destroyed!"]
  end



  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
