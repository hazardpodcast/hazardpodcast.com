<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <meta charset="UTF-8"/>
        <script defer="true" data-domain="hazardpodcast.com" src="https://plausible.io/js/plausible.js"></script>
        <style>
@font-face {
  font-family: "PhosphatePro-Solid";
  src: url('https://hazardpodcast.com/assets/fonts/PhosphateProSolid/font.woff2') format('woff2'), url('https://hazardpodcast.com/assets/fonts/PhosphateProSolid/font.woff') format('woff');
}
</style>
        <link rel="stylesheet" href="/assets/css/style.css"/>
        <link rel="stylesheet" href="/assets/css/template-feed.css"/>
        <!-- The Author meta propagates the byline in a number of social networks -->
<meta name="author" content="Jordan Gass-Poore'" ></meta>

<meta property="og:title"
    content="Hazard Podcast" ></meta>

<meta property="og:description"
    content="Hazard is a new podcast that digs through the muck of different superfund sites accross the US to give a clearer picture of what the threat is and what it will take to clean it up before it's too late. Hosted by journalist Jordan Gass-Poore'" ></meta>


<meta property="og:url"
    content="https://hazardpodcast.com/rss/podcast/style.xsl" ></meta>

<meta property="og:site_name" content="Hazard Podcast" ></meta>

<meta property="og:locale" content="en_US" ></meta>

<meta name="twitter:site" content="@chronotope" ></meta>

<meta name="twitter:description" content="Hazard is a new podcast that digs through the muck of different superfund sites accross the US to give a clearer picture of what the threat is and what it will take to clean it up before it's too late. Hosted by journalist Jordan Gass-Poore'" ></meta>

<meta name="description" content="Hazard is a new podcast that digs through the muck of different superfund sites accross the US to give a clearer picture of what the threat is and what it will take to clean it up before it's too late. Hosted by journalist Jordan Gass-Poore'"></meta>

<!-- I prefer the summary_large_image Twitter card for posts. -->
<meta name="twitter:card" content="summary_large_image" ></meta>
<!-- You, you're the creator. -->
<meta name="twitter:creator" content="@NJSpotlightNews" ></meta>
<!-- This property is for the article title, not site title. -->
<meta name="twitter:title" content="Hazard Podcast" ></meta>



<meta property="og:image" content="https://hazardpodcast.com/img/HazardCover.jpg" ></meta>
<meta name="twitter:image" content="https://hazardpodcast.com/img/HazardCover.jpg" ></meta>





<meta property="og:type" content="website" ></meta>



        <script type="application/ld+json">
    {
        "@context": "http://schema.org",
        "@type": "PodcastSeries",
        "url": "https://hazardpodcast.com/rss/podcast/style.xsl",
        "headline": "Hazard Podcast",
        "about": "Hazard is a new podcast that digs through the muck of different superfund sites accross the US to give a clearer picture of what the threat is and what it will take to clean it up before it's too late. Hosted by journalist Jordan Gass-Poore'",
        "image": [
            "https://41.media.tumblr.com/709bb3c371b9924add351bfe3386e946/tumblr_nxdq8uFdx81qzocgko1_1280.jpg"
        ],
        "isAccessibleForFree": "True",
        "isPartOf": {
            "@type": ["CreativeWork", "Product"],
            "name": "Hazard Podcast",
            "productID": "https://hazardpodcast.com"
        },
        "author": {
    "@type": "Person",
    "name": "Jordan Gass-Poore'",
    "description": "Jordan Gass-Pooré (she/her) is an award-winning podcast producer and investigative journalist with more than a decade of journalism experience. Presently, Jordan is the creator, producer, and host of “Hazard NJ,” a limited-series podcast about the impacts of climate change on hazardous Superfund sites in New Jersey.",
},
        "editor": {
    "@type": "Person",
    "name": "Jordan Gass-Poore'",
    "description": "Jordan Gass-Pooré (she/her) is an award-winning podcast producer and investigative journalist with more than a decade of journalism experience. Presently, Jordan is the creator, producer, and host of “Hazard NJ,” a limited-series podcast about the impacts of climate change on hazardous Superfund sites in New Jersey.",
},
        "inLanguage": "en-US",
        "additionalType": "CreativeWork",
        "alternateName": "Hazard Podcast",
        
    }
