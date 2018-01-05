# packages 
pacman::p_load(shiny, dplyr, ggplot2)

# UI
ui <- shinyUI(
  fluidPage(
    headerPanel(title = "Shiny Tweet JS"),
    tags$head(
      tags$script("!function(d,s,id){var js,fjs=d.getElementsByTagName(s)    [0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','twitter-wjs');")
    ),
    tabsetPanel(
      # widget custimaziation: https://publish.twitter.com/?url=https%3A%2F%2Ftwitter.com%2FTwitterDev%2Ftimelines%2F539487832448843776&ref_src=twsrc%5Etfw&ref_url=https%3A%2F%2Fdev.twitter.com%2Fweb%2Fembedded-timelines#
      tabPanel("News Feeds",
               br(),
               column(width = 4,
                      HTML('<a class="twitter-timeline" 
                           href="https://twitter.com/OracleofBTC">
                           Warren is advertising - Curated tweets by TwitterDev
                           </a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>'
                      )
                      ),
               column(width = 4,
                      HTML('<a class="twitter-timeline" 
                           href="https://twitter.com/EtherWorldNews">
                           Etherium - Curated tweets by TwitterDev
                           </a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>'
                      )
                      ),
               column(width = 4,
                      HTML('<a class="twitter-follow-button"
                    href="https://twitter.com/TwitterDev"
                           data-size="large">
                           Follow @TwitterDev</a>'),
                      tags$blockquote(textOutput("tweet")),
                      br(),
                      # uses script above
                      HTML('
                           <blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">
                           Want to break into AI? You can learn Deep Learning from new deeplearning.ai courses on Coursera:
                           <a href="https://www.coursera.org/specializations/deep-learning">https://www.coursera.org/specializations/deep-learning</a></p>&mdash; Andrew Ng (@AndrewYNg)
                           <a href="https://twitter.com/AndrewYNg/status/894994683931148288?ref_src=twsrc%5Etfw">August 8, 2017</a>
                           </blockquote>
                           '),
                      br(),
                      # uses to and depends on id. 
                      a("Soccer", 
                        class="twitter-timeline", 
                        href = "https://twitter.com/pssGuy/timelines/524678699061641216",
                        "data-widget-id" = "524686407298596864"
                      )
                    )
               ),
      tabPanel("Big news",
               br(),
               HTML('<a class="twitter-grid" data-lang="de" data-limit="10" href="https://twitter.com/TwitterDev/timelines/539487832448843776?ref_src=twsrc%5Etfw">National Park Tweets</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>')
            )
        )
    )
)

load("data/rt_sample.Rdata")


# server side
server <- function(input, output, session) {
  output$tweet <- renderText({
    rt_sample$text[1]
  })
}

shinyApp(ui, server)