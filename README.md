# blockchain-developer-bootcamp-final-project

I would like to create a Blockchain game for education. I am still thinking with the ideas. 
I would like to build a NFT game on Polygon.
1. As a first step, just write the function name, what inputs the function requires and what it might return. Start a new file in your Github repo and start to sketch the functions.

Here's what that might look like for our voting example from the first exercise:

1. Users will have to register themselves somehow on the contract

function registerVoter(address _voter) {

	// registers voter

};
	
2. They have to identify which campaign their voting on

function registerVote(uint campaignID) {

	// registers the vote of the voter

};
	
3. They'll have to submit a vote for that campaign but 4. they can't vote twice for a single campaign.

modifier onlyVoteOnce() { 
	// checks the vote hasn't voted before 
	_ 
};

Voting Contract Example Workflow

1. Users will have to register themselves somehow on the contract

2. They have to identify which campaign their voting on

3. They'll have to submit a vote for that campaign.

4. They can't vote twice for a single campaign 

2. Upload it to Github Once you have a general sense of your project (Remember: it should be very simple and not complicated!), we'd like you to setup a Github repository for your project and submit your project idea in the repository's README.md file. 

Your Github repository and project should be titled blockchain-developer-bootcamp-final-project and, at this point, only has to contain a README.md with your project idea and any notes you'd like to include! (You don't have to stop there, by the way, but that's the minimum for this exercise)
For those already comfortable with the command line, code editor and git, Here's a link to the lesson in Basic Training where we walkthrough setting up a new Github project. 
For those who would prefer to start on Github, then work locally, please see this excellent tutorial from Github about how to initialize 
