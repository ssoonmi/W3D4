def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select('movies.title, movies.id')
    .joins(:actors)
    .where('actors.name IN (?)', those_actors)
    .group('movies.id')
    .having('COUNT(actors.id) = ?', those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  decade = Movie
    .select('((yr%100)/10) * 10 AS decade')
    .group('(yr%100)/10')
    .order('AVG(score) DESC')
    .limit(1)
  decade.first['decade'] + 1900
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  movies = Movie
    .select('movies.id')
    .joins(:actors)
    .where('actors.name LIKE ?', name)
    .pluck(:id)

  Actor
    .select('actors.name')
    .joins(:movies)
    .where('actors.name != ? AND movies.id IN (?)', name, movies)
    .pluck(:name)
  # p "---------------"
  # p Actor.find_by(name: 'Humphrey Bogart').castings
  # p Actor.find_by(name: 'Lauren Bacall').movie_ids
  # p "---------------"

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:castings)
    .where('castings.actor_id IS NULL').count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  name = "%"
  name += whazzername.split('').join('%')
  name += "%"
  Movie
    .joins(:actors)
    .where('name LIKE ?', name)

end
def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
