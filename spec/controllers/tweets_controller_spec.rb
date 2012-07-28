require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TweetsController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # Tweet. As you add validations to Tweet, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {content: 'abcdefg'}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TweetsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    before do
      @tweet = Tweet.create! valid_attributes
    end

    it "assigns all tweets as @tweets" do
      get :index, {format: "json"}, valid_session
      assigns(:tweets).should eq([@tweet])
      JSON.load(response.body).should be_an(Array)
      JSON.load(response.body).first.keys.sort.should == ["content", "created_at", "id", "updated_at"]
      JSON.load(response.body).first["content"].should be_a(String)
      JSON.load(response.body).first["created_at"].should be_a(String)
      JSON.load(response.body).first["id"].should be_a(Fixnum)
      JSON.load(response.body).first["updated_at"].should be_a(String)
    end
  end

  describe "GET show" do
    before do
      @tweet = Tweet.create! valid_attributes
    end

    it "assigns the requested tweet as @tweet" do
      get :show, {id: @tweet, format: "json"}, valid_session
      assigns(:tweet).should eq(@tweet)
      JSON.load(response.body).should be_a(Hash)
      JSON.load(response.body).keys.sort.should == ["content", "created_at", "id", "updated_at"]
      JSON.load(response.body)["content"].should be_a(String)
      JSON.load(response.body)["created_at"].should be_a(String)
      JSON.load(response.body)["id"].should be_a(Fixnum)
      JSON.load(response.body)["updated_at"].should be_a(String)
    end
  end

  describe "POST create" do
    let(:tweet) { Tweet.create! valid_attributes }

    describe "with valid params" do
      it "creates a new Tweet" do
        expect {
          post :create, {:tweet => valid_attributes}, valid_session
        }.to change(Tweet, :count).by(1)
      end

      it "should have a notice message" do
        expect {
          post :create, {:tweet => valid_attributes}, valid_session
        }.to change(Tweet, :count).by(1)
        flash[:notice].should eql('Tweet successfully created.')
      end

      it "assigns a newly created tweet as @tweet" do
        post :create, {:tweet => valid_attributes}, valid_session
        assigns(:tweet).should be_a(Tweet)
        assigns(:tweet).should be_persisted
      end

      it "redirects to the index page" do
        post :create, {:tweet => valid_attributes}, valid_session
        response.should redirect_to(tweets_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tweet as @tweet" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tweet.any_instance.stub(:save).and_return(false)
        post :create, {:tweet => {}}, valid_session
        assigns(:tweet).should be_a_new(Tweet)
      end

      it "should have a no notice message" do
        Tweet.any_instance.stub(:save).and_return(false)
        post :create, {:tweet => {}}, valid_session
        flash[:notice].should be_nil
      end
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tweet.any_instance.stub(:save).and_return(false)
        post :create, {:tweet => {}}, valid_session
        response.should render_template("index")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @tweet = Tweet.create! valid_attributes
    end

    it "destroys the requested tweet" do
      expect {
        delete :destroy, {:id => @tweet.to_param}, valid_session
      }.to change(Tweet, :count).by(-1)
    end

    it "should display a notice" do
      expect {
        delete :destroy, {:id => @tweet.to_param}, valid_session
      }.to change(Tweet, :count).by(-1)
      flash[:notice].should eql('The tweet has been removed from the database.')

    end

    it "redirects to the tweets list" do
      delete :destroy, {:id => @tweet.to_param}, valid_session
      response.should redirect_to(tweets_url)
    end
  end

end
