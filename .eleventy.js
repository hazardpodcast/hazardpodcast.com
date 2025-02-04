const eleventyNavigationPlugin = require("@11ty/eleventy-navigation");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const getCollectionItem = require("@11ty/eleventy/src/Filters/GetCollectionItem");
const path = require("path");
const del = require("del");
var mdProcessor = require("markdown-it");
const sitemap = require("@quasibit/eleventy-plugin-sitemap");
const UpgradeHelper = require("@11ty/eleventy-upgrade-help");
const Image = require("@11ty/eleventy-img");

let Nunjucks = require("nunjucks");
const normalize = require("normalize-path");

const util = require("util");

var slugify = require("slugify");

require("dotenv").config();

let domain_name = "https://hazardpodcast.com";
let throwOnUndefinedSetting = false;

if (process.env.IS_LOCAL) {
	domain_name = "http://localhost:8080";
	throwOnUndefinedSetting = true;
	console.log("Dev env");
}

process.env.DOMAIN = domain_name;

module.exports = function (eleventyConfig) {
	// eleventyConfig.addPlugin(UpgradeHelper);
	var siteConfiguration = {
		// Control which files Eleventy will process
		// e.g.: *.md, *.njk, *.html
		templateFormats: ["md", "njk", "html"],

		// -----------------------------------------------------------------
		// If your site deploys to a subdirectory, change `pathPrefix`.
		// Don’t worry about leading and trailing slashes, we normalize these.

		// If you don’t have a subdirectory, use "" or "/" (they do the same thing)
		// This is only used for link URLs (it does not affect your file structure)
		// Best paired with the `url` filter: https://www.11ty.dev/docs/filters/url/

		// You can also pass this in on the command line using `--pathprefix`

		// Optional (default is shown)
		pathPrefix: "/",
		// -----------------------------------------------------------------

		// Pre-process *.md files with: (default: `liquid`)
		markdownTemplateEngine: "njk",

		// Pre-process *.html files with: (default: `liquid`)
		htmlTemplateEngine: "njk",

		// Opt-out of pre-processing global data JSON files: (default: `liquid`)
		dataTemplateEngine: false,

		// These are all optional (defaults are shown):
		dir: {
			input: "src",
			includes: "_includes",
			layouts: "_layouts",
			data: "_data",
			output: "docs",
		},
	};

	async function imageShortcode(src, alt, sizes, customSize = 250) {
		let metadata = await Image(src, {
			widths: [parseInt(customSize), 300, 600, 800],
			formats: ["png", "jpeg", "svg"],
			outputDir: path.join(eleventyConfig.dir.output, "img"),
			filenameFormat: function (id, src, width, format, options) {
				const extension = path.extname(src);
				const name = path.basename(src, extension);

				return `${name}-${width}w.${format}`;
			},
			whitespaceMode: "inline",
		});

		let imageAttributes = {
			alt,
			sizes,
			loading: "lazy",
			decoding: "async",
		};

		// You bet we throw an error on missing alt in `imageAttributes` (alt="" works okay)
		return Image.generateHTML(metadata, imageAttributes);
	}

	async function imageSmallShortcode(src, alt, sizes) {
		let metadata = await Image(src, {
			widths: [50, 150],
			formats: ["png", "jpeg"],
			outputDir: path.join(eleventyConfig.dir.output, "img"),
			filenameFormat: function (id, src, width, format, options) {
				const extension = path.extname(src);
				const name = path.basename(src, extension);
				return `${name}-${width}w.${format}`;
			},
		});

		let imageAttributes = {
			alt,
			sizes,
			loading: "eager",
			decoding: "sync",
		};

		// You bet we throw an error on missing alt in `imageAttributes` (alt="" works okay)
		return Image.generateHTML(metadata, imageAttributes);
	}

	// Not in place until v1
	// eleventyConfig.addGlobalData("domain_name", domain_name);
	//console.log("eleventyConfig", eleventyConfig);

	const dirToClean = path.join(siteConfiguration.dir.output, "*");
	del.sync(dirToClean, { dot: true });

	// https://www.11ty.dev/docs/data-deep-merge/
	eleventyConfig.setDataDeepMerge(true);

	// var markdownIt = new mdProcessor();

	// https://www.11ty.dev/docs/plugins/syntaxhighlight/
	// eleventyConfig.addPlugin(syntaxHighlight);
	// https://www.11ty.dev/docs/plugins/navigation/
	eleventyConfig.addPlugin(eleventyNavigationPlugin);
	// https://www.11ty.dev/docs/plugins/rss/
	eleventyConfig.addPlugin(pluginRss);
	// https://www.npmjs.com/package/@quasibit/eleventy-plugin-sitemap
	eleventyConfig.addPlugin(sitemap, {
		// Name of the property for the last modification date.
		// By default it is undefined and the plugin will fallback to `date`.
		// When set, the plugin will try to use this property and it will fallback
		// to the `date` property when needed.
		lastModifiedProperty: "modified",

		sitemap: {
			// Options for SitemapStream. See https://github.com/ekalinin/sitemap.js/blob/master/api.md#sitemapstream
			// Hostname is needed when the URLs of the items don't include it.
			hostname: domain_name,
		},
	});
	eleventyConfig.addWatchTarget("./_custom-plugins/");
	// eleventyConfig.addWatchTarget("./src/_sass");
	// sassBuild(domain_name);
	eleventyConfig.on("beforeWatch", (changedFiles) => {
		// changedFiles is an array of files that changed
		// to trigger the watch/serve build
		// sassBuild(domain_name);
	});
	eleventyConfig.addPlugin(require("eleventy-plugin-dart-sass"), {
		sassLocation: path.join(path.resolve("."), "src/_sass/"),
		perTemplateFiles: "template-",
		outDir: path.join(path.resolve("."), "docs"),
		domainName: domain_name,
	});

	// https://www.npmjs.com/package/@quasibit/eleventy-plugin-sitemap

	// Alias `layout: post` to `layout: layouts/post.njk`
	// eleventyConfig.addLayoutAlias("post", "layouts/post.njk");

	// Copy the `img` folders to the output
	eleventyConfig.addPassthroughCopy("src/img");
	eleventyConfig.addPassthroughCopy("./CNAME");
	eleventyConfig.addPassthroughCopy("./.gitattributes");
	eleventyConfig.addPassthroughCopy({ "src/favicon.ico": "favicon.ico" });
	// eleventyConfig.addPassthroughCopy("src/.gitignore");
	eleventyConfig.addPassthroughCopy({ "src/_well-known": ".well-known" });
	eleventyConfig.addPassthroughCopy({
		"dinky/assets/images": "assets/images",
	});
	eleventyConfig.addPassthroughCopy({
		"src/assets": "assets",
	});

	eleventyConfig.addPlugin(require("./_custom-plugins/create-audio-data"), {
		domainName: domain_name,
		podcastFolder: path.join(path.resolve("."), "/src/assets/podcasts"),
	});

	// Can't use this until ver 1 apparently
	/**
	const getDirectories = source =>
		readdirSync(source, { withFileTypes: true })
			.filter(dirent => dirent.isDirectory())
			.map(dirent => dirent.name)


	eleventyConfig.addGlobalData('projects', function(collectionApi) {
        return getDirectories('src/projects/');
    });
	*/

	const pathNormalizer = function (pathString) {
		return normalize(
			path.normalize(path.join(path.resolve("."), pathString))
		);
	};

	// Nunjucks Filters
	/** this method doesn't work for unclear reasons
	let nunjucksFileSystem = [
		pathNormalizer(
			path.join(
				siteConfiguration.dir.input,
				siteConfiguration.dir.includes
			)
		),
		pathNormalizer(
			path.join(
				siteConfiguration.dir.input,
				siteConfiguration.dir.layouts
			)
		),
		pathNormalizer(siteConfiguration.dir.input),
		normalize(path.normalize(".")),
	];
	console.log("nunjucksFileSystem", nunjucksFileSystem);
	let nunjucksEnvironment = Nunjucks.configure(
		new Nunjucks.FileSystemLoader(nunjucksFileSystem),
		{
			throwOnUndefined: throwOnUndefinedSetting,
			autoescape: true,
		}
	);
	eleventyConfig.setLibrary("njk", nunjucksEnvironment);
    */
	const nunjucksFileSystem = [
		path.join(siteConfiguration.dir.input, siteConfiguration.dir.includes),
		path.join(siteConfiguration.dir.input, siteConfiguration.dir.layouts),
		siteConfiguration.dir.input,
		normalize(path.normalize(".")),
	];
	eleventyConfig.addNunjucksAsyncShortcode("image", imageShortcode);
	eleventyConfig.addNunjucksAsyncShortcode("smallimage", imageSmallShortcode);
	const njkEngine = require("nunjucks").configure(nunjucksFileSystem, {
		autoescape: false,
		throwOnUndefined: throwOnUndefinedSetting,
		noCache: throwOnUndefinedSetting,
	});
	console.log("other nunjucksFileSystem", nunjucksFileSystem);
	eleventyConfig.setLibrary("njk", njkEngine); //: autoescape for CSS rules
	// Get the first `n` elements of a collection.
	eleventyConfig.addFilter("slice", (array, n) => {
		if (!Array.isArray(array) || array.length === 0) {
			return [];
		}
		if (n < 0) {
			return array.slice(n);
		}

		return array.slice(0, n);
	});
	/**
	// Get the first `n` chracters of a `s` string.
	eleventyConfig.addFilter("truncate", (s, n) => {
		if ("string" != typeof s || s.length === 0) {
			return "";
		}
		if (n < 0) {
			return s;
		}

		return s.substring(0, n);
	});
 */
	function filterTagList(tags) {
		return (tags || []).filter(
			(tag) =>
				["all", "nav", "post", "posts", "projects"].indexOf(tag) === -1
		);
	}

	eleventyConfig.addFilter("filterTagList", filterTagList);

	const paginate = (arr, size) => {
		return arr.reduce((acc, val, i) => {
			let idx = Math.floor(i / size);
			let page = acc[idx] || (acc[idx] = []);
			page.push(val);

			return acc;
		}, []);
	};

	let tagSet = new Set();
	let tagList = [];

	getAllTags = (allPosts) => {
		allPosts.forEach((item) => {
			if ("tags" in item.data) {
				let tags = filterTagList(item.data.tags);
				// console.log("Tags:", tags);
				tags.forEach((tag) => {
					tagSet.add(tag);
				});
			}
		});
		tagList = [...tagSet];
		return tagList;
	};

	const makePageObject = (tagName, slug, number, posts, first, last) => {
		return {
			tagName: tagName,
			slug: slug ? slug : slugify(tagName.toLowerCase()),
			number: number,
			posts: posts,
			first: first,
			last: last,
		};
	};

	const getPostClusters = (allPosts, tagName, slug) => {
		aSet = new Set();
		let postArray = allPosts.reverse();
		aSet = [...postArray];
		postArray = paginate(aSet, 10);
		let paginatedPostArray = [];
		postArray.forEach((p, i) => {
			paginatedPostArray.push(
				makePageObject(
					tagName,
					slug,
					i + 1,
					p,
					i === 0,
					i === postArray.length - 1
				)
			);
		});
		// console.log(paginatedPostArray)
		return paginatedPostArray;
	};

	eleventyConfig.addCollection("postsPages", (collection) => {
		return getPostClusters(collection.getFilteredByTag("posts"), "Posts");
	});

	eleventyConfig.addCollection("episodesPages", (collection) => {
		return getPostClusters(
			collection.getFilteredByTag("episode"),
			"Episodes"
		);
	});

	eleventyConfig.addCollection("seasonOnePages", (collection) => {
		return getPostClusters(
			collection.getFilteredByTag("Season One"),
			"Episodes from Season One"
		);
	});

	eleventyConfig.addCollection("seasonTwoPages", (collection) => {
		return getPostClusters(
			collection.getFilteredByTag("Season Two"),
			"Episodes from Season Two"
		);
	});

	eleventyConfig.addCollection("seasonThreePages", (collection) => {
		return getPostClusters(
			collection.getFilteredByTag("Season Three"),
			"Episodes from Season Three"
		);
	});

	// Create an array of all tags
	eleventyConfig.addCollection("tagList", (collection) => {
		return getAllTags(collection.getAll());
	});

	// Create a list of posts by tag for paged lists
	eleventyConfig.addCollection("deepTagList", (collection) => {
		const maxPostsPerPage = 10;
		const pagedPosts = [];
		tagList = getAllTags(collection.getAll());
		tagList.forEach((tagName) => {
			const taggedPosts = [
				...collection.getFilteredByTag(tagName),
			].reverse();
			const numberOfPages = Math.ceil(
				taggedPosts.length / maxPostsPerPage
			);

			for (let pageNum = 1; pageNum <= numberOfPages; pageNum++) {
				const sliceFrom = (pageNum - 1) * maxPostsPerPage;
				const sliceTo = sliceFrom + maxPostsPerPage;

				pagedPosts.push(
					makePageObject(
						tagName,
						false,
						pageNum,
						taggedPosts.slice(sliceFrom, sliceTo),
						pageNum === 1,
						pageNum === numberOfPages
					)
				);
			}
		});
		// console.log("pagedPosts", pagedPosts[0].tagName);
		return pagedPosts;
	});

	eleventyConfig.addFilter("console", function (value) {
		let objToEcho;
		if (value.posts) {
			objToEcho = Object.assign({}, value);
			delete objToEcho.posts;
		} else {
			objToEcho = value;
		}
		const str = util.inspect(objToEcho);
		return `<div style="white-space: pre-wrap;">${unescape(str)}</div>;`;
	});

	let options = {
		html: true,
		breaks: true,
		linkify: true,
		replaceLink: function (link, env) {
			// console.log("env:", env);
			var imageLinkRegex = /^..\/img\//;
			if (link && imageLinkRegex.test(link)) {
				return (
					env.site.site_url +
					"/img/" +
					link.replace(imageLinkRegex, "")
				);
			} else {
				return link;
			}
		},
		/** langPrefix: "language-",
		highlight: function (str, lang) {
			if (lang && hljs.getLanguage(lang)) {
				try {
					console.log("Syntax highlight good", lang);
					return hljs.highlight(lang, str).value;
				} catch (__) {
					console.log("Syntax highlight fail", lang);
				}
			}
			console.log("Fallback syntax highlighting");
			return ""; // use external default escaping
		},**/
	};
	var markdownSetup = mdProcessor(options)
		.use(require("markdown-it-replace-link"))
		// .use(require("./_custom-plugins/markdown-it-short-phrases"))
		.use(require("markdown-it-find-and-replace"), {
			defaults: true,
			replaceRules: [
				{
					pattern: /(?<=[\t\s\S\( ])thru(?=[\?\.\,\s\r\n\!\) ]|$)/g,
					replace: "through",
				},
				{
					pattern: /(?<=[\t\s\S\( ]|^)Thru(?=[\?\.\,\s\r\n\!\) ])/g,
					replace: "Through",
				},
			],
		})
		// .use(require('@gerhobbelt/markdown-it-footnote'))
		.use(require("markdown-it-anchor"), {
			slugify: (s) => slugify(s.toLowerCase().replace(/"/g, "")),
		});

	// via https://github.com/markdown-it/markdown-it/blob/master/docs/architecture.md#renderer
	var defaultRender =
		markdownSetup.renderer.rules.link_open ||
		function (tokens, idx, options, env, self) {
			return self.renderToken(tokens, idx, options);
		};
	markdownSetup.renderer.rules.link_open = function (
		tokens,
		idx,
		options,
		env,
		self
	) {
		if (tokens[idx].meta && tokens[idx].meta.includes("skip-link")) {
			return defaultRender(tokens, idx, options, env, self);
		}
		// If you are sure other plugins can't add `target` - drop check below
		var aIndex = tokens[idx].attrIndex("target");

		if (aIndex < 0) {
			tokens[idx].attrPush(["target", "_blank"]); // add new attribute
		} else {
			tokens[idx].attrs[aIndex][1] = "_blank"; // replace value of existing attr
		}

		// pass token to default renderer.
		return defaultRender(tokens, idx, options, env, self);
	};

	eleventyConfig.setLibrary("md", markdownSetup);

	return siteConfiguration;
};
