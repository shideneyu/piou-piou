# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  new ProductsPager()

class ProductsPager
  constructor: ->
    this.waitformsg()

  check: =>
    $.getJSON(window.location, @render)
    
  render: (tweets) =>
    if tweets[0]
      for tweet_attributes in tweets
        this.tweets(tweet_attributes)
    else
      this.tweets(tweets)

  tweets: (tweets) =>
    tweet = new Tweets(tweets)
    template = $("#tweets-display").html()
    $('#tweets-display').append Mustache.to_html($('#tweets').html(), tweet)

  waitformsg: =>
    self = this
    $.ajax
      type: "GET"
      ifModified: true
      url: "http://0.0.0.0:3000/tweets.json"
      async: true
      cache: true
      success: (data, textStatus, jqXHR) ->
        if textStatus == "notmodified"
          setTimeout self.waitformsg(), 2000
        else
          $('#tweets-display li').remove();
          self.check()
          self.waitformsg()
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        self.waitformsg()

class Tweets
  constructor: (@attributes) ->
  id: -> @attributes.id
  content: -> @attributes.content
  created_at: -> @attributes.created_at