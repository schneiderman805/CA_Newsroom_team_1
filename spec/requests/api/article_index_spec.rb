require 'rails_helper'

RSpec.describe 'Article index', type: :request do
  describe 'GET /api/articles ' do
    context 'basic specs' do
      let!(:published_articles) { 5.times { create(:article, published: true) } }
      let!(:unpublished_articles) { 5.times { create(:article, published: false) } }

      before do
        get '/api/articles'
			end
			
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

    	it 'returns 5 articles' do
        expect(JSON.parse(response.body)['articles'].count).to eq 5
      end
    end

    context 'detailed spec to test associations etc' do
      let(:user) { create(:user, email: 'journalist@mail.com') }
      let!(:published_article) { create(:article, title: 'My first article', user: user, published: true )}
      let!(:unpublished_article) { create(:article, title: 'My second article', user: user, published: false  )}


      before do
        get '/api/articles'
      end

      it 'includes info about user' do
        expected_email = JSON.parse(response.body)['articles'][0]['user']['email']
        expect(expected_email).to eq 'journalist@mail.com' 
      end

      it 'includes info about image' do
        expected_url = JSON.parse(response.body)['articles'][0]['image']
        expect(expected_url).to match(/attachment.png/)
      end
    end
  end
end