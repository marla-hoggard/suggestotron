class Topic < ApplicationRecord
	has_many :votes, dependent: :destroy

	#Sort by vote count (descending)
	def self.sorted
		find_by_sql(
			"SELECT topics.*,
			(SELECT count(votes.topic_id) FROM votes
				WHERE votes.topic_id = topics.id)
				AS vote_count
			FROM topics
			ORDER BY vote_count DESC"
		)
	end

	#The above SQL counts the votes and creates a column "votes_count"
	#This says that if we have that attribute, use it, otherwise compute it
	def votes_count
		attributes['vote_count'] || votes.count
	end
end
