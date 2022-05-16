module.exports = (info) => {
	return {
		lang: "en-US",
		github: {
			build_revision: process.env.MY_GITHUB_RUN_ID || 1.0,
			build_sha: process.env.GITHUB_SHA || 1,
		},
		site_url: process.env.DOMAIN,
		site_name: "Hazard Podcast",
		site_twitter: "@NJSpotlightNews",
		site_facebook: "https://www.facebook.com/jordanpodcasts/",
		description:
			"Hazard is a new podcast that digs through the muck of different supperfund sites accross the US to give a clearer picture of what the threat is and what it will take to clean it up before it's too late. Hosted by journalist Jordan Gass-Poore'",
		featuredImage: "HazardCover.jpg",
		author: "Jordan Gass-Poore'",
	};
};
