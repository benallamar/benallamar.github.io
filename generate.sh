#!/bin/bash

# Copy blog content
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io

# Copy 404 page
wget --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links --content-on-error --timestamping http://benallamar.github.io/404.html

# Copy sitemaps
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io/sitemap.xsl
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io/sitemap.xml
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io/sitemap-pages.xml
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io/sitemap-posts.xml
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io/sitemap-authors.xml
wget --recursive --no-host-directories  --adjust-extension --timeout=30 --no-parent --convert-links http://benallamar.github.io/sitemap-tags.xml

# Replace localhost with domain
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's/http:\/\/benallamar.github.io/http:\/\/benallamar.github.io/g' {} +
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's/benallamar.github.io/benallamar.github.io/g' {} +
LC_ALL=C find . -type f -not -wholename *.git* -exec sed -i '' -e 's/http:\/\/www.gravatar.com/https:\/\/www.gravatar.com/g' {} +

# Set up Github Pages CNAME
echo "benallamar.github.io" > CNAME

echo "Deploy to github"
                git add -A
                git commit -m "Update on the website at $(date)"
                git push origin master:master master:gh-pages -f
