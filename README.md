# London Property Pulse
A London property analytics dashboard

### Project motivation
Use Go to scrape data, process it and produce data analytic visuals, as well as leverage many of the language features. This will also be my first time using Templ and HTMX for the server-side rendering of content. 

> Disclaimer: This scraper is created for educational purposes only and should not be used for any malicious or illegal activity.

### How to use the project
This README assumes that you have the latest version of Go (1.22) and it's toolchain installed. If not, visit [go.dev](https://go.dev/doc/install) to install and then the [VS Code docs](https://learn.microsoft.com/en-us/azure/developer/go/configure-visual-studio-code) to configure VS Code to use Go. 

#### Installation
Clone the repo and run `go build && ./london-property-pulse` to use it locally. 

#### Install dependencies:
Run `go mod download` in the project directory to download dependencies.


Alternatively, you can build and run it with Docker. If this is new to you, follow the instructions from Docker on [building images](https://docs.docker.com/language/golang/build-images/) and [running containers](https://docs.docker.com/language/golang/run-containers/).

### Tech
As mentioned above, this is a Go project, but here are some more details about what is being used: 
- [Go](https://go.dev/): version 1.22
    - Router: Upgraded net/http router from 1.22 instead of [Chi](https://github.com/go-chi/chi)
    - [Air](https://github.com/cosmtrek/air): Live reload utility
    - [Colly](https://github.com/gocolly/colly): Scraping framework
    - [Rod](https://github.com/go-rod/rod): Browser automation tool
- [Postgres](https://www.postgresql.org/): Relational database
    - [SQLC](https://docs.sqlc.dev/en/stable/index.html#): SQL compiler
    - [Goose](https://github.com/pressly/goose): Migration tool
- [Docker](https://www.docker.com/): Containeriser
- [Go-echarts](https://github.com/go-echarts/go-echarts): Chart library
- [Templ](https://templ.guide): Templating tool for Go
- [HTMX](https://htmx.org/): HTML as hypertext

### Features
- Users can input a London (UK) postcode and view:
    - Relative value of other properties sold in the same post code / street with dates of sale
    - Ownership and property value history 
- Users can also view property analytics trends across the city

### Main parts of the project
- Data scraping
    - Designing data models
    - Concurrent scraping of sites
    - Piping data to the DB
    - Cleaning / removing duplicates
    - Timing of scraping / cron-jobs
- Visualisation
- Ability to add data to the database via CSV
- CI / CD
    - Testing, formatting, linting, security
    - Containerising
- Deploying and hosting the project and database 

### Additional Information:
- Data model: TBD 
    - Tables
- Testing: TBD
    - Running tests    

### Contributing
I welcome contributions in the form of issues / bug reports, feature requests, and pull requests. I have not written contribution guidelines but use these [sensible contribution guidelines](https://opensource.creativecommons.org/contributing-code/) as a starting point.

### Contact
Feel free to reach out to me at <a href="mailto:clemdevcode@gmail.com">clemdevcode@gmail.com</a> with any questions or feedback.


### License
This project is licensed under the MIT License.


