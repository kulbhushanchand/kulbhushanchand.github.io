---
title: "Website is up and ready!! 🎉"
excerpt: "My website is up and ready."
date: 2021-06-27 20:41:01 +05:30 # eg "2021-06-16 16:02:57 +05:30"
last_modified_at: 2021-06-30 00:50:50 +05:30
toc: 
toc_sticky: 
tags:
  - jekyll
---

Finally, my website is up and ready (again). It's the third iteration, with the [first](https://github.com/kulbhushanchand/kulbhushan-chand.github.io-v1) and [second](https://github.com/kulbhushanchand/kulbhushanchand.github.io-v2) ones resting peacefully in GitHub repositories, which were more of a learning experience than serious blogging. This time I'm serious 😠! 

## Tools and technologies used 🛠️

- [Jekyll](https://jekyllrb.com/): Static site generator
- [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes): Theme for jekyll website
- [VSCode](https://github.com/microsoft/vscode): Editor
- [RStudio](https://github.com/rstudio/rstudio): To knit r-markdown files
- [GitHub Desktop](https://github.com/desktop/desktop): For version control
- [GitHub](https://github.com/): For source code and website hosting
- Tea ☕: Fuel

## Workflow ⚙️

I am using both **markdown** and **r-markdown** for writing posts and prefer the latter when there is a need for an executable R code. To support the R-html-widgets, a custom [`knit`](https://github.com/{{ site.repository }}/blob/master/_source/custom-function.R) function is used that saves the dependencies in the assets folder and insert the code to load them at the end of knitted markdown files. In this way, we can avoid loading them on every page except ones using them for performance gains.

## Performance 💯

The theme of this website was already performant. There was some scope of gaining a bit more performance, which I did by creating custom fonts and serving the relevant CSS from a single main file. Finally, able to land the sweet 💯 spot in the google lighthouse audit.

{% include figure class="align-center" image_path="/assets/images/posts/website-lighthouse-audit-desktop.jpg" alt="Lighthouse audit" caption="Lighthouse audit for the website in desktop mode (all green 💚)" %}

## Links 🔗

The source code is available at the [GitHub repository](https://github.com/kulbhushanchand/kulbhushanchand.github.io).


*[CSS]: Cascading Style Sheets