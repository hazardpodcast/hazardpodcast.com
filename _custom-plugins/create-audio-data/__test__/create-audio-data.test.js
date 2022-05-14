const { createMetadata } = require("../src/create-audio-data");
var path = require("path");

describe("Create Audio Data", function () {
	beforeEach(function () {});

	afterEach(() => {});

	test("get the metadata from a file", async function (done) {
		expect(typeof createMetadata).toBe("function");
		const audioFile = path.join(
			path.resolve(__dirname),
			"Hazard_Trailer.mp3"
		);
		const metadata = await createMetadata(audioFile);
		expect(metadata).toHaveProperty("format");
		expect(metadata.format).toHaveProperty("duration");
		expect(metadata.format.duration).toBe(227.592);
		expect(metadata).toHaveProperty("byteSize");
		expect(metadata.byteSize).toBe(9103808);
		done();
	});
});