</script>

      </head>
      <body>
        <div class="wrapper">
            <nav id="top-nav">
                <div id="top-nav-inner">
                    <div id="nav-menu-items">
                        <ul>
                            <li class="home">
                                <a href="https://hazardpodcast.com">Return to Home</a>
                            </li>
                            <li>
                                <a href="https://hazardpodcast.com/about">About</a>
                            </li>
                            <li>
                                <a href="https://hazardpodcast.com/learn">Learn</a>
                            </li>
                            <li>
                                <a href="https://hazardpodcast.com/contact">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <header>
            <h1><svg class="rss-logo" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 256 256"><defs><linearGradient x1=".085" y1=".085" x2=".915" y2=".915" id="a"><stop offset="0" stop-color="#E3702D"/><stop offset=".107" stop-color="#EA7D31"/><stop offset=".35" stop-color="#F69537"/><stop offset=".5" stop-color="#FB9E3A"/><stop offset=".702" stop-color="#EA7C31"/><stop offset=".887" stop-color="#DE642B"/><stop offset="1" stop-color="#D95B29"/></linearGradient></defs><rect width="256" height="256" rx="55" ry="55" fill="#CC5D15"/><rect width="246" height="246" rx="50" ry="50" x="5" y="5" fill="#F49C52"/><rect width="236" height="236" rx="47" ry="47" x="10" y="10" fill="url(#a)"/><circle cx="68" cy="189" r="24" fill="#FFF"/><path d="M160 213h-34a82 82 0 0 0-82-82V97a116 116 0 0 1 116 116z" fill="#FFF"/><path d="M184 213A140 140 0 0 0 44 73V38a175 175 0 0 1 175 175z" fill="#FFF"/></svg><xsl:value-of select="/rss/channel/title"/></h1>
            <div class="aboutfeeds">
                <p>This is a web feed, also known as an RSS feed that you can use to subscribe to the Hazard Podcast.</p>
                <p><span class="big">↘️ <strong>Subscribe</strong> by <button onclick="rssToClipboard(this)"><img src="https://hazardpodcast.com/assets/copy.svg" intrinsicsize="512 x 512" alt="Copy Icon" title="Copy Icon" width="15" height="15"></img> <span class="button-inner">copying the URL</span></button> into your RSS reader.</span></p>
                <p>You can also subscribe through your favorite podcast service: </p>
                <p><ul>
                    <li><a href="https://open.spotify.com/show/3JBxbVpmfoir1feQ5P9OMY" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Spotify</title><path fill="#1DB954" d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.66 0 12 0zm5.521 17.34c-.24.359-.66.48-1.021.24-2.82-1.74-6.36-2.101-10.561-1.141-.418.122-.779-.179-.899-.539-.12-.421.18-.78.54-.9 4.56-1.021 8.52-.6 11.64 1.32.42.18.479.659.301 1.02zm1.44-3.3c-.301.42-.841.6-1.262.3-3.239-1.98-8.159-2.58-11.939-1.38-.479.12-1.02-.12-1.14-.6-.12-.48.12-1.021.6-1.141C9.6 9.9 15 10.561 18.72 12.84c.361.181.54.78.241 1.2zm.12-3.36C15.24 8.4 8.82 8.16 5.16 9.301c-.6.179-1.2-.181-1.38-.721-.18-.601.18-1.2.72-1.381 4.26-1.26 11.28-1.02 15.721 1.621.539.3.719 1.02.419 1.56-.299.421-1.02.599-1.559.3z"/></svg><span> Spotify</span></a></li>
                    <li><a href="https://podcasts.apple.com/us/podcast/faq-nyc/id1422065980" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Apple Podcasts</title><path fill="#9933CC" d="M5.34 0A5.328 5.328 0 000 5.34v13.32A5.328 5.328 0 005.34 24h13.32A5.328 5.328 0 0024 18.66V5.34A5.328 5.328 0 0018.66 0zm6.525 2.568c2.336 0 4.448.902 6.056 2.587 1.224 1.272 1.912 2.619 2.264 4.392.12.59.12 2.2.007 2.864a8.506 8.506 0 01-3.24 5.296c-.608.46-2.096 1.261-2.336 1.261-.088 0-.096-.091-.056-.46.072-.592.144-.715.48-.856.536-.224 1.448-.874 2.008-1.435a7.644 7.644 0 002.008-3.536c.208-.824.184-2.656-.048-3.504-.728-2.696-2.928-4.792-5.624-5.352-.784-.16-2.208-.16-3 0-2.728.56-4.984 2.76-5.672 5.528-.184.752-.184 2.584 0 3.336.456 1.832 1.64 3.512 3.192 4.512.304.2.672.408.824.472.336.144.408.264.472.856.04.36.03.464-.056.464-.056 0-.464-.176-.896-.384l-.04-.03c-2.472-1.216-4.056-3.274-4.632-6.012-.144-.706-.168-2.392-.03-3.04.36-1.74 1.048-3.1 2.192-4.304 1.648-1.737 3.768-2.656 6.128-2.656zm.134 2.81c.409.004.803.04 1.106.106 2.784.62 4.76 3.408 4.376 6.174-.152 1.114-.536 2.03-1.216 2.88-.336.43-1.152 1.15-1.296 1.15-.023 0-.048-.272-.048-.603v-.605l.416-.496c1.568-1.878 1.456-4.502-.256-6.224-.664-.67-1.432-1.064-2.424-1.246-.64-.118-.776-.118-1.448-.008-1.02.167-1.81.562-2.512 1.256-1.72 1.704-1.832 4.342-.264 6.222l.413.496v.608c0 .336-.027.608-.06.608-.03 0-.264-.16-.512-.36l-.034-.011c-.832-.664-1.568-1.842-1.872-2.997-.184-.698-.184-2.024.008-2.72.504-1.878 1.888-3.335 3.808-4.019.41-.145 1.133-.22 1.814-.211zm-.13 2.99c.31 0 .62.06.844.178.488.253.888.745 1.04 1.259.464 1.578-1.208 2.96-2.72 2.254h-.015c-.712-.331-1.096-.956-1.104-1.77 0-.733.408-1.371 1.112-1.745.224-.117.534-.176.844-.176zm-.011 4.728c.988-.004 1.706.349 1.97.97.198.464.124 1.932-.218 4.302-.232 1.656-.36 2.074-.68 2.356-.44.39-1.064.498-1.656.288h-.003c-.716-.257-.87-.605-1.164-2.644-.341-2.37-.416-3.838-.218-4.302.262-.616.974-.966 1.97-.97z"/></svg>

