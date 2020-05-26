class Ride < ApplicationRecord
    belongs_to :user 
    belongs_to :attraction

    def take_ride
        if !user_has_tickets && !user_has_height
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster." 
        elsif !user_has_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !user_has_tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif user_has_height && user_has_tickets
            start_ride
        end
    end

    def user_has_tickets 
        user_has_tickets = false 
        if self.user.tickets >= self.attraction.tickets 
            user_has_tickets = true 
        end
    end
    def user_has_height
        user_has_height = false 
        if self.user.height >= self.attraction.min_height
            user_has_height = true 
        end
    end

    def start_ride
        new_tickets = self.user.tickets - self.attraction.tickets 
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        self.user.update(
            tickets: new_tickets,
            nausea: new_nausea,
            happiness: new_happiness
        )
        "Thanks for riding the #{self.attraction.name}!"
    end
end
