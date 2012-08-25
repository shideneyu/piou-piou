# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  new ProductsPager()

class ProductsPager
  constructor: ->
    this.check()

  check: =>
    $.getJSON(window.location, @render)
    
  render: (tweets) =>
    if tweets[0]
      for tweet_attributes in tweets
        tweet = new Tweets(tweet_attributes)
        template = $("#tweets-display").html()
        $('#tweets-display').append Mustache.to_html($('#tweets').html(), tweet)
    else
        tweet = new Tweet(tweets)
        template = $("#tweets-display").html()
        $('#tweets-display').append Mustache.to_html($('#tweets').html(), tweet)

class Tweets
  constructor: (@attributes) ->
  id: -> @attributes.id
  content: -> @attributes.content
  created_at: -> @attributes.created_at

class Tweet
  constructor: (@attributes) ->
  id: -> @attributes.id
  content: -> @attributes.content
  created_at: -> @attributes.created_at
  back: -> "lol"