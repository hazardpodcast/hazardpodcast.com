const fs = require("fs");
const path = require("path");
const createAudioData = require("./create-audio-data");

module.exports = function (eleventyConfig, options) {
	console.log("Activating create-audio-data", options);
	// eleventyConfig.addPassthroughCopy("./src/js", "timelines/js");
	// eleventyConfig.addPassthroughCopy({ ".src/css": "timelines/css" });
	// eleventyConfig.addLayoutAlias("timeline", "./src/layouts/timeline.njk");
	eleventyConfig.addCollection("podcast", async function (collection) {
		// let aSet = new Set();
		let dataEpisodes = [];
		let episodes = collection.getFilteredByTag(options.episodesCollection);
		// console.log("episode collection", episodes);
		dataEpisodes = episodes.map(async (aEpisode) => {
			const file = path.join(
				options.podcastFolder,
				aEpisode.data.episodeFile
			);
			const audioFileData = await createAudioData.createMetadata(file);
			aEpisode.data.episodeFile = `${options.domainName}/${options.outPath}/${aEpisode.data.episodeFile}`;
			var readableDuration = new Date(
				audioFileData.format.duration * 1000
			)
				.toISOString()
				.substring(11, 19);
			aEpisode.data.duration = readableDuration;
			aEpisode.data.length = audioFileData.byteSize;
			return aEpisode;
		});
		let finalEpisodes = await Promise.all(dataEpisodes);
		// console.log("Final Episode", finalEpisodes);
		return finalEpisodes;
	});
};

// References
/**
 * https://www.npmjs.com/package/music-metadata
 * https://en.wikipedia.org/wiki/RSS_enclosure
 * https://github.com/Zazama/node-id3 && https://www.npmjs.com/package/node-id3
 * https://www.drupal.org/node/1473728
 * https://www.feedforall.com/itune-tutorial-tags.htm#duration
 * https://podcasters.apple.com/support/823-podcast-requirements
 * https://podcasters.apple.com/support/1691-apple-podcasts-categories
 * https://beyondwords.io/blog/how-to-optimize-podcast-rss-feed/
 * https://podcasters.apple.com/support/829-validate-your-podcast
 * https://help.apple.com/itc/podcasts_connect/#/itcb54353390
 * https://support.google.com/podcast-publishers/answer/9889544?hl=en
 *
 */
