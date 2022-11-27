# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Renderer, type: :controller do
  controller(ApplicationController) do
    include Renderer

    # ...

    def create
      user = User.create(user_params)
      render_errors(user.errors)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end

  # ...

  describe 'POST create' do
    it 'renders resource errors with render_errors method' do
      post :create, params: { user: { email: nil, password: nil } }

      error_fields = {
        'email' => ['can\'t be blank'],
        'password' => ['can\'t be blank']
      }

      expect(response.status).to eq(422)
      expect(load_body(response)).to eq(error_fields)
    end
  end
end
