class ContactsController < ApplicationController
  def index
   render :json => Contact.contacts_for_user_id(params[:user_id])
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(user_params)
      render json: contact
    else
      render json: contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  private
  def user_params
   params[:contact].permit(:user_id, :name, :email)
  end
end