<!-- https://simpleicons.org/?q=apple%20pod --><span> Apple Podcasts</span></a></li>
                    <li><a href="https://music.amazon.com/podcasts/f36c7ea7-0e39-48be-b9aa-a2914be8a837/hazard-nj" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Amazon Music</title><path fill="#FF9900" d="M.045 18.02c.072-.116.187-.124.348-.022 3.636 2.11 7.594 3.166 11.87 3.166 2.852 0 5.668-.533 8.447-1.595l.315-.14c.138-.06.234-.1.293-.13.226-.088.39-.046.525.13.12.174.09.336-.12.48-.256.19-.6.41-1.006.654-1.244.743-2.64 1.316-4.185 1.726a17.617 17.617 0 01-10.951-.577 17.88 17.88 0 01-5.43-3.35c-.1-.074-.151-.15-.151-.22 0-.047.021-.09.051-.13zm6.565-6.218c0-1.005.247-1.863.743-2.577.495-.71 1.17-1.25 2.04-1.615.796-.335 1.756-.575 2.912-.72.39-.046 1.033-.103 1.92-.174v-.37c0-.93-.105-1.558-.3-1.875-.302-.43-.78-.65-1.44-.65h-.182c-.48.046-.896.196-1.246.46-.35.27-.575.63-.675 1.096-.06.3-.206.465-.435.51l-2.52-.315c-.248-.06-.372-.18-.372-.39 0-.046.007-.09.022-.15.247-1.29.855-2.25 1.82-2.88.976-.616 2.1-.975 3.39-1.05h.54c1.65 0 2.957.434 3.888 1.29.135.15.27.3.405.48.12.165.224.314.283.45.075.134.15.33.195.57.06.254.105.42.135.51.03.104.062.3.076.615.01.313.02.493.02.553v5.28c0 .376.06.72.165 1.036.105.313.21.54.315.674l.51.674c.09.136.136.256.136.36 0 .12-.06.226-.18.314-1.2 1.05-1.86 1.62-1.963 1.71-.165.135-.375.15-.63.045a6.062 6.062 0 01-.526-.496l-.31-.347a9.391 9.391 0 01-.317-.42l-.3-.435c-.81.886-1.603 1.44-2.4 1.665-.494.15-1.093.227-1.83.227-1.11 0-2.04-.343-2.76-1.034-.72-.69-1.08-1.665-1.08-2.94l-.05-.076zm3.753-.438c0 .566.14 1.02.425 1.364.285.34.675.512 1.155.512.045 0 .106-.007.195-.02.09-.016.134-.023.166-.023.614-.16 1.08-.553 1.424-1.178.165-.28.285-.58.36-.91.09-.32.12-.59.135-.8.015-.195.015-.54.015-1.005v-.54c-.84 0-1.484.06-1.92.18-1.275.36-1.92 1.17-1.92 2.43l-.035-.02zm9.162 7.027c.03-.06.075-.11.132-.17.362-.243.714-.41 1.05-.5a8.094 8.094 0 011.612-.24c.14-.012.28 0 .41.03.65.06 1.05.168 1.172.33.063.09.099.228.099.39v.15c0 .51-.149 1.11-.424 1.8-.278.69-.664 1.248-1.156 1.68-.073.06-.14.09-.197.09-.03 0-.06 0-.09-.012-.09-.044-.107-.12-.064-.24.54-1.26.806-2.143.806-2.64 0-.15-.03-.27-.087-.344-.145-.166-.55-.257-1.224-.257-.243 0-.533.016-.87.046-.363.045-.7.09-1 .135-.09 0-.148-.014-.18-.044-.03-.03-.036-.047-.02-.077 0-.017.006-.03.02-.063v-.06z"/></svg>


