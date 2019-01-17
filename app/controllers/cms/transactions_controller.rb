class Cms::TransactionsController < ApplicationController
    
    def new
        @user = User.find_by_id(current_user.id)
    end

    def create
        @user = User.find_by_id(current_user.id)
        customer = Stripe::Customer.create(
            email: current_user.email,
            source: get_token(params),
            description: [current_user.first_name, current_user.last_name].join('')
        )
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 100 *100,
            currency: 'SEK',
            description: "#{current_user.first_name} #{current_user.last_name} has purchased a monthly subscription"
        )
        if charge[:paid]
            Transaction.new(amount: 100, user_id: current_user.id)
            redirect_to root_path,
            notice: "You have become a subscriber!"
        else
            redirect_to root_path, notice: "Charge declined!"
        end
    end
    private
    def get_token(params)
        Rails.env.test? ? generate_test_token : params['stripeToken']
    end
    def generate_test_token
        StripeMock.create_test_helper.generate_card_token
    end
end
