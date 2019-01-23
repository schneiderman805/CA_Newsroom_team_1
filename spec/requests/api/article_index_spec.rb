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
      let(:category) { create(:category, name: 'Sports') }
      let!(:published_article) { create(:article, title: 'My first article', user: user, category: category, published: true )}
      let!(:unpublished_article) { create(:article, title: 'My second article', user: user, category: category, published: false  )}

      before do
        get '/api/articles'
      end

      it 'includes info about user' do
        expected_email = JSON.parse(response.body)['articles'][0]['user']['email']
        expect(expected_email).to eq 'journalist@mail.com' 
      end

      it 'includes info about title' do
        expected_title = JSON.parse(response.body)['articles'][0]['title']
        expect(expected_title).to eq 'My first article' 
      end

      it 'includes info about category' do
        expected_category = JSON.parse(response.body)['articles'][0]['category']['name']
        expect(expected_category).to eq 'Sports' 
      end
    end
  end
end