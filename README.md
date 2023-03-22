# The idea of this "template" / Get started quickly

Another company has created a tool for this use case: [Structurizr Site Generatr](https://github.com/avisi-cloud/structurizr-site-generatr)

> A static site generator for C4 architecture models created with [Structrizr DSL](https://github.com/structurizr/dsl). See [Background](https://github.com/avisi-cloud/structurizr-site-generatr#background) for the story behind this tool.
>
> [Click here to see an example of a generated site](https://avisi-cloud.github.io/structurizr-site-generatr) based on the [Big Bank plc example](https://structurizr.com/dsl?example=big-bank-plc) from https://structurizr.com. This site is generated from the example workspace in this repository.
>
> ## Structurizr DSL
>
> You can write [Structurizr DSL](https://github.com/structurizr/dsl) and publish it to a site a client or team can browse. It also includes support for other documentation and Architecture Decision Records. It should be a one stop shop for documenting your projects.

You can get various exports using this tool (`svg`, `png`, `puml`)

## Install

```
brew tap avisi-cloud/tools
brew install structurizr-site-generatr
```

## Optional - Clone this repo

Optionally you can clone this repo to get started with something in place. Or as a playground for how the [Structurizr DSL](https://github.com/structurizr/dsl) works.

## Run

Run the following for a live updating/development site.
```
structurizr-site-generatr serve -w workspace.dsl -a assets
```

Run the following for a static site. E.g. GitHub Pages
```
structurizr-site-generatr generate-site -w workspace.dsl -a assets --branches main --default-branch main
```

## Assets

Assets can be found in the `assets` folder. They can whatever they need to be, e.g. images.

## Support

Read [Structurizr Site Generatr](https://github.com/avisi-cloud/structurizr-site-generatr) for more information.
