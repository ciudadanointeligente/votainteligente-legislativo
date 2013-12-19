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

describe BillsController do

  # This should return the minimal set of attributes required to create a valid
  # Bill. As you add validations to Bill, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BillsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    xit "assigns all bills as @bills" do
      bill = Bill.create! valid_attributes
      get :index, {}, valid_session
      assigns(:bills).should eq([bill])
    end
  end

  describe "GET show" do
    it "assigns the requested bill as @bill" do
      raw_response_file = File.open("./spec/webmock/bills_6967_06.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/6967-06").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      bill = Bill.get("http://billit.ciudadanointeligente.org/bills/6967-06", 'application/json')
      # bill = Bill.create! valid_attributes
      get :show, {:id => bill.uid}, valid_session
      assigns(:bill).uid.should eq(bill.uid)
      assigns(:bill).title.should eq(bill.title)
      assigns(:bill).creation_date.should eq(bill.creation_date)
      assigns(:bill).initiative.should eq(bill.initiative)
      assigns(:bill).origin_chamber.should eq(bill.origin_chamber)
      assigns(:bill).current_urgency.should eq(bill.current_urgency)
      assigns(:bill).stage.should eq(bill.stage)
      assigns(:bill).sub_stage.should eq(bill.sub_stage)
      assigns(:bill).state.should eq(bill.state)
      assigns(:bill).law.should eq(bill.law)
      assigns(:bill).link_law.should eq(bill.link_law)
      assigns(:bill).merged.should eq(bill.merged)
      assigns(:bill).matters.should eq(bill.matters)
      assigns(:bill).authors.should eq(bill.authors)
      assigns(:bill).urgencies.should eq(bill.urgencies)
      assigns(:bill).reports.should eq(bill.reports)
      assigns(:bill).modifications.should eq(bill.modifications)
      assigns(:bill).documents.should eq(bill.documents)
      assigns(:bill).instructions.should eq(bill.instructions)
      assigns(:bill).observations.should eq(bill.observations)
      assigns(:bill).links.should eq(bill.links)

      controller_sessions = assigns(:bill).events.map {|event| event.session}
      bill.events.each do |event| 
        controller_sessions.include?(event.session).should be_true
      end

    end

    it "returns @date_freq as an array of integers" do
      raw_response_file = File.open("./spec/webmock/bills_6967_06.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/6967-06").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      bill = Bill.get("http://billit.ciudadanointeligente.org/bills/6967-06", 'application/json')
      # bill = Bill.create! valid_attributes
      get :show, {:id => bill.uid}, valid_session
      assigns(:date_freq).should be_an_instance_of Array
      assigns(:date_freq).length.should be ENV['bill_graph_data_length'].to_i
      assigns(:date_freq).each do |freq|
        freq.should be_an Integer
      end
    end

    it "assigns @date_freq values according to defined time intervals" do
      raw_response_file = File.open("./spec/webmock/bills_6967_06.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/6967-06").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      bill = Bill.get("http://billit.ciudadanointeligente.org/bills/6967-06", 'application/json')
      Date.stub(:today) {Date.new(2013, 4)}
      get :show, {:id => bill.uid}, valid_session
      
      assigns(:date_freq).should eq [0,0,0,0,0,5,0,0,1,1,0,4]
    end

    xit "define time lapse (weeks, months, years) in ENV" do
    end
  end

  describe "GET new" do
    xit "assigns a new bill as @bill" do
      get :new, {}, valid_session
      assigns(:bill).should be_a_new(Bill)
    end
  end

  describe "GET edit" do
    xit "assigns the requested bill as @bill" do
      bill = Bill.create! valid_attributes
      get :edit, {:id => bill.to_param}, valid_session
      assigns(:bill).should eq(bill)
    end
  end

  describe "GET search" do
    it "returns a BillCollectionPage" do
      raw_response_file = File.open("./spec/webmock/bills_salud_page1.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/search/?action=search&controller=bills&q=salud").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      raw_response_file_authors = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file_authors, :headers => {})

      get :search, q: "salud"
      assigns(:bills_query).should be_an_instance_of BillCollectionPage
    end

    it "returns an array of Bills" do
      raw_response_file = File.open("./spec/webmock/bills_salud_page1.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/search/?action=search&controller=bills&q=salud").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      raw_response_file_authors = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file_authors, :headers => {})

      get :search, q: "salud"
      assigns(:bills_query).bills.should_not be_nil
      assigns(:bills_query).bills.should be_an Array
      assigns(:bills_query).bills[0].should be_an_instance_of Bill
    end

    it "has a self reference" do
      raw_response_file = File.open("./spec/webmock/bills_salud_page1.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/search/?action=search&controller=bills&q=salud").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      raw_response_file_authors = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file_authors, :headers => {})

      get :search, q: "salud"
      assigns(:bills_query).self.should_not be_nil
      assigns(:bills_query).self.should eq("http://billit.ciudadanointeligente.org/bills/search.json?page=1&q=salud")
    end

    it "has a next page" do
      raw_response_file = File.open("./spec/webmock/bills_salud_page1.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/search/?action=search&controller=bills&q=salud").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      raw_response_file_authors = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file_authors, :headers => {})

      get :search, q: "salud"
      assigns(:bills_query).next.should eq("http://billit.ciudadanointeligente.org/bills/search.json?page=2&q=salud")
    end

    it "has a previous page" do
      raw_response_file = File.open("./spec/webmock/bills_salud_page2.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/search/?action=search&controller=bills&page=2&q=salud").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      raw_response_file_authors = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file_authors, :headers => {})

      get :search, q: "salud", page: 2
      assigns(:bills_query).previous.should eq("http://billit.ciudadanointeligente.org/bills/search.json?page=1&q=salud")
    end

    it "has all metadata" do
      raw_response_file = File.open("./spec/webmock/bills_salud_page1.json")
      stub_request(:get, "http://billit.ciudadanointeligente.org/bills/search/?action=search&controller=bills&q=salud").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      raw_response_file_authors = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file_authors, :headers => {})

      get :search, q: "salud"
      assigns(:bills_query).total_entries.should_not be_nil
      assigns(:bills_query).current_page.should_not be_nil
      assigns(:bills_query).total_pages.should_not be_nil
    end

    it "it obtains authors list" do
      raw_response_file = File.open("./spec/webmock/bill_authors_list.json")
      stub_request(:get, 'http://' + ENV['popit_url']  + '/api/v0.1/persons/').
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => raw_response_file, :headers => {})

      get :search
      assigns(:authors_list).should_not be_nil
      assigns(:authors_list).should_not be_empty
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Bill" do
        expect {
          post :create, {:bill => valid_attributes}, valid_session
        }.to change(Bill, :count).by(1)
      end

      xit "assigns a newly created bill as @bill" do
        post :create, {:bill => valid_attributes}, valid_session
        assigns(:bill).should be_a(Bill)
        assigns(:bill).should be_persisted
      end

      xit "redirects to the created bill" do
        post :create, {:bill => valid_attributes}, valid_session
        response.should redirect_to(Bill.last)
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved bill as @bill" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        post :create, {:bill => {  }}, valid_session
        assigns(:bill).should be_a_new(Bill)
      end

      xit "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        post :create, {:bill => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bill" do
        raw_response_file = File.open("./spec/webmock/bills_6967_06.json")
        stub_request(:get, "http://billit.ciudadanointeligente.org/bills/6967-06").
          with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => raw_response_file, :headers => {})

        stub_request(:put, "http://billit.ciudadanointeligente.org/bills/6967-06").
          with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => "", :headers => {})

        bill = Bill.get("http://billit.ciudadanointeligente.org/bills/6967-06", 'application/json')
        put :update, {id: bill.uid, tags: bill.tags}, valid_session
        assigns(:bill).tags.should eq(bill.tags)
      end

      xit "assigns the requested bill as @bill" do
        bill = Bill.create! valid_attributes
        put :update, {:id => bill.to_param, :bill => valid_attributes}, valid_session
        assigns(:bill).should eq(bill)
      end

      xit "redirects to the bill" do
        bill = Bill.create! valid_attributes
        put :update, {:id => bill.to_param, :bill => valid_attributes}, valid_session
        response.should redirect_to(bill)
      end
    end

    describe "with invalid params" do
      xit "assigns the bill as @bill" do
        bill = Bill.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        put :update, {:id => bill.to_param, :bill => {  }}, valid_session
        assigns(:bill).should eq(bill)
      end

      xit "re-renders the 'edit' template" do
        bill = Bill.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        put :update, {:id => bill.to_param, :bill => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested bill" do
      bill = Bill.create! valid_attributes
      expect {
        delete :destroy, {:id => bill.to_param}, valid_session
      }.to change(Bill, :count).by(-1)
    end

    xit "redirects to the bills list" do
      bill = Bill.create! valid_attributes
      delete :destroy, {:id => bill.to_param}, valid_session
      response.should redirect_to(bills_url)
    end
  end

end
