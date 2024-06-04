#!/usr/bin/python3
"""
Script 00:
Script for requesting data from Reddit API
"""

import requests


def number_of_subscribers(subreddit):
    """
    Query the number of subscribers (active and non active user) for the given
    subreddit.

    Parameters:
    -----------
        - subreddit (str): Name of the subreddit to look for
    Returns:
    --------
        - Number of subscribers to the subreddit or 0 if
          the subreddit is invalid.
    """
    resp = requests.get(
        "https://www.reddit.com/r/{}/about.json".format(subreddit),
        headers={"User-Agent": "ALX-API-Advanced-Script"},
        allow_redirects=False
    )

    return 0 if resp.status_code != 200 else resp.json()['data']['subscribers']
