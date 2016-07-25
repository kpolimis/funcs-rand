import tweepy
from twitter_authentication import CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

api = tweepy.API(auth)
tweets = api.trends_place(2490383)
#print(tweets)
#for tweet in public_tweets:
#    	print(tweet.user.screen_name + "\t" + str(tweet.created_at) + "\t" + tweet.text)

print("trending topics in Seattle")
for location in tweets:
	for trend in location["trends"]:
		print(" - %s" % trend["name"])