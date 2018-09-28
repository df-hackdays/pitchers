module.exports = {
    siteMetadata: {
        title: 'Canada Learning Code'
    },
    plugins: [
        'gatsby-plugin-react-helmet',
        {
            resolve: `gatsby-plugin-manifest`,
            options: {
                name: 'gatsby-starter-material-ui',
                short_name: 'starter',
                start_url: '/',
                background_color: 'cadetblue',
                theme_color: 'cadetblue',
                display: 'minimal-ui',
                icon: 'src/images/gatsby-icon.png' // This path is relative to the root of the site.
            }
        },
        'gatsby-plugin-offline'
    ]
};
