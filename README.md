# The idea of this "template" / Get started quickly

Another company has created a tool for this use case: [Structurizr Site Generatr](https://github.com/avisi-cloud/structurizr-site-generatr)

> A static site generator for C4 architecture models created with [Structurizr DSL](https://github.com/structurizr/dsl). See [Background](https://github.com/avisi-cloud/structurizr-site-generatr#background) for the story behind this tool.
>
> [Click here to see an example of a generated site](https://avisi-cloud.github.io/structurizr-site-generatr) based on the [Big Bank plc example](https://structurizr.com/dsl?example=big-bank-plc) from https://structurizr.com. This site is generated from the example workspace in this repository.
>
> ## Structurizr DSL
>
> You can write [Structurizr DSL](https://github.com/structurizr/dsl) and publish it to a site a client or team can browse. It also includes support for other documentation and Architecture Decision Records. It should be a one stop shop for documenting your projects.

You can get various exports using this tool (`svg`, `png`, `puml`)

## Example

[GitHub Pages](https://madetech.github.io/structurizr-template/main/) hosts this repo as an example.

It is built and deployed via the [GitHub Action here](https://github.com/madetech/structurizr-template/blob/main/.github/workflows/cd.yml).

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

## Local Interactive Server

You can use [Structurizr Lite](https://structurizr.com/share/76352/documentation) by:

```
cd structurizr-template
docker pull structurizr/lite
docker run -it --rm -p 8080:8080 -v $PWD:/usr/local/structurizr structurizr/lite
```

This will allow you to you to use Structurizr website locally before committing changes.

## Support

* Knowledge and understanding of [C4 Model](https://c4model.com/).
* Learning the [Structurizr DSL](https://github.com/structurizr/dsl) is important.
* Read [Structurizr Site Generatr](https://github.com/avisi-cloud/structurizr-site-generatr) for problems with the tool.
* Watch [Diagrams as Code 2.0](https://www.youtube.com/watch?v=Za1-v4Zkq5E) for an explanation/motivation for why Structurizr.