<!-- https://simpleicons.org/?q=github -->
<span> Amazon Music</span></a></li>
                    <li><a href="https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkLnBvZGJlYW4uY29tL0hhemFyZE5KL2ZlZWQueG1s" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Google Podcasts</title><path fill="#4285F4" d="M1.503 9.678c-.83 0-1.5.67-1.5 1.5v1.63a1.5 1.5 0 103 0v-1.63c0-.83-.67-1.5-1.5-1.5zm20.994 0c-.83 0-1.5.67-1.5 1.5v1.63a1.5 1.5 0 103 0v-1.63c0-.83-.67-1.5-1.5-1.5zM6.68 14.587c-.83 0-1.5.67-1.5 1.5v1.63a1.5 1.5 0 103 0v-1.62c0-.83-.67-1.5-1.5-1.5zm0-9.817c-.83 0-1.5.67-1.5 1.5v5.357a1.5 1.5 0 003 0V6.258c0-.83-.67-1.5-1.5-1.5zm10.638 0c-.83 0-1.5.67-1.5 1.5v1.64a1.5 1.5 0 003 0V6.27c0-.83-.67-1.5-1.5-1.5zM12 0c-.83 0-1.5.67-1.5 1.5v1.63a1.5 1.5 0 103 0V1.5c0-.83-.67-1.499-1.5-1.499zm0 19.355c-.83 0-1.5.67-1.5 1.5v1.64a1.5 1.5 0 103 .01v-1.64c0-.82-.67-1.5-1.5-1.5zm5.319-8.457c-.83 0-1.5.68-1.5 1.5v5.328a1.5 1.5 0 003 0v-5.329c0-.83-.67-1.5-1.5-1.5zM12 6.128c-.83 0-1.5.68-1.5 1.5v8.728a1.5 1.5 0 003 0V7.638c0-.83-.67-1.5-1.5-1.5z"/></svg><span> Google Podcasts</span></a></li>
                    <li><a href="https://overcast.fm/itunes1622849571" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Overcast</title><path fill="#FC7E0F" d="M12 24C5.389 24.018.017 18.671 0 12.061V12C0 5.35 5.351 0 12 0s12 5.35 12 12c0 6.649-5.351 12-12 12zm0-4.751l.9-.899-.9-3.45-.9 3.45.9.899zm-1.15-.05L10.4 20.9l1.05-1.052-.6-.649zm2.3 0l-.6.601 1.05 1.051-.45-1.652zm.85 3.102L12 20.3l-2 2.001c.65.1 1.3.199 2 .199s1.35-.05 2-.199zM12 1.5C6.201 1.5 1.5 6.201 1.5 12c-.008 4.468 2.825 8.446 7.051 9.899l2.25-8.35c-.511-.372-.809-.968-.801-1.6 0-1.101.9-2.001 2-2.001s2 .9 2 2.001c0 .649-.301 1.2-.801 1.6l2.25 8.35c4.227-1.453 7.06-5.432 7.051-9.899 0-5.799-4.701-10.5-10.5-10.5zm6.85 15.7c-.255.319-.714.385-1.049.15-.313-.207-.4-.628-.194-.941.014-.021.028-.04.044-.06 0 0 1.35-1.799 1.35-4.35s-1.35-4.35-1.35-4.35c-.239-.289-.198-.719.091-.957.02-.016.039-.031.06-.044.335-.235.794-.169 1.049.15.1.101 1.65 2.15 1.65 5.2S18.949 17.1 18.85 17.2zm-3.651-1.95c-.3-.3-.249-.85.051-1.15 0 0 .75-.799.75-2.1s-.75-2.051-.75-2.1c-.3-.301-.3-.801-.051-1.15.232-.303.666-.357.969-.125.029.022.056.047.082.074C16.301 8.75 17.5 10 17.5 12s-1.199 3.25-1.25 3.301c-.301.299-.75.25-1.051-.051zm-6.398 0c-.301.301-.75.35-1.051.051C7.699 15.199 6.5 14 6.5 12s1.199-3.199 1.25-3.301c.301-.299.801-.299 1.051.051.3.3.249.85-.051 1.15 0 .049-.75.799-.75 2.1s.75 2.1.75 2.1c.3.3.351.799.051 1.15zm-2.602 2.101c-.335.234-.794.169-1.05-.15C5.051 17.1 3.5 15.05 3.5 12s1.551-5.1 1.649-5.2c.256-.319.715-.386 1.05-.15.313.206.4.628.194.941-.013.02-.028.04-.043.059C6.35 7.65 5 9.449 5 12s1.35 4.35 1.35 4.35c.25.3.15.75-.151 1.001z"/></svg><span> Overcast</span></a></li>
                    <li><a href="http://pcasts.in/feed/feed.podbean.com/HazardNJ/feed.xml" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Pocket Casts</title><path fill="#F43E37" d="M12,0C5.372,0,0,5.372,0,12c0,6.628,5.372,12,12,12c6.628,0,12-5.372,12-12 C24,5.372,18.628,0,12,0z M15.564,12c0-1.968-1.596-3.564-3.564-3.564c-1.968,0-3.564,1.595-3.564,3.564 c0,1.968,1.595,3.564,3.564,3.564V17.6c-3.093,0-5.6-2.507-5.6-5.6c0-3.093,2.507-5.6,5.6-5.6c3.093,0,5.6,2.507,5.6,5.6H15.564z M19,12c0-3.866-3.134-7-7-7c-3.866,0-7,3.134-7,7c0,3.866,3.134,7,7,7v2.333c-5.155,0-9.333-4.179-9.333-9.333 c0-5.155,4.179-9.333,9.333-9.333c5.155,0,9.333,4.179,9.333,9.333H19z"/></svg><span> Pocket Casts</span></a></li>
                    <li><a href="https://podcastaddict.com/" target="_blank"><svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Podcast Addict</title><path fill="#F4842D" d="M5.36.037C2.41.037 0 2.447 0 5.397v13.207c0 2.95 2.41 5.36 5.36 5.36h13.28c2.945 0 5.36-2.41 5.36-5.36V5.396c0-2.95-2.415-5.36-5.36-5.36zm6.585 4.285a7.72 7.72 0 017.717 7.544l.005 7.896h-3.39v-1.326a7.68 7.68 0 01-4.327 1.326 7.777 7.777 0 01-2.384-.378v-4.63a3.647 3.647 0 002.416.91 3.666 3.666 0 003.599-2.97h-1.284a2.416 2.416 0 01-4.73-.66v-.031c0-1.095.728-2.023 1.728-2.316V8.403a3.67 3.67 0 00-2.975 3.6v6.852a7.72 7.72 0 013.625-14.533zm.031 1.87V7.43h.006a4.575 4.575 0 014.573 4.574v.01h1.237v-.01a5.81 5.81 0 00-5.81-5.81zm0 2.149v1.246h.006a2.413 2.413 0 012.415 2.416v.01h1.247v-.01a3.662 3.662 0 00-3.662-3.662zm0 2.252c-.78 0-1.409.629-1.409 1.41 0 .78.629 1.409 1.41 1.409.78 0 1.409-.629 1.409-1.41 0-.78-.629-1.409-1.41-1.409z"/></svg><span> Podcast Addict</span></a></li>
                </ul></p>
            </div>
            <div class="head">
                <div class="avatar">
                <img src="https://hazardpodcast.com/assets/android-chrome-192x192.png" alt="Hazard Logo"/>
                </div>
                <div class="description">
                <p><xsl:value-of select="/rss/channel/description"/></p>
                <p><a hreflang="en"><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/></xsl:attribute>Visit Website &#x2192;</a></p>
                </div>
            </div>
            </header>
            <main>
            <h2>🎙️ Recent Episodes</h2>
            <xsl:for-each select="/rss/channel/item">
                <article>
                    <div class="article-text">
                        <h3><a hreflang="en"><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></h3>
                        <p><xsl:value-of select="description" /></p>
                        <footer>Published: <time><xsl:value-of select="pubDate" /></time></footer>
                    </div>
                </article>
            </xsl:for-each>
            <p class="about"><img src="https://hazardpodcast.com/assets/favicon-32x32.png" alt="Hazard Podcast icon" width="24" height="24" /><a href="https://hazardpodcast.com/about/">About the Hazard Podcast</a>.</p>
            </main>
        </div>
        <script>
            function rssToClipboard(clickedObj){
                navigator.clipboard.writeText(`https://hazardpodcast.com/rss/podcast/index.xml`);
            }
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>