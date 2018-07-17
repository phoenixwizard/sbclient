# RSpec.describe Sbclient do
#   it "has a version number" do
#     expect(Sbclient::VERSION).not_to be nil
#   end

#   # it "does something useful" do
#   #   expect(false).to eq(true)
#   # end

#   it "fetches 10 tickets when hit get_tickets" do
#     expect(Sbclient.get_tickets("phoenixwizard").size).to eq(10)
#   end

# end

RSpec.describe Sbclient::Client do
  let(:client_tickets) {Sbclient::Client.new("phoenixwizard","1o3wCM7qZXyQup5nmFSv").tickets}
  let(:client_create_ticket) {Sbclient::Client.new("phoenixwizard","1o3wCM7qZXyQup5nmFSv").tickets}
  it "fetches n tickets when hit GET /tickets" do
    expect(client_tickets['tickets'].length).to eql(client_tickets['total'])
  end

  it "creates a new ticket when hit with POST /tickets" do
    client_create_ticket = Sbclient::Client.new("phoenixwizard","1o3wCM7qZXyQup5nmFSv")
    sample_json = {
      "ticket": {
        "subject": "Subject",
        "requester_name": "John Doe",
        "requester_email": "john@example.com",
        "cc": [
          "Test1 <test1@example.com>",
          "Test2 <test2@example.com>"
        ],
        "bcc": [
          "Test3 <test3@example.com>",
          "Test4 <test4@example.com>"
        ],
        "content": {
          "text": "Creating a ticket",
          "html": "<p>Creating a ticket</p>",
          "attachment_ids": [1240, 1241]
        }
      }
    }
    response_client = client_create_ticket.create_tickets(sample_json)
    puts response_client
    expect(response_client['ticket']['subject']).to eql("Subject")
  end

end