// const mm = require("music-metadata");
const mm = require("music-metadata");
const util = require("util");
const fs = require("fs");

const createMetadata = async (musicFile) => {
	try {
		const metadata = await mm.parseFile(musicFile);
		console.log(util.inspect(metadata, { showHidden: false, depth: null }));
		const fileData = fs.statSync(musicFile);
		metadata.byteSize = fileData.size;
		console.log(metadata);
		return metadata;
	} catch (error) {
		console.error(error.message);
	}
};

module.exports = { createMetadata };
