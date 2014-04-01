require 'octokit'

client = Octokit::Client.new(:access_token => "bc81e1ebf06e3a47ce4c5d541b1569890adf22be")

user = client.user.login

client.create_issue('pat-whitrock/gitshoes', "Sunwoo is sick", "drink some medicine")