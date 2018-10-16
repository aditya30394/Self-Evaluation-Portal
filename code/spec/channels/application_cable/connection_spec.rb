describe ApplicationCable::Connection do
    let(:dummy_class) { Connection.new { include ApplicationCable } }
end
