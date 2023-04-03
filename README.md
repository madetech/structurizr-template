# Get started quickly - Intro to Structurizr

## Background information

* Why we like to [Visualise Architecture](https://github.com/madetech/architecture-handbook/blob/main/learning_paths/visualising_architecture.md).
  * C4 Model and Structurizr are one way to achieving this.
  * See more [tools here](https://madetech.github.io/architecture-handbook/principles/tools.html).
* Knowledge and understanding of [C4 Model](https://c4model.com/).
* Watch [Diagrams as Code 2.0](https://www.youtube.com/watch?v=Za1-v4Zkq5E) for an explanation/motivation for why Structurizr.
* Learning the [Structurizr DSL](https://github.com/structurizr/dsl) is important but not necessary for this demo.

## Local Interactive Server

Clone this Repo to get started and you can use [Structurizr Lite](https://structurizr.com/share/76352/documentation) by:

```
git clone git@github.com:madetech/structurizr-template.git
cd structurizr-template
docker pull structurizr/lite
docker run -it --rm -p 8080:8080 -v $PWD:/usr/local/structurizr structurizr/lite
```

Open your browser and go to `localhost:8080`.

This will allow you to you to use Structurizr website locally as a playground with the example included.

## The idea of this as a "template"

Another company has created a tool for this use case: [Structurizr Site Generatr](https://github.com/avisi-cloud/structurizr-site-generatr)

This tool includes:
* Boilerplate structure for a static website hosting C4 Diagrams
* Support for any Architecture Decision Records
* Other documentation defined in the [Structurizr DSL](https://github.com/structurizr/dsl)
* You can get various exports using this tool (`svg`, `png`, `puml`)

> A static site generator for C4 architecture models created with [Structurizr DSL](https://github.com/structurizr/dsl). See [Background](https://github.com/avisi-cloud/structurizr-site-generatr#background) for the story behind this tool.
>
> [Click here to see an example of a generated site](https://avisi-cloud.github.io/structurizr-site-generatr) based on the [Big Bank plc example](https://structurizr.com/dsl?example=big-bank-plc) from https://structurizr.com. This site is generated from the example workspace in this repository.
>
> ## Structurizr DSL
>
> You can write [Structurizr DSL](https://github.com/structurizr/dsl) and publish it to a site a client or team can browse. It also includes support for other documentation and Architecture Decision Records. It should be a one stop shop for documenting your projects.

### Our Altered Static Hosted Example

[GitHub Pages](https://madetech.github.io/structurizr-template/main/) hosts this repo as an example. It is built and deployed via the [GitHub Action here](https://github.com/madetech/structurizr-template/blob/main/.github/workflows/cd.yml).

**Install**:

```
brew tap avisi-cloud/tools
brew install structurizr-site-generatr
```

Run the following for a live updating/development site.
```
structurizr-site-generatr serve -w workspace.dsl -a assets
```

Run the following for a static site. E.g. GitHub Pages
```
structurizr-site-generatr generate-site -w workspace.dsl -a assets --branches main --default-branch main
```

Note: Assets can be found in the `assets` folder. They can whatever they need to be, e.g. images.

**Support**

Read [Structurizr Site Generatr](https://github.com/avisi-cloud/structurizr-site-generatr) for problems with the tool.
