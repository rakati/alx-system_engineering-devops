#!/usr/bin/python3
'''Script for requesting data from Reddit API'''

import requests


def number_of_subscribers(subreddit):
    '''return the number of subscribers for the given subreddit'''
    resp = requests.get("https://www.reddit.com/r/{}/about.json"
                        .format(subreddit),
                        headers={"User-Agent": "ALX-API-Advanced-Script"},
                        allow_redirects=False)
    if resp.status_code < 300:
        return resp.json()['data']['subscribers']
    return 0
