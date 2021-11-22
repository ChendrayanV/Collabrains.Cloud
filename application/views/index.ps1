# html -Content {
#     head -Content {
#         Title -Content "Reactor | Home"
#         Link -href "https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css" -rel "stylesheet"
#         script -src "https://cdn.metroui.org.ua/v4/js/metro.min.js"
#     }
#     body -Content {
#         # Menu Bar
#         Div -Class "container bg-green fg-white pos-fixed fixed-top z-top" -Content {
#             header -Class "app-bar container bg-green fg-white pos-relative" `
#                 -Attributes @{'data-role' = 'appbar'; 'data-expand-point' = 'md' } -Content {
#                 a -href "#" -Class "brand fg-white no-hover" -Content "REACTOR" -Target "_blank"
#                 ul -Class "app-bar-menu ml-auto" -Content {
#                     li -Content { a -href "/about" -Content "About" }
#                     li -Content { a -href "/dashboard" -Content "Dashboard" }
#                     li -Content { a -href "/contact" -Content "Contact" }
#                     li -Content { a -href "/calendar-event" -Content "Book an Event" }
#                 }
#             }
#         }
#         (1..3).ForEach({ br })
#         Div -Class 'container' -Content {
#             $items = Invoke-RestMethod -Uri "http://product-service:3000/products"
#             selecttag -Content {
#                 foreach($Item in $Items.items) {
#                     option -Content $Item.brand
#                 }
#             } -name 'reason'
#         }
#     }
# }

param($data)

function CustomCard {
    Param (
        $ImageSrc
    )

    Div -Class 'cell-lg-4' -Content {
        Div -Class 'price-item text-center bg-white win-shadow' -Content {
            Div -Class 'price-item-header p-6' -Content {
                Div -Class 'img-container rounded' -Content {
                    img -src $($ImageSrc)
                    Div -Class 'image-overlay op-green' 
                }
            }
        }
    }
}
return html -Content {
    head -Content {
        Title -Content "Az Container Apps | Home"
        Link -href "https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css" -rel "stylesheet"
        script -src "https://cdn.metroui.org.ua/v4/js/metro.min.js"
    }
    body -Content {
        (1..3).ForEach({ br })
        Div -Class 'container' -Content {
            h3 -Class 'Secondary fg-lightRed' -Content 'Colors of Cuisine...' -Style 'text-align:center'
            hr
            Div -Class 'row flex-align-center rounded' -Content {
                @(
                    "https://media.istockphoto.com/photos/ghee-roast-dosa-and-idlii-picture-id1306134869?b=1&k=20&m=1306134869&s=170667a&w=0&h=o4mjTxdQq0mMqe3tyY6bmmPldxryUpU49fs8tUpIneA=",
                    "https://media.istockphoto.com/photos/dabba-masala-picture-id465015726?b=1&k=20&m=465015726&s=170667a&w=0&h=IsNYymgb7aX2qZcZ-IdBVZ7xC1m6JNJ9ZFOcEvF_PiM=",
                    "https://images.unsplash.com/photo-1509359149003-657ef23eaf04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWFzYWxhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                ).ForEach(
                    {
                        CustomCard -ImageSrc $($_)  
                    }
                )
                
            }
            hr 
            # $items = Invoke-RestMethod -Uri "http://localhost:3000/products"
            # selecttag -Content {
            #     foreach($Item in $Items.items) {
            #         option -Content $($Item.Name)
            #     }
            # } -name 'food-name'
            
        }
    }
}