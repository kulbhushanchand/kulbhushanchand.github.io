---
title: "Website is up and ready!! 🎉"
excerpt: "My website is up and ready."
date: 2021-06-27 20:41:01 +05:30 # eg "2021-06-16 16:02:57 +05:30"
last_modified_at: 2021-06-27 20:41:06 +05:30
toc: 
toc_sticky: 
tags:
  - jekyll
---

Finally, my website is up and ready (again). It's the second iteration, with the first one resting peacefully in an [archived repository](https://github.com/kulbhushanchand/kulbhushanchand.github.io-old).

## Tools and technologies used 🛠️

- [Jekyll](https://jekyllrb.com/): Static site generator
- [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes): Theme for jekyll website
- [VSCode](https://github.com/microsoft/vscode): Editor
- [RStudio](https://github.com/rstudio/rstudio): To knit r-markdown files
- [GitHub Desktop](https://github.com/desktop/desktop): For version control
- [GitHub](https://github.com/): For website hosting
- Tea ☕: Fuel

## Workflow ⚙️

I am using both **markdown** and **r-markdown** for writing posts and prefer the latter when there is a need for an executable R code. To support the R-html-widgets, a custom [`knit`]({{ site.url }}{{ site.baseurl }}/_source/custom-function.R) function is used that saves the dependencies in the assets folder and insert the code to load them at the end of knitted markdown files. In this way, we can avoid loading them on every page except ones using them for performance gains.

## Performance 💯

Speaking of performance, the google lighthouse audit for local testing passed the homepage with flying numbers.

{% include figure class="align-center" image_path="/assets/images/posts/website-lighthouse-audit-desktop.jpg" alt="Lighthouse audit" caption="Lighthouse audit for the website in desktop mode (all green 💚)" %}

## Links 🔗

The source code is available at the [GitHub repository](https://github.com/kulbhushanchand/kulbhushanchand.github.io). You are free to fork and use for your project.

