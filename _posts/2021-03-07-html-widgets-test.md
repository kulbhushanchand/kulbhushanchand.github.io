---
title: "Html widgets test"
excerpt: "Excerpt"
output:
  md_document:
    pandoc_args: ["--wrap=none"]
    variant: gfm+footnotes
    preserve_yaml: TRUE
knit: (function(inputFile, encoding) {
  knitr::knit(inputFile, output = paste0('../_posts/',stringr::str_remove_all(inputFile, paste0(here::here(), '|', "/_source/", '|', "\\.Rmd")), '.md'));
  l = knitr::knit_meta();
  dep_dir = stringr::str_c(here::here(),'/assets/htmlwidgets_deps');
  base_path = stringr::str_c(here::here(),'/');
  includes_dir = "_includes/htmlwidgets/";
  hrefFilter = function(x) {paste0("/", x)};
  if (length(l) > 0) {dir.create(dep_dir, showWarnings = FALSE, recursive = TRUE)};
  l <- lapply(unique(l), function(dep) {
      dep <- htmltools::copyDependencyToDir(dep, dep_dir, FALSE);
      dep <- htmltools::makeDependencyRelative(dep, base_path, FALSE);
      dep } );
  l <- htmltools::renderDependencies(l,  hrefFilter=hrefFilter);
  render_markdown();
  prev_doc_hook <- knitr::knit_hooks$get("document");
  knitr::knit_hooks$set(document = function(x) {prev_doc_hook(append(x, l))});
  knitr::knit(inputFile, output = paste0('../_posts/',stringr::str_remove_all(inputFile, paste0(here::here(), '|', "/_source/", '|', "\\.Rmd")), '.md'))
  })
date: "2021/03/07"
---



This is a template for post written in Rmd. The `knitr::knit` is used instead of `rmarkdown::render` to bypass the `pandoc` rendering, because `pandoc` was messing with the liquid markups and changes other formatting during Rmd -> md.




```r
library(leaflet)

m <- leaflet(width="100%", options = leafletOptions(attributionControl = FALSE)) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map
```

<div class="figure">
<!--html_preserve--><div id="htmlwidget-ab9ee674c13e2bf4752b" style="width:100%;height:450px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-ab9ee674c13e2bf4752b">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}},"attributionControl":false},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[-36.852,174.768,null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},"The birthplace of R",null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-36.852,-36.852],"lng":[174.768,174.768]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">plot of chunk unnamed-chunk-1</p>
</div>




```r
library(ggplot2)
library(plotly)
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
            geom_bar(position = "dodge")
ggplotly(p)
```

