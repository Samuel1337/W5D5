def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  
  # movie = Movie
  #   .select(:id, :title)
  #   .joins(:actors)


    Movie 
      .select(:id, :title) 
      .joins(:actors)
      .group(:id)
      .having('COUNT(movies.id) = ?', those_actors.length)
      .where(actors: {name: those_actors})
end

def golden_age
  # Find the decade with the highest average movie score.
  
  Movie
    .select('(yr / 10) * 10 AS decade')
    .group('decade')
    .order("AVG(score) DESC").first.decade

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
Actor
  .select(:name)
  .joins(:castings)
  .group(:name)
  .having(name: name)
  .where(
  "castings.movie_id IN (
  SELECT
    castings.movie_id
  FROM
    actors
  JOIN
    castings
  ON
    castings.actor_id = actors.id
  )")
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
