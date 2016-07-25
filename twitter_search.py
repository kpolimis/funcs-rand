import tweepy
from twitter_authentication import CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

api = tweepy.API(auth)
search = input("What do you want to search? ")
public_tweets = api.search(search, count=100)   
    
for tweet in public_tweets:
    	print(tweet.user.screen_name + "\t" + str(tweet.created_at) + "\t" + tweet.text)