<div class="figure">
<!--html_preserve--><div id="htmlwidget-b77cfb9e70b996ba4c01" style="width:100%;height:450px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-b77cfb9e70b996ba4c01">{"x":{"data":[{"orientation":"v","width":[0.1125,0.1125,0.1125,0.1125,0.112500000000001],"base":[0,0,0,0,0],"x":[0.60625,1.60625,2.60625,3.60625,4.60625],"y":[210,96,84,205,146],"text":["count:  210<br />cut: Fair<br />clarity: I1","count:   96<br />cut: Good<br />clarity: I1","count:   84<br />cut: Very Good<br />clarity: I1","count:  205<br />cut: Premium<br />clarity: I1","count:  146<br />cut: Ideal<br />clarity: I1"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(68,1,84,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"I1","legendgroup":"I1","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.1125,0.112500000000001],"base":[0,0,0,0,0],"x":[0.71875,1.71875,2.71875,3.71875,4.71875],"y":[466,1081,2100,2949,2598],"text":["count:  466<br />cut: Fair<br />clarity: SI2","count: 1081<br />cut: Good<br />clarity: SI2","count: 2100<br />cut: Very Good<br />clarity: SI2","count: 2949<br />cut: Premium<br />clarity: SI2","count: 2598<br />cut: Ideal<br />clarity: SI2"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(70,51,126,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"SI2","legendgroup":"SI2","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.1125,0.112500000000001],"base":[0,0,0,0,0],"x":[0.83125,1.83125,2.83125,3.83125,4.83125],"y":[408,1560,3240,3575,4282],"text":["count:  408<br />cut: Fair<br />clarity: SI1","count: 1560<br />cut: Good<br />clarity: SI1","count: 3240<br />cut: Very Good<br />clarity: SI1","count: 3575<br />cut: Premium<br />clarity: SI1","count: 4282<br />cut: Ideal<br />clarity: SI1"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(54,92,141,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"SI1","legendgroup":"SI1","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.1125,0.112500000000001],"base":[0,0,0,0,0],"x":[0.94375,1.94375,2.94375,3.94375,4.94375],"y":[261,978,2591,3357,5071],"text":["count:  261<br />cut: Fair<br />clarity: VS2","count:  978<br />cut: Good<br />clarity: VS2","count: 2591<br />cut: Very Good<br />clarity: VS2","count: 3357<br />cut: Premium<br />clarity: VS2","count: 5071<br />cut: Ideal<br />clarity: VS2"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(39,127,142,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"VS2","legendgroup":"VS2","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.112500000000001,0.112500000000001],"base":[0,0,0,0,0],"x":[1.05625,2.05625,3.05625,4.05625,5.05625],"y":[170,648,1775,1989,3589],"text":["count:  170<br />cut: Fair<br />clarity: VS1","count:  648<br />cut: Good<br />clarity: VS1","count: 1775<br />cut: Very Good<br />clarity: VS1","count: 1989<br />cut: Premium<br />clarity: VS1","count: 3589<br />cut: Ideal<br />clarity: VS1"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(31,161,135,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"VS1","legendgroup":"VS1","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.112500000000001,0.112500000000001],"base":[0,0,0,0,0],"x":[1.16875,2.16875,3.16875,4.16875,5.16875],"y":[69,286,1235,870,2606],"text":["count:   69<br />cut: Fair<br />clarity: VVS2","count:  286<br />cut: Good<br />clarity: VVS2","count: 1235<br />cut: Very Good<br />clarity: VVS2","count:  870<br />cut: Premium<br />clarity: VVS2","count: 2606<br />cut: Ideal<br />clarity: VVS2"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(74,193,109,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"VVS2","legendgroup":"VVS2","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.112500000000001,0.112500000000001],"base":[0,0,0,0,0],"x":[1.28125,2.28125,3.28125,4.28125,5.28125],"y":[17,186,789,616,2047],"text":["count:   17<br />cut: Fair<br />clarity: VVS1","count:  186<br />cut: Good<br />clarity: VVS1","count:  789<br />cut: Very Good<br />clarity: VVS1","count:  616<br />cut: Premium<br />clarity: VVS1","count: 2047<br />cut: Ideal<br />clarity: VVS1"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(159,218,58,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"VVS1","legendgroup":"VVS1","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"orientation":"v","width":[0.1125,0.1125,0.1125,0.112500000000001,0.112500000000001],"base":[0,0,0,0,0],"x":[1.39375,2.39375,3.39375,4.39375,5.39375],"y":[9,71,268,230,1212],"text":["count:    9<br />cut: Fair<br />clarity: IF","count:   71<br />cut: Good<br />clarity: IF","count:  268<br />cut: Very Good<br />clarity: IF","count:  230<br />cut: Premium<br />clarity: IF","count: 1212<br />cut: Ideal<br />clarity: IF"],"type":"bar","marker":{"autocolorscale":false,"color":"rgba(253,231,37,1)","line":{"width":1.88976377952756,"color":"transparent"}},"name":"IF","legendgroup":"IF","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":50.0943683409437,"r":7.30593607305936,"b":64.0487062404871,"l":48.9497716894977},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.4,5.6],"tickmode":"array","ticktext":["Fair","Good","Very Good","Premium","Ideal"],"tickvals":[1,2,3,4,5],"categoryorder":"array","categoryarray":["Fair","Good","Very Good","Premium","Ideal"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"cut","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-253.55,5324.55],"tickmode":"array","ticktext":["0","1000","2000","3000","4000","5000"],"tickvals":[0,1000,2000,3000,4000,5000],"categoryorder":"array","categoryarray":["0","1000","2000","3000","4000","5000"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"count","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":0.711286089238845},"annotations":[{"text":"clarity","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"378c33552ece":{"x":{},"fill":{},"type":"bar"}},"cur_data":"378c33552ece","visdat":{"378c33552ece":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">plot of chunk unnamed-chunk-2</p>
</div>



<script src="/assets/htmlwidgets_deps/htmlwidgets-1.5.3/htmlwidgets.js"></script>
<script src="/assets/htmlwidgets_deps/jquery-1.12.4/jquery.min.js"></script>
<link href="/assets/htmlwidgets_deps/leaflet-1.3.1/leaflet.css" rel="stylesheet" />
<script src="/assets/htmlwidgets_deps/leaflet-1.3.1/leaflet.js"></script>
<link href="/assets/htmlwidgets_deps/leafletfix-1.0.0/leafletfix.css" rel="stylesheet" />
<script src="/assets/htmlwidgets_deps/proj4-2.6.2/proj4.min.js"></script>
<script src="/assets/htmlwidgets_deps/Proj4Leaflet-1.0.1/proj4leaflet.js"></script>
<link href="/assets/htmlwidgets_deps/rstudio_leaflet-1.3.1/rstudio_leaflet.css" rel="stylesheet" />
<script src="/assets/htmlwidgets_deps/leaflet-binding-2.0.4.1/leaflet.js"></script>
<script src="/assets/htmlwidgets_deps/plotly-binding-4.9.3/plotly.js"></script>
<script src="/assets/htmlwidgets_deps/setprototypeof-0.1/setprototypeof.js"></script>
<script src="/assets/htmlwidgets_deps/typedarray-0.1/typedarray.min.js"></script>
<script src="/assets/htmlwidgets_deps/jquery-3.5.1/jquery.min.js"></script>
<link href="/assets/htmlwidgets_deps/crosstalk-1.1.1/css/crosstalk.css" rel="stylesheet" />
<script src="/assets/htmlwidgets_deps/crosstalk-1.1.1/js/crosstalk.min.js"></script>
<link href="/assets/htmlwidgets_deps/plotly-htmlwidgets-css-1.57.1/plotly-htmlwidgets.css" rel="stylesheet" />
<script src="/assets/htmlwidgets_deps/plotly-main-1.57.1/plotly-latest.min.js"></script>
