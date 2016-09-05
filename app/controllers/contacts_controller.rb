class ContactsController < ApplicationController

  def index
    # IS THIS CORRECT???
    user_contact = Contact.find_by(user_id: params[:user_id])
    render json: ["#{params[:user_id]}'s contacts",
                  user_contact,
                  "Contacts shared with #{params[:user_id]}:",
                  user_contact.shared_users]
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
    begin
      contact = Contact.find(params[:id])
      render json: contact
    rescue ActiveRecord::RecordNotFound
      render json: ['Contact Not Found!'], status: 404
    end
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
