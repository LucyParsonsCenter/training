class EventFormatter
  def self.format(object)
    event = Hash.new
    if object.class == Meeting
      event["title"] = "Collective Meeting"
    else
      event["title"] = object.collective_member.first_name
    end
    event["start"] = object.start_time
    event["end"] = object.end_time
    event["allDay"] = false
    event["editable"] = true
    event
  end
end