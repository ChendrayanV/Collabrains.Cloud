html -Content {
    head -Content {
        Title -Content "Reactor | Home"
        Link -href "https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css" -rel "stylesheet"
        script -src "https://cdn.metroui.org.ua/v4/js/metro.min.js"
    }
    body -Content {
        # Menu Bar
        Div -Class "container bg-green fg-white pos-fixed fixed-top z-top" -Content {
            header -Class "app-bar container bg-green fg-white pos-relative" `
                -Attributes @{'data-role' = 'appbar'; 'data-expand-point' = 'md' } -Content {
                a -href "#" -Class "brand fg-white no-hover" -Content "REACTOR" -Target "_blank"
                ul -Class "app-bar-menu ml-auto" -Content {
                    li -Content { a -href "/about" -Content "About" }
                    li -Content { a -href "/dashboard" -Content "Dashboard" }
                    li -Content { a -href "/contact" -Content "Contact" }
                    li -Content { a -href "/calendar-event" -Content "Book an Event" }
                }
            }
        }
        (1..3).ForEach({ br })
        Div -Class 'container' -Content {
            $items = Invoke-RestMethod -Uri "http://product-service/products"
            selecttag -Content {
                foreach($Item in $Items.items) {
                    option -Content $Item.brand
                }
            } -name 'reason'
        }
    }
}