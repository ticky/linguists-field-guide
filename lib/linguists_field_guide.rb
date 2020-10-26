require 'json'

module LinguistsFieldGuide
  # Language names that are recognizable by GitHub.
  # 
  # This is a trimmed-down version of
  # [`github-linguist`'s](https://rubygems.org/gems/github-linguist)
  # [`Linguist::Language`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language)
  # class, with just enough information to use for reference.
  class Language
    @languages = []
    @index = {}
    @name_index = {}

    #See [github-linguist's documentation of `name`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#name-instance_method)
    attr_reader :name
    #See [github-linguist's documentation of `fs_name`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#fs_name-instance_method)
    attr_reader :fs_name
    #See [github-linguist's documentation of `color`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#color-instance_method)
    attr_reader :color
    #See [github-linguist's documentation of `aliases`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#aliases-instance_method)
    attr_reader :aliases
    #See [github-linguist's documentation of `tm_scope`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#tm_scope-instance_method)
    attr_reader :tm_scope
    #See [github-linguist's documentation of `ace_mode`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#ace_mode-instance_method)
    attr_reader :ace_mode
    #See [github-linguist's documentation of `codemirror_mode`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#codemirror_mode-instance_method)
    attr_reader :codemirror_mode
    #See [github-linguist's documentation of `codemirror_mime_type`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#codemirror_mime_type-instance_method)
    attr_reader :codemirror_mime_type
    #See [github-linguist's documentation of `wrap`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#wrap-instance_method)
    attr_reader :wrap
    #See [github-linguist's documentation of `language_id`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#language_id-instance_method)
    attr_reader :language_id
    #See [github-linguist's documentation of `extensions`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#extensions-instance_method)
    attr_reader :extensions
    #See [github-linguist's documentation of `interpreters`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#interpreters-instance_method)
    attr_reader :interpreters
    #See [github-linguist's documentation of `filenames`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#filenames-instance_method)
    attr_reader :filenames

    # Internal: Creates a Language object,
    # applies all the given attributes to instance variables,
    # and adds it to the `#all` list.
    def self.create(attributes)
      language = new(attributes)

      @languages << language

      @index[language.name.downcase] = @name_index[language.name.downcase] = language
    end

    # Internal: Applies all the given attributes to instance variables.
    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set(key, value)
      end
    end

    # Returns an Array of Languages
    def self.all
      @languages
    end

    # Look up Language by its proper name.
    #
    # name - The String name of the Language
    def self.find_by_name(name)
      @name_index[name&.downcase]
    end

    # Get Language group
    #
    # Returns a Language
    def group
      @group ||= if @group_name.nil?
                   self
                 else
                   Language.find_by_name(@group_name)
                 end
    end

    # Get type.
    #
    # Returns a type Symbol or nil.
    def type
      @type&.to_sym
    end

    # Is it popular?
    def popular?
      @popular
    end

    # Is it searchable?
    def searchable?
      @searchable
    end
  end

  languages = JSON.parse <<~JSON
    [
      {
        "@name": "1C Enterprise",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#814CCC",
        "@aliases": [
          "1c-enterprise"
        ],
        "@tm_scope": "source.bsl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 0,
        "@extensions": [
          ".bsl",
          ".os"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "4D",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "4d"
        ],
        "@tm_scope": "source.4dm",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 577529595,
        "@extensions": [
          ".4dm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ABAP",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#E8274B",
        "@aliases": [
          "abap"
        ],
        "@tm_scope": "source.abap",
        "@ace_mode": "abap",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 1,
        "@extensions": [
          ".abap"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ABNF",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "abnf"
        ],
        "@tm_scope": "source.abnf",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 429,
        "@extensions": [
          ".abnf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AGS Script",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#B9D9FF",
        "@aliases": [
          "ags-script",
          "ags"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 2,
        "@extensions": [
          ".asc",
          ".ash"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3AA2B5",
        "@aliases": [
          "al"
        ],
        "@tm_scope": "source.al",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 658971832,
        "@extensions": [
          ".al"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AMPL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#E6EFBB",
        "@aliases": [
          "ampl"
        ],
        "@tm_scope": "source.ampl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 3,
        "@extensions": [
          ".ampl",
          ".mod"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ANTLR",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#9DC3FF",
        "@aliases": [
          "antlr"
        ],
        "@tm_scope": "source.antlr",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 4,
        "@extensions": [
          ".g4"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "API Blueprint",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#2ACCA8",
        "@aliases": [
          "api-blueprint"
        ],
        "@tm_scope": "text.html.markdown.source.gfm.apib",
        "@ace_mode": "markdown",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 5,
        "@extensions": [
          ".apib"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "APL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5A8164",
        "@aliases": [
          "apl"
        ],
        "@tm_scope": "source.apl",
        "@ace_mode": "text",
        "@codemirror_mode": "apl",
        "@codemirror_mime_type": "text/apl",
        "@wrap": false,
        "@language_id": 6,
        "@extensions": [
          ".apl",
          ".dyalog"
        ],
        "@interpreters": [
          "apl",
          "aplx",
          "dyalog"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ASL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "asl"
        ],
        "@tm_scope": "source.asl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 124996147,
        "@extensions": [
          ".asl",
          ".dsl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ASN.1",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "asn.1"
        ],
        "@tm_scope": "source.asn",
        "@ace_mode": "text",
        "@codemirror_mode": "asn.1",
        "@codemirror_mime_type": "text/x-ttcn-asn",
        "@wrap": false,
        "@language_id": 7,
        "@extensions": [
          ".asn",
          ".asn1"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ASP.NET",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#9400ff",
        "@aliases": [
          "asp.net",
          "aspx",
          "aspx-vb"
        ],
        "@tm_scope": "text.html.asp",
        "@ace_mode": "text",
        "@codemirror_mode": "htmlembedded",
        "@codemirror_mime_type": "application/x-aspx",
        "@wrap": false,
        "@language_id": 564186416,
        "@extensions": [
          ".asax",
          ".ascx",
          ".ashx",
          ".asmx",
          ".aspx",
          ".axd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ATS",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#1ac620",
        "@aliases": [
          "ats",
          "ats2"
        ],
        "@tm_scope": "source.ats",
        "@ace_mode": "ocaml",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 9,
        "@extensions": [
          ".dats",
          ".hats",
          ".sats"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ActionScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#882B0F",
        "@aliases": [
          "actionscript",
          "actionscript 3",
          "actionscript3",
          "as3"
        ],
        "@tm_scope": "source.actionscript.3",
        "@ace_mode": "actionscript",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 10,
        "@extensions": [
          ".as"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ada",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#02f88c",
        "@aliases": [
          "ada",
          "ada95",
          "ada2005"
        ],
        "@tm_scope": "source.ada",
        "@ace_mode": "ada",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 11,
        "@extensions": [
          ".adb",
          ".ada",
          ".ads"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Adobe Font Metrics",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "adobe-font-metrics",
          "acfm",
          "adobe composite font metrics",
          "adobe multiple font metrics",
          "amfm"
        ],
        "@tm_scope": "source.afm",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 147198098,
        "@extensions": [
          ".afm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Agda",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#315665",
        "@aliases": [
          "agda"
        ],
        "@tm_scope": "source.agda",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 12,
        "@extensions": [
          ".agda"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Alloy",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#64C800",
        "@aliases": [
          "alloy"
        ],
        "@tm_scope": "source.alloy",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 13,
        "@extensions": [
          ".als"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Alpine Abuild",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "alpine-abuild",
          "abuild",
          "apkbuild"
        ],
        "@tm_scope": "source.shell",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 14,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "APKBUILD"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Shell"
      },
      {
        "@name": "Altium Designer",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "altium-designer",
          "altium"
        ],
        "@tm_scope": "source.ini",
        "@ace_mode": "ini",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 187772328,
        "@extensions": [
          ".OutJob",
          ".PcbDoc",
          ".PrjPCB",
          ".SchDoc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AngelScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#C7D7DC",
        "@aliases": [
          "angelscript"
        ],
        "@tm_scope": "source.angelscript",
        "@ace_mode": "text",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 389477596,
        "@extensions": [
          ".as",
          ".angelscript"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ant Build System",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ant-build-system"
        ],
        "@tm_scope": "text.xml.ant",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "application/xml",
        "@wrap": false,
        "@language_id": 15,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "ant.xml",
          "build.xml"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ApacheConf",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "apacheconf",
          "aconf",
          "apache"
        ],
        "@tm_scope": "source.apache-config",
        "@ace_mode": "apache_conf",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 16,
        "@extensions": [
          ".apacheconf",
          ".vhost"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".htaccess",
          "apache2.conf",
          "httpd.conf"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Apex",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#1797c0",
        "@aliases": [
          "apex"
        ],
        "@tm_scope": "source.java",
        "@ace_mode": "java",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-java",
        "@wrap": false,
        "@language_id": 17,
        "@extensions": [
          ".cls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Apollo Guidance Computer",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0B3D91",
        "@aliases": [
          "apollo-guidance-computer"
        ],
        "@tm_scope": "source.agc",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 18,
        "@extensions": [
          ".agc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Assembly"
      },
      {
        "@name": "AppleScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#101F1F",
        "@aliases": [
          "applescript",
          "osascript"
        ],
        "@tm_scope": "source.applescript",
        "@ace_mode": "applescript",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 19,
        "@extensions": [
          ".applescript",
          ".scpt"
        ],
        "@interpreters": [
          "osascript"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Arc",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#aa2afe",
        "@aliases": [
          "arc"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 20,
        "@extensions": [
          ".arc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AsciiDoc",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "asciidoc"
        ],
        "@tm_scope": "text.html.asciidoc",
        "@ace_mode": "asciidoc",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 22,
        "@extensions": [
          ".asciidoc",
          ".adoc",
          ".asc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AspectJ",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a957b0",
        "@aliases": [
          "aspectj"
        ],
        "@tm_scope": "source.aspectj",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 23,
        "@extensions": [
          ".aj"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Assembly",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6E4C13",
        "@aliases": [
          "assembly",
          "asm",
          "nasm"
        ],
        "@tm_scope": "source.assembly",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 24,
        "@extensions": [
          ".asm",
          ".a51",
          ".i",
          ".inc",
          ".nasm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Asymptote",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff0000",
        "@aliases": [
          "asymptote"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-kotlin",
        "@wrap": false,
        "@language_id": 591605007,
        "@extensions": [
          ".asy"
        ],
        "@interpreters": [
          "asy"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Augeas",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "augeas"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 25,
        "@extensions": [
          ".aug"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AutoHotkey",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6594b9",
        "@aliases": [
          "autohotkey",
          "ahk"
        ],
        "@tm_scope": "source.ahk",
        "@ace_mode": "autohotkey",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 26,
        "@extensions": [
          ".ahk",
          ".ahkl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "AutoIt",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#1C3552",
        "@aliases": [
          "autoit",
          "au3",
          "AutoIt3",
          "AutoItScript"
        ],
        "@tm_scope": "source.autoit",
        "@ace_mode": "autohotkey",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 27,
        "@extensions": [
          ".au3"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Avro IDL",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "avro-idl"
        ],
        "@tm_scope": "source.avro",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 785497837,
        "@extensions": [
          ".avdl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Awk",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "awk"
        ],
        "@tm_scope": "source.awk",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 28,
        "@extensions": [
          ".awk",
          ".auk",
          ".gawk",
          ".mawk",
          ".nawk"
        ],
        "@interpreters": [
          "awk",
          "gawk",
          "mawk",
          "nawk"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ballerina",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#FF5000",
        "@aliases": [
          "ballerina"
        ],
        "@tm_scope": "source.ballerina",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 720859680,
        "@extensions": [
          ".bal"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Batchfile",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#C1F12E",
        "@aliases": [
          "batchfile",
          "bat",
          "batch",
          "dosbatch",
          "winbatch"
        ],
        "@tm_scope": "source.batchfile",
        "@ace_mode": "batchfile",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 29,
        "@extensions": [
          ".bat",
          ".cmd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Befunge",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "befunge"
        ],
        "@tm_scope": "source.befunge",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 30,
        "@extensions": [
          ".befunge"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "BibTeX",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "bibtex"
        ],
        "@tm_scope": "text.bibtex",
        "@ace_mode": "tex",
        "@codemirror_mode": "stex",
        "@codemirror_mime_type": "text/x-stex",
        "@wrap": false,
        "@language_id": 982188347,
        "@extensions": [
          ".bib",
          ".bibtex"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "TeX"
      },
      {
        "@name": "Bison",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6A463F",
        "@aliases": [
          "bison"
        ],
        "@tm_scope": "source.yacc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 31,
        "@extensions": [
          ".bison"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Yacc"
      },
      {
        "@name": "BitBake",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "bitbake"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 32,
        "@extensions": [
          ".bb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Blade",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#f7523f",
        "@aliases": [
          "blade"
        ],
        "@tm_scope": "text.html.php.blade",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 33,
        "@extensions": [
          ".blade",
          ".blade.php"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "BlitzBasic",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "blitzbasic",
          "b3d",
          "blitz3d",
          "blitzplus",
          "bplus"
        ],
        "@tm_scope": "source.blitzmax",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 34,
        "@extensions": [
          ".bb",
          ".decls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "BlitzMax",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cd6400",
        "@aliases": [
          "blitzmax",
          "bmax"
        ],
        "@tm_scope": "source.blitzmax",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 35,
        "@extensions": [
          ".bmx"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Bluespec",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "bluespec"
        ],
        "@tm_scope": "source.bsv",
        "@ace_mode": "verilog",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 36,
        "@extensions": [
          ".bsv"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Boo",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#d4bec1",
        "@aliases": [
          "boo"
        ],
        "@tm_scope": "source.boo",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 37,
        "@extensions": [
          ".boo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Brainfuck",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#2F2530",
        "@aliases": [
          "brainfuck"
        ],
        "@tm_scope": "source.bf",
        "@ace_mode": "text",
        "@codemirror_mode": "brainfuck",
        "@codemirror_mime_type": "text/x-brainfuck",
        "@wrap": false,
        "@language_id": 38,
        "@extensions": [
          ".b",
          ".bf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Brightscript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "brightscript"
        ],
        "@tm_scope": "source.brightscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 39,
        "@extensions": [
          ".brs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "C",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#555555",
        "@aliases": [
          "c"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 41,
        "@extensions": [
          ".c",
          ".cats",
          ".h",
          ".idc"
        ],
        "@interpreters": [
          "tcc"
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "C#",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#178600",
        "@aliases": [
          "c#",
          "csharp"
        ],
        "@tm_scope": "source.cs",
        "@ace_mode": "csharp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csharp",
        "@wrap": false,
        "@language_id": 42,
        "@extensions": [
          ".cs",
          ".cake",
          ".csx",
          ".linq"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "C++",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f34b7d",
        "@aliases": [
          "c++",
          "cpp"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 43,
        "@extensions": [
          ".cpp",
          ".c++",
          ".cc",
          ".cp",
          ".cxx",
          ".h",
          ".h++",
          ".hh",
          ".hpp",
          ".hxx",
          ".inc",
          ".inl",
          ".ino",
          ".ipp",
          ".re",
          ".tcc",
          ".tpp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "C-ObjDump",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "c-objdump"
        ],
        "@tm_scope": "objdump.x86asm",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 44,
        "@extensions": [
          ".c-objdump"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "C2hs Haskell",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "c2hs-haskell",
          "c2hs"
        ],
        "@tm_scope": "source.haskell",
        "@ace_mode": "haskell",
        "@codemirror_mode": "haskell",
        "@codemirror_mime_type": "text/x-haskell",
        "@wrap": false,
        "@language_id": 45,
        "@extensions": [
          ".chs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Haskell"
      },
      {
        "@name": "CLIPS",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "clips"
        ],
        "@tm_scope": "source.clips",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 46,
        "@extensions": [
          ".clp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CMake",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cmake"
        ],
        "@tm_scope": "source.cmake",
        "@ace_mode": "text",
        "@codemirror_mode": "cmake",
        "@codemirror_mime_type": "text/x-cmake",
        "@wrap": false,
        "@language_id": 47,
        "@extensions": [
          ".cmake",
          ".cmake.in"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "CMakeLists.txt"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "COBOL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cobol"
        ],
        "@tm_scope": "source.cobol",
        "@ace_mode": "cobol",
        "@codemirror_mode": "cobol",
        "@codemirror_mime_type": "text/x-cobol",
        "@wrap": false,
        "@language_id": 48,
        "@extensions": [
          ".cob",
          ".cbl",
          ".ccp",
          ".cobol",
          ".cpy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "COLLADA",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "collada"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 49,
        "@extensions": [
          ".dae"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CSON",
        "@fs_name": null,
        "@type": "data",
        "@color": "#244776",
        "@aliases": [
          "cson"
        ],
        "@tm_scope": "source.coffee",
        "@ace_mode": "coffee",
        "@codemirror_mode": "coffeescript",
        "@codemirror_mime_type": "text/x-coffeescript",
        "@wrap": false,
        "@language_id": 424,
        "@extensions": [
          ".cson"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CSS",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#563d7c",
        "@aliases": [
          "css"
        ],
        "@tm_scope": "source.css",
        "@ace_mode": "css",
        "@codemirror_mode": "css",
        "@codemirror_mime_type": "text/css",
        "@wrap": false,
        "@language_id": 50,
        "@extensions": [
          ".css"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "CSV",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "csv"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 51,
        "@extensions": [
          ".csv"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CWeb",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cweb"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 657332628,
        "@extensions": [
          ".w"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cabal Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "cabal-config",
          "Cabal"
        ],
        "@tm_scope": "source.cabal",
        "@ace_mode": "haskell",
        "@codemirror_mode": "haskell",
        "@codemirror_mime_type": "text/x-haskell",
        "@wrap": false,
        "@language_id": 677095381,
        "@extensions": [
          ".cabal"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "cabal.config",
          "cabal.project"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cap'n Proto",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cap'n-proto"
        ],
        "@tm_scope": "source.capnp",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 52,
        "@extensions": [
          ".capnp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CartoCSS",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cartocss",
          "Carto"
        ],
        "@tm_scope": "source.css.mss",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 53,
        "@extensions": [
          ".mss"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ceylon",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dfa535",
        "@aliases": [
          "ceylon"
        ],
        "@tm_scope": "source.ceylon",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 54,
        "@extensions": [
          ".ceylon"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Chapel",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#8dc63f",
        "@aliases": [
          "chapel",
          "chpl"
        ],
        "@tm_scope": "source.chapel",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 55,
        "@extensions": [
          ".chpl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Charity",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "charity"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 56,
        "@extensions": [
          ".ch"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ChucK",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "chuck"
        ],
        "@tm_scope": "source.java",
        "@ace_mode": "java",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-java",
        "@wrap": false,
        "@language_id": 57,
        "@extensions": [
          ".ck"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cirru",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ccccff",
        "@aliases": [
          "cirru"
        ],
        "@tm_scope": "source.cirru",
        "@ace_mode": "cirru",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 58,
        "@extensions": [
          ".cirru"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Clarion",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#db901e",
        "@aliases": [
          "clarion"
        ],
        "@tm_scope": "source.clarion",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 59,
        "@extensions": [
          ".clw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Classic ASP",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6a40fd",
        "@aliases": [
          "classic-asp",
          "asp"
        ],
        "@tm_scope": "text.html.asp",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 8,
        "@extensions": [
          ".asp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Clean",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3F85AF",
        "@aliases": [
          "clean"
        ],
        "@tm_scope": "source.clean",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 60,
        "@extensions": [
          ".icl",
          ".dcl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Click",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#E4E6F3",
        "@aliases": [
          "click"
        ],
        "@tm_scope": "source.click",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 61,
        "@extensions": [
          ".click"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Clojure",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#db5855",
        "@aliases": [
          "clojure"
        ],
        "@tm_scope": "source.clojure",
        "@ace_mode": "clojure",
        "@codemirror_mode": "clojure",
        "@codemirror_mime_type": "text/x-clojure",
        "@wrap": false,
        "@language_id": 62,
        "@extensions": [
          ".clj",
          ".boot",
          ".cl2",
          ".cljc",
          ".cljs",
          ".cljs.hl",
          ".cljscm",
          ".cljx",
          ".hic"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "riemann.config"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Closure Templates",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "closure-templates",
          "soy"
        ],
        "@tm_scope": "text.html.soy",
        "@ace_mode": "soy_template",
        "@codemirror_mode": "soy",
        "@codemirror_mime_type": "text/x-soy",
        "@wrap": false,
        "@language_id": 357046146,
        "@extensions": [
          ".soy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "Cloud Firestore Security Rules",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "cloud-firestore-security-rules"
        ],
        "@tm_scope": "source.firestore",
        "@ace_mode": "less",
        "@codemirror_mode": "css",
        "@codemirror_mime_type": "text/css",
        "@wrap": false,
        "@language_id": 407996372,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "firestore.rules"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CoNLL-U",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "conll-u",
          "CoNLL",
          "CoNLL-X"
        ],
        "@tm_scope": "text.conllu",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 421026389,
        "@extensions": [
          ".conllu",
          ".conll"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CodeQL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "codeql",
          "ql"
        ],
        "@tm_scope": "source.ql",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 424259634,
        "@extensions": [
          ".ql",
          ".qll"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "CoffeeScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#244776",
        "@aliases": [
          "coffeescript",
          "coffee",
          "coffee-script"
        ],
        "@tm_scope": "source.coffee",
        "@ace_mode": "coffee",
        "@codemirror_mode": "coffeescript",
        "@codemirror_mime_type": "text/x-coffeescript",
        "@wrap": false,
        "@language_id": 63,
        "@extensions": [
          ".coffee",
          "._coffee",
          ".cake",
          ".cjsx",
          ".iced"
        ],
        "@interpreters": [
          "coffee"
        ],
        "@filenames": [
          "Cakefile"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "ColdFusion",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ed2cd6",
        "@aliases": [
          "coldfusion",
          "cfm",
          "cfml",
          "coldfusion html"
        ],
        "@tm_scope": "text.html.cfm",
        "@ace_mode": "coldfusion",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 64,
        "@extensions": [
          ".cfm",
          ".cfml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ColdFusion CFC",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ed2cd6",
        "@aliases": [
          "coldfusion-cfc",
          "cfc"
        ],
        "@tm_scope": "source.cfscript",
        "@ace_mode": "coldfusion",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 65,
        "@extensions": [
          ".cfc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "ColdFusion"
      },
      {
        "@name": "Common Lisp",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3fb68b",
        "@aliases": [
          "common-lisp",
          "lisp"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 66,
        "@extensions": [
          ".lisp",
          ".asd",
          ".cl",
          ".l",
          ".lsp",
          ".ny",
          ".podsl",
          ".sexp"
        ],
        "@interpreters": [
          "ccl",
          "clisp",
          "ecl",
          "lisp",
          "sbcl"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Common Workflow Language",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#B5314C",
        "@aliases": [
          "common-workflow-language",
          "cwl"
        ],
        "@tm_scope": "source.cwl",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 988547172,
        "@extensions": [
          ".cwl"
        ],
        "@interpreters": [
          "cwl-runner"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Component Pascal",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#B0CE4E",
        "@aliases": [
          "component-pascal",
          "delphi",
          "objectpascal"
        ],
        "@tm_scope": "source.pascal",
        "@ace_mode": "pascal",
        "@codemirror_mode": "pascal",
        "@codemirror_mime_type": "text/x-pascal",
        "@wrap": false,
        "@language_id": 67,
        "@extensions": [
          ".cp",
          ".cps"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cool",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cool"
        ],
        "@tm_scope": "source.cool",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 68,
        "@extensions": [
          ".cl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Coq",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "coq"
        ],
        "@tm_scope": "source.coq",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 69,
        "@extensions": [
          ".coq",
          ".v"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cpp-ObjDump",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "cpp-objdump",
          "c++-objdump"
        ],
        "@tm_scope": "objdump.x86asm",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 70,
        "@extensions": [
          ".cppobjdump",
          ".c++-objdump",
          ".c++objdump",
          ".cpp-objdump",
          ".cxx-objdump"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Creole",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "creole"
        ],
        "@tm_scope": "text.html.creole",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 71,
        "@extensions": [
          ".creole"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Crystal",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#000100",
        "@aliases": [
          "crystal"
        ],
        "@tm_scope": "source.crystal",
        "@ace_mode": "ruby",
        "@codemirror_mode": "crystal",
        "@codemirror_mime_type": "text/x-crystal",
        "@wrap": false,
        "@language_id": 72,
        "@extensions": [
          ".cr"
        ],
        "@interpreters": [
          "crystal"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Csound",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "csound",
          "csound-orc"
        ],
        "@tm_scope": "source.csound",
        "@ace_mode": "csound_orchestra",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 73,
        "@extensions": [
          ".orc",
          ".udo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Csound Document",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "csound-document",
          "csound-csd"
        ],
        "@tm_scope": "source.csound-document",
        "@ace_mode": "csound_document",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 74,
        "@extensions": [
          ".csd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Csound Score",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "csound-score",
          "csound-sco"
        ],
        "@tm_scope": "source.csound-score",
        "@ace_mode": "csound_score",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 75,
        "@extensions": [
          ".sco"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cuda",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3A4E3A",
        "@aliases": [
          "cuda"
        ],
        "@tm_scope": "source.cuda-c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 77,
        "@extensions": [
          ".cu",
          ".cuh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cycript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cycript"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "text/javascript",
        "@wrap": false,
        "@language_id": 78,
        "@extensions": [
          ".cy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Cython",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "cython",
          "pyrex"
        ],
        "@tm_scope": "source.cython",
        "@ace_mode": "text",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-cython",
        "@wrap": false,
        "@language_id": 79,
        "@extensions": [
          ".pyx",
          ".pxd",
          ".pxi"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Python"
      },
      {
        "@name": "D",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ba595e",
        "@aliases": [
          "d"
        ],
        "@tm_scope": "source.d",
        "@ace_mode": "d",
        "@codemirror_mode": "d",
        "@codemirror_mime_type": "text/x-d",
        "@wrap": false,
        "@language_id": 80,
        "@extensions": [
          ".d",
          ".di"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "D-ObjDump",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "d-objdump"
        ],
        "@tm_scope": "objdump.x86asm",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 81,
        "@extensions": [
          ".d-objdump"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "DIGITAL Command Language",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "digital-command-language",
          "dcl"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 82,
        "@extensions": [
          ".com"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "DM",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#447265",
        "@aliases": [
          "dm",
          "byond"
        ],
        "@tm_scope": "source.dm",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 83,
        "@extensions": [
          ".dm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "DNS Zone",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "dns-zone"
        ],
        "@tm_scope": "text.zone_file",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 84,
        "@extensions": [
          ".zone",
          ".arpa"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "DTrace",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "dtrace",
          "dtrace-script"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 85,
        "@extensions": [
          ".d"
        ],
        "@interpreters": [
          "dtrace"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Dafny",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#FFEC25",
        "@aliases": [
          "dafny"
        ],
        "@tm_scope": "text.dfy.dafny",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 969323346,
        "@extensions": [
          ".dfy"
        ],
        "@interpreters": [
          "dafny"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Darcs Patch",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "darcs-patch",
          "dpatch"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 86,
        "@extensions": [
          ".darcspatch",
          ".dpatch"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Dart",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00B4AB",
        "@aliases": [
          "dart"
        ],
        "@tm_scope": "source.dart",
        "@ace_mode": "dart",
        "@codemirror_mode": "dart",
        "@codemirror_mime_type": "application/dart",
        "@wrap": false,
        "@language_id": 87,
        "@extensions": [
          ".dart"
        ],
        "@interpreters": [
          "dart"
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "DataWeave",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#003a52",
        "@aliases": [
          "dataweave"
        ],
        "@tm_scope": "source.data-weave",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 974514097,
        "@extensions": [
          ".dwl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Dhall",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dfafff",
        "@aliases": [
          "dhall"
        ],
        "@tm_scope": "source.haskell",
        "@ace_mode": "haskell",
        "@codemirror_mode": "haskell",
        "@codemirror_mime_type": "text/x-haskell",
        "@wrap": false,
        "@language_id": 793969321,
        "@extensions": [
          ".dhall"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Diff",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "diff",
          "udiff"
        ],
        "@tm_scope": "source.diff",
        "@ace_mode": "diff",
        "@codemirror_mode": "diff",
        "@codemirror_mime_type": "text/x-diff",
        "@wrap": false,
        "@language_id": 88,
        "@extensions": [
          ".diff",
          ".patch"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "DirectX 3D File",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "directx-3d-file"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 201049282,
        "@extensions": [
          ".x"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Dockerfile",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#384d54",
        "@aliases": [
          "dockerfile"
        ],
        "@tm_scope": "source.dockerfile",
        "@ace_mode": "dockerfile",
        "@codemirror_mode": "dockerfile",
        "@codemirror_mime_type": "text/x-dockerfile",
        "@wrap": false,
        "@language_id": 89,
        "@extensions": [
          ".dockerfile"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Dockerfile"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Dogescript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cca760",
        "@aliases": [
          "dogescript"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 90,
        "@extensions": [
          ".djs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Dylan",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6c616e",
        "@aliases": [
          "dylan"
        ],
        "@tm_scope": "source.dylan",
        "@ace_mode": "text",
        "@codemirror_mode": "dylan",
        "@codemirror_mime_type": "text/x-dylan",
        "@wrap": false,
        "@language_id": 91,
        "@extensions": [
          ".dylan",
          ".dyl",
          ".intr",
          ".lid"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "E",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ccce35",
        "@aliases": [
          "e"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 92,
        "@extensions": [
          ".E"
        ],
        "@interpreters": [
          "rune"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "EBNF",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ebnf"
        ],
        "@tm_scope": "source.ebnf",
        "@ace_mode": "text",
        "@codemirror_mode": "ebnf",
        "@codemirror_mime_type": "text/x-ebnf",
        "@wrap": false,
        "@language_id": 430,
        "@extensions": [
          ".ebnf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ECL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#8a1267",
        "@aliases": [
          "ecl"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": "ecl",
        "@codemirror_mime_type": "text/x-ecl",
        "@wrap": false,
        "@language_id": 93,
        "@extensions": [
          ".ecl",
          ".eclxml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ECLiPSe",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "eclipse"
        ],
        "@tm_scope": "source.prolog.eclipse",
        "@ace_mode": "prolog",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 94,
        "@extensions": [
          ".ecl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "prolog"
      },
      {
        "@name": "EJS",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#a91e50",
        "@aliases": [
          "ejs"
        ],
        "@tm_scope": "text.html.js",
        "@ace_mode": "ejs",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 95,
        "@extensions": [
          ".ejs",
          ".ect",
          ".jst"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "EML",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "eml"
        ],
        "@tm_scope": "text.eml.basic",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 529653389,
        "@extensions": [
          ".eml",
          ".mbox"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "EQ",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a78649",
        "@aliases": [
          "eq"
        ],
        "@tm_scope": "source.cs",
        "@ace_mode": "csharp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csharp",
        "@wrap": false,
        "@language_id": 96,
        "@extensions": [
          ".eq"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Eagle",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "eagle"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 97,
        "@extensions": [
          ".sch",
          ".brd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Easybuild",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "easybuild"
        ],
        "@tm_scope": "source.python",
        "@ace_mode": "python",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-python",
        "@wrap": false,
        "@language_id": 342840477,
        "@extensions": [
          ".eb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Python"
      },
      {
        "@name": "Ecere Projects",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ecere-projects"
        ],
        "@tm_scope": "source.json",
        "@ace_mode": "json",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 98,
        "@extensions": [
          ".epj"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "JavaScript"
      },
      {
        "@name": "EditorConfig",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "editorconfig",
          "editor-config"
        ],
        "@tm_scope": "source.editorconfig",
        "@ace_mode": "ini",
        "@codemirror_mode": "properties",
        "@codemirror_mime_type": "text/x-properties",
        "@wrap": false,
        "@language_id": 96139566,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".editorconfig"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "Edje Data Collection",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "edje-data-collection"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 342840478,
        "@extensions": [
          ".edc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Eiffel",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4d6977",
        "@aliases": [
          "eiffel"
        ],
        "@tm_scope": "source.eiffel",
        "@ace_mode": "eiffel",
        "@codemirror_mode": "eiffel",
        "@codemirror_mime_type": "text/x-eiffel",
        "@wrap": false,
        "@language_id": 99,
        "@extensions": [
          ".e"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Elixir",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6e4a7e",
        "@aliases": [
          "elixir"
        ],
        "@tm_scope": "source.elixir",
        "@ace_mode": "elixir",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 100,
        "@extensions": [
          ".ex",
          ".exs"
        ],
        "@interpreters": [
          "elixir"
        ],
        "@filenames": [
          "mix.lock"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Elm",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#60B5CC",
        "@aliases": [
          "elm"
        ],
        "@tm_scope": "source.elm",
        "@ace_mode": "elm",
        "@codemirror_mode": "elm",
        "@codemirror_mime_type": "text/x-elm",
        "@wrap": false,
        "@language_id": 101,
        "@extensions": [
          ".elm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Emacs Lisp",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c065db",
        "@aliases": [
          "emacs-lisp",
          "elisp",
          "emacs"
        ],
        "@tm_scope": "source.emacs.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 102,
        "@extensions": [
          ".el",
          ".emacs",
          ".emacs.desktop"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".abbrev_defs",
          ".emacs",
          ".emacs.desktop",
          ".gnus",
          ".spacemacs",
          ".viper",
          "Cask",
          "Project.ede",
          "_emacs",
          "abbrev_defs"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "EmberScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#FFF4F3",
        "@aliases": [
          "emberscript"
        ],
        "@tm_scope": "source.coffee",
        "@ace_mode": "coffee",
        "@codemirror_mode": "coffeescript",
        "@codemirror_mime_type": "text/x-coffeescript",
        "@wrap": false,
        "@language_id": 103,
        "@extensions": [
          ".em",
          ".emberscript"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Erlang",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#B83998",
        "@aliases": [
          "erlang"
        ],
        "@tm_scope": "source.erlang",
        "@ace_mode": "erlang",
        "@codemirror_mode": "erlang",
        "@codemirror_mime_type": "text/x-erlang",
        "@wrap": false,
        "@language_id": 104,
        "@extensions": [
          ".erl",
          ".app.src",
          ".es",
          ".escript",
          ".hrl",
          ".xrl",
          ".yrl"
        ],
        "@interpreters": [
          "escript"
        ],
        "@filenames": [
          "Emakefile",
          "rebar.config",
          "rebar.config.lock",
          "rebar.lock"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "F#",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#b845fc",
        "@aliases": [
          "f#",
          "fsharp"
        ],
        "@tm_scope": "source.fsharp",
        "@ace_mode": "text",
        "@codemirror_mode": "mllike",
        "@codemirror_mime_type": "text/x-fsharp",
        "@wrap": false,
        "@language_id": 105,
        "@extensions": [
          ".fs",
          ".fsi",
          ".fsx"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "F*",
        "@fs_name": "Fstar",
        "@type": "programming",
        "@color": "#572e30",
        "@aliases": [
          "f*",
          "fstar"
        ],
        "@tm_scope": "source.fstar",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 336943375,
        "@extensions": [
          ".fst"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "FIGlet Font",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "figlet-font",
          "FIGfont"
        ],
        "@tm_scope": "source.figfont",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 686129783,
        "@extensions": [
          ".flf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "FLUX",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#88ccff",
        "@aliases": [
          "flux"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 106,
        "@extensions": [
          ".fx",
          ".flux"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Factor",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#636746",
        "@aliases": [
          "factor"
        ],
        "@tm_scope": "source.factor",
        "@ace_mode": "text",
        "@codemirror_mode": "factor",
        "@codemirror_mime_type": "text/x-factor",
        "@wrap": false,
        "@language_id": 108,
        "@extensions": [
          ".factor"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".factor-boot-rc",
          ".factor-rc"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Fancy",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#7b9db4",
        "@aliases": [
          "fancy"
        ],
        "@tm_scope": "source.fancy",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 109,
        "@extensions": [
          ".fy",
          ".fancypack"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Fakefile"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Fantom",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#14253c",
        "@aliases": [
          "fantom"
        ],
        "@tm_scope": "source.fan",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 110,
        "@extensions": [
          ".fan"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Faust",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c37240",
        "@aliases": [
          "faust"
        ],
        "@tm_scope": "source.faust",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 622529198,
        "@extensions": [
          ".dsp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Filebench WML",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "filebench-wml"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 111,
        "@extensions": [
          ".f"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Filterscript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "filterscript"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 112,
        "@extensions": [
          ".fs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "RenderScript"
      },
      {
        "@name": "Formatted",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "formatted"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 113,
        "@extensions": [
          ".for",
          ".eam.fs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Forth",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#341708",
        "@aliases": [
          "forth"
        ],
        "@tm_scope": "source.forth",
        "@ace_mode": "forth",
        "@codemirror_mode": "forth",
        "@codemirror_mime_type": "text/x-forth",
        "@wrap": false,
        "@language_id": 114,
        "@extensions": [
          ".fth",
          ".4th",
          ".f",
          ".for",
          ".forth",
          ".fr",
          ".frt",
          ".fs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Fortran",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4d41b1",
        "@aliases": [
          "fortran"
        ],
        "@tm_scope": "source.fortran",
        "@ace_mode": "text",
        "@codemirror_mode": "fortran",
        "@codemirror_mime_type": "text/x-fortran",
        "@wrap": false,
        "@language_id": 107,
        "@extensions": [
          ".f",
          ".f77",
          ".for",
          ".fpp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Fortran"
      },
      {
        "@name": "Fortran Free Form",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "fortran-free-form"
        ],
        "@tm_scope": "source.fortran.modern",
        "@ace_mode": "text",
        "@codemirror_mode": "fortran",
        "@codemirror_mime_type": "text/x-fortran",
        "@wrap": false,
        "@language_id": 761352333,
        "@extensions": [
          ".f90",
          ".f03",
          ".f08",
          ".f95"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Fortran"
      },
      {
        "@name": "FreeMarker",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0050b2",
        "@aliases": [
          "freemarker",
          "ftl"
        ],
        "@tm_scope": "text.html.ftl",
        "@ace_mode": "ftl",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 115,
        "@extensions": [
          ".ftl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Frege",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00cafe",
        "@aliases": [
          "frege"
        ],
        "@tm_scope": "source.haskell",
        "@ace_mode": "haskell",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 116,
        "@extensions": [
          ".fr"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Futhark",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5f021f",
        "@aliases": [
          "futhark"
        ],
        "@tm_scope": "source.futhark",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 97358117,
        "@extensions": [
          ".fut"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "G-code",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#D08CF2",
        "@aliases": [
          "g-code"
        ],
        "@tm_scope": "source.gcode",
        "@ace_mode": "gcode",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 117,
        "@extensions": [
          ".g",
          ".cnc",
          ".gco",
          ".gcode"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GAML",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#FFC766",
        "@aliases": [
          "gaml"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 290345951,
        "@extensions": [
          ".gaml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GAMS",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "gams"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 118,
        "@extensions": [
          ".gms"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GAP",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "gap"
        ],
        "@tm_scope": "source.gap",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 119,
        "@extensions": [
          ".g",
          ".gap",
          ".gd",
          ".gi",
          ".tst"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GCC Machine Description",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "gcc-machine-description"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 121,
        "@extensions": [
          ".md"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GDB",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "gdb"
        ],
        "@tm_scope": "source.gdb",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 122,
        "@extensions": [
          ".gdb",
          ".gdbinit"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GDScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#355570",
        "@aliases": [
          "gdscript"
        ],
        "@tm_scope": "source.gdscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 123,
        "@extensions": [
          ".gd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GEDCOM",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "gedcom"
        ],
        "@tm_scope": "source.gedcom",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 459577965,
        "@extensions": [
          ".ged"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GLSL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "glsl"
        ],
        "@tm_scope": "source.glsl",
        "@ace_mode": "glsl",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 124,
        "@extensions": [
          ".glsl",
          ".fp",
          ".frag",
          ".frg",
          ".fs",
          ".fsh",
          ".fshader",
          ".geo",
          ".geom",
          ".glslf",
          ".glslv",
          ".gs",
          ".gshader",
          ".shader",
          ".tesc",
          ".tese",
          ".vert",
          ".vrx",
          ".vsh",
          ".vshader"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GN",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "gn"
        ],
        "@tm_scope": "source.gn",
        "@ace_mode": "python",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-python",
        "@wrap": false,
        "@language_id": 302957008,
        "@extensions": [
          ".gn",
          ".gni"
        ],
        "@interpreters": [
          "gn"
        ],
        "@filenames": [
          ".gn"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Game Maker Language",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#71b417",
        "@aliases": [
          "game-maker-language"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 125,
        "@extensions": [
          ".gml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Genie",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#fb855d",
        "@aliases": [
          "genie"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 792408528,
        "@extensions": [
          ".gs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Genshi",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "genshi",
          "xml+genshi",
          "xml+kid"
        ],
        "@tm_scope": "text.xml.genshi",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 126,
        "@extensions": [
          ".kid"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Gentoo Ebuild",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "gentoo-ebuild"
        ],
        "@tm_scope": "source.shell",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 127,
        "@extensions": [
          ".ebuild"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Shell"
      },
      {
        "@name": "Gentoo Eclass",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "gentoo-eclass"
        ],
        "@tm_scope": "source.shell",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 128,
        "@extensions": [
          ".eclass"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Shell"
      },
      {
        "@name": "Gerber Image",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "gerber-image",
          "rs-274x"
        ],
        "@tm_scope": "source.gerber",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 404627610,
        "@extensions": [
          ".gbr",
          ".gbl",
          ".gbo",
          ".gbp",
          ".gbs",
          ".gko",
          ".gml",
          ".gpb",
          ".gpt",
          ".gtl",
          ".gto",
          ".gtp",
          ".gts",
          ".sol"
        ],
        "@interpreters": [
          "gerbv",
          "gerbview"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Gettext Catalog",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "gettext-catalog",
          "pot"
        ],
        "@tm_scope": "source.po",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 129,
        "@extensions": [
          ".po",
          ".pot"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": false
      },
      {
        "@name": "Gherkin",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5B2063",
        "@aliases": [
          "gherkin",
          "cucumber"
        ],
        "@tm_scope": "text.gherkin.feature",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 76,
        "@extensions": [
          ".feature",
          ".story"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Git Attributes",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "git-attributes",
          "gitattributes"
        ],
        "@tm_scope": "source.gitattributes",
        "@ace_mode": "gitignore",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 956324166,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".gitattributes"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "Git Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "git-config",
          "gitconfig",
          "gitmodules"
        ],
        "@tm_scope": "source.gitconfig",
        "@ace_mode": "ini",
        "@codemirror_mode": "properties",
        "@codemirror_mime_type": "text/x-properties",
        "@wrap": false,
        "@language_id": 807968997,
        "@extensions": [
          ".gitconfig"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".gitconfig",
          ".gitmodules"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "Glyph",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c1ac7f",
        "@aliases": [
          "glyph"
        ],
        "@tm_scope": "source.tcl",
        "@ace_mode": "tcl",
        "@codemirror_mode": "tcl",
        "@codemirror_mime_type": "text/x-tcl",
        "@wrap": false,
        "@language_id": 130,
        "@extensions": [
          ".glf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Glyph Bitmap Distribution Format",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "glyph-bitmap-distribution-format"
        ],
        "@tm_scope": "source.bdf",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 997665271,
        "@extensions": [
          ".bdf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Gnuplot",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f0a9f0",
        "@aliases": [
          "gnuplot"
        ],
        "@tm_scope": "source.gnuplot",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 131,
        "@extensions": [
          ".gp",
          ".gnu",
          ".gnuplot",
          ".p",
          ".plot",
          ".plt"
        ],
        "@interpreters": [
          "gnuplot"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Go",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00ADD8",
        "@aliases": [
          "go",
          "golang"
        ],
        "@tm_scope": "source.go",
        "@ace_mode": "golang",
        "@codemirror_mode": "go",
        "@codemirror_mime_type": "text/x-go",
        "@wrap": false,
        "@language_id": 132,
        "@extensions": [
          ".go"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Golo",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#88562A",
        "@aliases": [
          "golo"
        ],
        "@tm_scope": "source.golo",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 133,
        "@extensions": [
          ".golo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Gosu",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#82937f",
        "@aliases": [
          "gosu"
        ],
        "@tm_scope": "source.gosu.2",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 134,
        "@extensions": [
          ".gs",
          ".gst",
          ".gsx",
          ".vark"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Grace",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "grace"
        ],
        "@tm_scope": "source.grace",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 135,
        "@extensions": [
          ".grace"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Gradle",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "gradle"
        ],
        "@tm_scope": "source.groovy.gradle",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 136,
        "@extensions": [
          ".gradle"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Grammatical Framework",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff0000",
        "@aliases": [
          "grammatical-framework",
          "gf"
        ],
        "@tm_scope": "source.gf",
        "@ace_mode": "haskell",
        "@codemirror_mode": "haskell",
        "@codemirror_mime_type": "text/x-haskell",
        "@wrap": false,
        "@language_id": 137,
        "@extensions": [
          ".gf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Graph Modeling Language",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "graph-modeling-language"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 138,
        "@extensions": [
          ".gml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "GraphQL",
        "@fs_name": null,
        "@type": "data",
        "@color": "#e10098",
        "@aliases": [
          "graphql"
        ],
        "@tm_scope": "source.graphql",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 139,
        "@extensions": [
          ".graphql",
          ".gql",
          ".graphqls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Graphviz (DOT)",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "graphviz-(dot)"
        ],
        "@tm_scope": "source.dot",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 140,
        "@extensions": [
          ".dot",
          ".gv"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Groovy",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#e69f56",
        "@aliases": [
          "groovy"
        ],
        "@tm_scope": "source.groovy",
        "@ace_mode": "groovy",
        "@codemirror_mode": "groovy",
        "@codemirror_mime_type": "text/x-groovy",
        "@wrap": false,
        "@language_id": 142,
        "@extensions": [
          ".groovy",
          ".grt",
          ".gtpl",
          ".gvy"
        ],
        "@interpreters": [
          "groovy"
        ],
        "@filenames": [
          "Jenkinsfile"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Groovy Server Pages",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "groovy-server-pages",
          "gsp",
          "java server page"
        ],
        "@tm_scope": "text.html.jsp",
        "@ace_mode": "jsp",
        "@codemirror_mode": "htmlembedded",
        "@codemirror_mime_type": "application/x-jsp",
        "@wrap": false,
        "@language_id": 143,
        "@extensions": [
          ".gsp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Groovy"
      },
      {
        "@name": "HAProxy",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "haproxy"
        ],
        "@tm_scope": "source.haproxy-config",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 366607477,
        "@extensions": [
          ".cfg"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "haproxy.cfg"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HCL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "hcl",
          "terraform"
        ],
        "@tm_scope": "source.terraform",
        "@ace_mode": "ruby",
        "@codemirror_mode": "ruby",
        "@codemirror_mime_type": "text/x-ruby",
        "@wrap": false,
        "@language_id": 144,
        "@extensions": [
          ".hcl",
          ".nomad",
          ".tf",
          ".tfvars",
          ".workflow"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HLSL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "hlsl"
        ],
        "@tm_scope": "source.hlsl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 145,
        "@extensions": [
          ".hlsl",
          ".cginc",
          ".fx",
          ".fxh",
          ".hlsli"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HTML",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#e34c26",
        "@aliases": [
          "html",
          "xhtml"
        ],
        "@tm_scope": "text.html.basic",
        "@ace_mode": "html",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 146,
        "@extensions": [
          ".html",
          ".htm",
          ".html.hl",
          ".inc",
          ".st",
          ".xht",
          ".xhtml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "HTML+Django",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "html+django",
          "django",
          "html+django/jinja",
          "html+jinja",
          "htmldjango",
          "njk",
          "nunjucks"
        ],
        "@tm_scope": "text.html.django",
        "@ace_mode": "django",
        "@codemirror_mode": "django",
        "@codemirror_mime_type": "text/x-django",
        "@wrap": false,
        "@language_id": 147,
        "@extensions": [
          ".jinja",
          ".j2",
          ".jinja2",
          ".njk"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "HTML+ECR",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "html+ecr",
          "ecr"
        ],
        "@tm_scope": "text.html.ecr",
        "@ace_mode": "text",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 148,
        "@extensions": [
          ".ecr"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "HTML+EEX",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "html+eex",
          "eex"
        ],
        "@tm_scope": "text.html.elixir",
        "@ace_mode": "text",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 149,
        "@extensions": [
          ".eex"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "HTML+ERB",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "html+erb",
          "erb",
          "rhtml",
          "html+ruby"
        ],
        "@tm_scope": "text.html.erb",
        "@ace_mode": "text",
        "@codemirror_mode": "htmlembedded",
        "@codemirror_mime_type": "application/x-erb",
        "@wrap": false,
        "@language_id": 150,
        "@extensions": [
          ".erb",
          ".erb.deface",
          ".rhtml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "HTML+PHP",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "html+php"
        ],
        "@tm_scope": "text.html.php",
        "@ace_mode": "php",
        "@codemirror_mode": "php",
        "@codemirror_mime_type": "application/x-httpd-php",
        "@wrap": false,
        "@language_id": 151,
        "@extensions": [
          ".phtml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "HTML+Razor",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "html+razor",
          "razor"
        ],
        "@tm_scope": "text.html.cshtml",
        "@ace_mode": "razor",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 479039817,
        "@extensions": [
          ".cshtml",
          ".razor"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "HTTP",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "http"
        ],
        "@tm_scope": "source.httpspec",
        "@ace_mode": "text",
        "@codemirror_mode": "http",
        "@codemirror_mime_type": "message/http",
        "@wrap": false,
        "@language_id": 152,
        "@extensions": [
          ".http"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HXML",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "hxml"
        ],
        "@tm_scope": "source.hxml",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 786683730,
        "@extensions": [
          ".hxml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Hack",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#878787",
        "@aliases": [
          "hack"
        ],
        "@tm_scope": "source.hack",
        "@ace_mode": "php",
        "@codemirror_mode": "php",
        "@codemirror_mime_type": "application/x-httpd-php",
        "@wrap": false,
        "@language_id": 153,
        "@extensions": [
          ".hack",
          ".hh",
          ".hhi",
          ".php"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Haml",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#ece2a9",
        "@aliases": [
          "haml"
        ],
        "@tm_scope": "text.haml",
        "@ace_mode": "haml",
        "@codemirror_mode": "haml",
        "@codemirror_mime_type": "text/x-haml",
        "@wrap": false,
        "@language_id": 154,
        "@extensions": [
          ".haml",
          ".haml.deface"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Handlebars",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#f7931e",
        "@aliases": [
          "handlebars",
          "hbs",
          "htmlbars"
        ],
        "@tm_scope": "text.html.handlebars",
        "@ace_mode": "handlebars",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 155,
        "@extensions": [
          ".handlebars",
          ".hbs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Harbour",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0e60e3",
        "@aliases": [
          "harbour"
        ],
        "@tm_scope": "source.harbour",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 156,
        "@extensions": [
          ".hb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Haskell",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5e5086",
        "@aliases": [
          "haskell"
        ],
        "@tm_scope": "source.haskell",
        "@ace_mode": "haskell",
        "@codemirror_mode": "haskell",
        "@codemirror_mime_type": "text/x-haskell",
        "@wrap": false,
        "@language_id": 157,
        "@extensions": [
          ".hs",
          ".hs-boot",
          ".hsc"
        ],
        "@interpreters": [
          "runghc",
          "runhaskell",
          "runhugs"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Haxe",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#df7900",
        "@aliases": [
          "haxe"
        ],
        "@tm_scope": "source.hx",
        "@ace_mode": "haxe",
        "@codemirror_mode": "haxe",
        "@codemirror_mime_type": "text/x-haxe",
        "@wrap": false,
        "@language_id": 158,
        "@extensions": [
          ".hx",
          ".hxsl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HiveQL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dce200",
        "@aliases": [
          "hiveql"
        ],
        "@tm_scope": "source.hql",
        "@ace_mode": "sql",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 931814087,
        "@extensions": [
          ".q",
          ".hql"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HolyC",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ffefaf",
        "@aliases": [
          "holyc"
        ],
        "@tm_scope": "source.hc",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 928121743,
        "@extensions": [
          ".hc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Hy",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#7790B2",
        "@aliases": [
          "hy",
          "hylang"
        ],
        "@tm_scope": "source.hy",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 159,
        "@extensions": [
          ".hy"
        ],
        "@interpreters": [
          "hy"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "HyPhy",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "hyphy"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 160,
        "@extensions": [
          ".bf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "IDL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a3522f",
        "@aliases": [
          "idl"
        ],
        "@tm_scope": "source.idl",
        "@ace_mode": "text",
        "@codemirror_mode": "idl",
        "@codemirror_mime_type": "text/x-idl",
        "@wrap": false,
        "@language_id": 161,
        "@extensions": [
          ".pro",
          ".dlm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "IGOR Pro",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0000cc",
        "@aliases": [
          "igor-pro",
          "igor",
          "igorpro"
        ],
        "@tm_scope": "source.igor",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 162,
        "@extensions": [
          ".ipf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "INI",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ini",
          "dosini"
        ],
        "@tm_scope": "source.ini",
        "@ace_mode": "ini",
        "@codemirror_mode": "properties",
        "@codemirror_mime_type": "text/x-properties",
        "@wrap": false,
        "@language_id": 163,
        "@extensions": [
          ".ini",
          ".cfg",
          ".dof",
          ".lektorproject",
          ".prefs",
          ".pro",
          ".properties"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "buildozer.spec"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "IRC log",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "irc-log",
          "irc",
          "irc logs"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": "mirc",
        "@codemirror_mime_type": "text/mirc",
        "@wrap": false,
        "@language_id": 164,
        "@extensions": [
          ".irclog",
          ".weechatlog"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Idris",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#b30000",
        "@aliases": [
          "idris"
        ],
        "@tm_scope": "source.idris",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 165,
        "@extensions": [
          ".idr",
          ".lidr"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ignore List",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ignore-list",
          "ignore",
          "gitignore",
          "git-ignore"
        ],
        "@tm_scope": "source.gitignore",
        "@ace_mode": "gitignore",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 74444240,
        "@extensions": [
          ".gitignore"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".atomignore",
          ".babelignore",
          ".bzrignore",
          ".coffeelintignore",
          ".cvsignore",
          ".dockerignore",
          ".eslintignore",
          ".gitignore",
          ".nodemonignore",
          ".npmignore",
          ".prettierignore",
          ".stylelintignore",
          ".vscodeignore",
          "gitignore-global",
          "gitignore_global"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "Inform 7",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "inform-7",
          "i7",
          "inform7"
        ],
        "@tm_scope": "source.inform7",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 166,
        "@extensions": [
          ".ni",
          ".i7x"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Inno Setup",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "inno-setup"
        ],
        "@tm_scope": "source.inno",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 167,
        "@extensions": [
          ".iss",
          ".isl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Io",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a9188d",
        "@aliases": [
          "io"
        ],
        "@tm_scope": "source.io",
        "@ace_mode": "io",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 168,
        "@extensions": [
          ".io"
        ],
        "@interpreters": [
          "io"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ioke",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#078193",
        "@aliases": [
          "ioke"
        ],
        "@tm_scope": "source.ioke",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 169,
        "@extensions": [
          ".ik"
        ],
        "@interpreters": [
          "ioke"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Isabelle",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#FEFE00",
        "@aliases": [
          "isabelle"
        ],
        "@tm_scope": "source.isabelle.theory",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 170,
        "@extensions": [
          ".thy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Isabelle ROOT",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "isabelle-root"
        ],
        "@tm_scope": "source.isabelle.root",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 171,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "ROOT"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Isabelle"
      },
      {
        "@name": "J",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#9EEDFF",
        "@aliases": [
          "j"
        ],
        "@tm_scope": "source.j",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 172,
        "@extensions": [
          ".ijs"
        ],
        "@interpreters": [
          "jconsole"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "JFlex",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#DBCA00",
        "@aliases": [
          "jflex"
        ],
        "@tm_scope": "source.jflex",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 173,
        "@extensions": [
          ".flex",
          ".jflex"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Lex"
      },
      {
        "@name": "JSON",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "json"
        ],
        "@tm_scope": "source.json",
        "@ace_mode": "json",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 174,
        "@extensions": [
          ".json",
          ".avsc",
          ".geojson",
          ".gltf",
          ".har",
          ".ice",
          ".JSON-tmLanguage",
          ".jsonl",
          ".mcmeta",
          ".tfstate",
          ".tfstate.backup",
          ".topojson",
          ".webapp",
          ".webmanifest",
          ".yy",
          ".yyp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".arcconfig",
          ".htmlhintrc",
          ".tern-config",
          ".tern-project",
          ".watchmanconfig",
          "composer.lock",
          "mcmod.info"
        ],
        "@popular": false,
        "@searchable": false
      },
      {
        "@name": "JSON with Comments",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "json-with-comments",
          "jsonc"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "text/javascript",
        "@wrap": false,
        "@language_id": 423,
        "@extensions": [
          ".jsonc",
          ".sublime-build",
          ".sublime-commands",
          ".sublime-completions",
          ".sublime-keymap",
          ".sublime-macro",
          ".sublime-menu",
          ".sublime-mousemap",
          ".sublime-project",
          ".sublime-settings",
          ".sublime-theme",
          ".sublime-workspace",
          ".sublime_metrics",
          ".sublime_session"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".babelrc",
          ".eslintrc.json",
          ".jscsrc",
          ".jshintrc",
          ".jslintrc",
          "jsconfig.json",
          "language-configuration.json",
          "tsconfig.json",
          "tslint.json"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "JSON"
      },
      {
        "@name": "JSON5",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "json5"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 175,
        "@extensions": [
          ".json5"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "JSONLD",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "jsonld"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 176,
        "@extensions": [
          ".jsonld"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "JSONiq",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#40d47e",
        "@aliases": [
          "jsoniq"
        ],
        "@tm_scope": "source.jq",
        "@ace_mode": "jsoniq",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 177,
        "@extensions": [
          ".jq"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "JSX",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "jsx"
        ],
        "@tm_scope": "source.js.jsx",
        "@ace_mode": "javascript",
        "@codemirror_mode": "jsx",
        "@codemirror_mime_type": "text/jsx",
        "@wrap": false,
        "@language_id": 178,
        "@extensions": [
          ".jsx"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "JavaScript"
      },
      {
        "@name": "Jasmin",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "jasmin"
        ],
        "@tm_scope": "source.jasmin",
        "@ace_mode": "java",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 180,
        "@extensions": [
          ".j"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Java",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#b07219",
        "@aliases": [
          "java"
        ],
        "@tm_scope": "source.java",
        "@ace_mode": "java",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-java",
        "@wrap": false,
        "@language_id": 181,
        "@extensions": [
          ".java"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Java Properties",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "java-properties"
        ],
        "@tm_scope": "source.java-properties",
        "@ace_mode": "properties",
        "@codemirror_mode": "properties",
        "@codemirror_mime_type": "text/x-properties",
        "@wrap": false,
        "@language_id": 519377561,
        "@extensions": [
          ".properties"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Java Server Pages",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "java-server-pages",
          "jsp"
        ],
        "@tm_scope": "text.html.jsp",
        "@ace_mode": "jsp",
        "@codemirror_mode": "htmlembedded",
        "@codemirror_mime_type": "application/x-jsp",
        "@wrap": false,
        "@language_id": 182,
        "@extensions": [
          ".jsp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Java"
      },
      {
        "@name": "JavaScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f1e05a",
        "@aliases": [
          "javascript",
          "js",
          "node"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "text/javascript",
        "@wrap": false,
        "@language_id": 183,
        "@extensions": [
          ".js",
          "._js",
          ".bones",
          ".cjs",
          ".es",
          ".es6",
          ".frag",
          ".gs",
          ".jake",
          ".jsb",
          ".jscad",
          ".jsfl",
          ".jsm",
          ".jss",
          ".mjs",
          ".njs",
          ".pac",
          ".sjs",
          ".ssjs",
          ".xsjs",
          ".xsjslib"
        ],
        "@interpreters": [
          "chakra",
          "d8",
          "gjs",
          "js",
          "node",
          "nodejs",
          "qjs",
          "rhino",
          "v8",
          "v8-shell"
        ],
        "@filenames": [
          "Jakefile"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "JavaScript+ERB",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "javascript+erb"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/javascript",
        "@wrap": false,
        "@language_id": 914318960,
        "@extensions": [
          ".js.erb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "JavaScript"
      },
      {
        "@name": "Jison",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "jison"
        ],
        "@tm_scope": "source.jison",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 284531423,
        "@extensions": [
          ".jison"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Yacc"
      },
      {
        "@name": "Jison Lex",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "jison-lex"
        ],
        "@tm_scope": "source.jisonlex",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 406395330,
        "@extensions": [
          ".jisonlex"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Lex"
      },
      {
        "@name": "Jolie",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#843179",
        "@aliases": [
          "jolie"
        ],
        "@tm_scope": "source.jolie",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 998078858,
        "@extensions": [
          ".ol",
          ".iol"
        ],
        "@interpreters": [
          "jolie"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Jsonnet",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0064bd",
        "@aliases": [
          "jsonnet"
        ],
        "@tm_scope": "source.jsonnet",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 664885656,
        "@extensions": [
          ".jsonnet",
          ".libsonnet"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Julia",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a270ba",
        "@aliases": [
          "julia"
        ],
        "@tm_scope": "source.julia",
        "@ace_mode": "julia",
        "@codemirror_mode": "julia",
        "@codemirror_mime_type": "text/x-julia",
        "@wrap": false,
        "@language_id": 184,
        "@extensions": [
          ".jl"
        ],
        "@interpreters": [
          "julia"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Jupyter Notebook",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#DA5B0B",
        "@aliases": [
          "jupyter-notebook",
          "IPython Notebook"
        ],
        "@tm_scope": "source.json",
        "@ace_mode": "json",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 185,
        "@extensions": [
          ".ipynb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Notebook"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "KRL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#28430A",
        "@aliases": [
          "krl"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 186,
        "@extensions": [
          ".krl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Kaitai Struct",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#773b37",
        "@aliases": [
          "kaitai-struct",
          "ksy"
        ],
        "@tm_scope": "source.yaml",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 818804755,
        "@extensions": [
          ".ksy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "KiCad Layout",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "kicad-layout",
          "pcbnew"
        ],
        "@tm_scope": "source.pcb.sexp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 187,
        "@extensions": [
          ".kicad_pcb",
          ".kicad_mod",
          ".kicad_wks"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "fp-lib-table"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "KiCad Legacy Layout",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "kicad-legacy-layout"
        ],
        "@tm_scope": "source.pcb.board",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 140848857,
        "@extensions": [
          ".brd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "KiCad Schematic",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "kicad-schematic",
          "eeschema schematic"
        ],
        "@tm_scope": "source.pcb.schematic",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 622447435,
        "@extensions": [
          ".sch"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Kit",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "kit"
        ],
        "@tm_scope": "text.html.basic",
        "@ace_mode": "html",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 188,
        "@extensions": [
          ".kit"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Kotlin",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#F18E33",
        "@aliases": [
          "kotlin"
        ],
        "@tm_scope": "source.kotlin",
        "@ace_mode": "text",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-kotlin",
        "@wrap": false,
        "@language_id": 189,
        "@extensions": [
          ".kt",
          ".ktm",
          ".kts"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "LFE",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4C3023",
        "@aliases": [
          "lfe"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 190,
        "@extensions": [
          ".lfe"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LLVM",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#185619",
        "@aliases": [
          "llvm"
        ],
        "@tm_scope": "source.llvm",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 191,
        "@extensions": [
          ".ll"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LOLCODE",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cc9900",
        "@aliases": [
          "lolcode"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 192,
        "@extensions": [
          ".lol"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LSL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3d9970",
        "@aliases": [
          "lsl"
        ],
        "@tm_scope": "source.lsl",
        "@ace_mode": "lsl",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 193,
        "@extensions": [
          ".lsl",
          ".lslp"
        ],
        "@interpreters": [
          "lsl"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LTspice Symbol",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ltspice-symbol"
        ],
        "@tm_scope": "source.ltspice.symbol",
        "@ace_mode": "text",
        "@codemirror_mode": "spreadsheet",
        "@codemirror_mime_type": "text/x-spreadsheet",
        "@wrap": false,
        "@language_id": 1013566805,
        "@extensions": [
          ".asy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LabVIEW",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "labview"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 194,
        "@extensions": [
          ".lvproj"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Lasso",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#999999",
        "@aliases": [
          "lasso",
          "lassoscript"
        ],
        "@tm_scope": "file.lasso",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 195,
        "@extensions": [
          ".lasso",
          ".las",
          ".lasso8",
          ".lasso9"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Latte",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#f2a542",
        "@aliases": [
          "latte"
        ],
        "@tm_scope": "text.html.smarty",
        "@ace_mode": "smarty",
        "@codemirror_mode": "smarty",
        "@codemirror_mime_type": "text/x-smarty",
        "@wrap": false,
        "@language_id": 196,
        "@extensions": [
          ".latte"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Lean",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "lean"
        ],
        "@tm_scope": "source.lean",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 197,
        "@extensions": [
          ".lean",
          ".hlean"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Less",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#1d365d",
        "@aliases": [
          "less"
        ],
        "@tm_scope": "source.css.less",
        "@ace_mode": "less",
        "@codemirror_mode": "css",
        "@codemirror_mime_type": "text/css",
        "@wrap": false,
        "@language_id": 198,
        "@extensions": [
          ".less"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Lex",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#DBCA00",
        "@aliases": [
          "lex",
          "flex"
        ],
        "@tm_scope": "source.lex",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 199,
        "@extensions": [
          ".l",
          ".lex"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Lexer.x",
          "lexer.x"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LilyPond",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "lilypond"
        ],
        "@tm_scope": "source.lilypond",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 200,
        "@extensions": [
          ".ly",
          ".ily"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Limbo",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "limbo"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 201,
        "@extensions": [
          ".b",
          ".m"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Linker Script",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "linker-script"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 202,
        "@extensions": [
          ".ld",
          ".lds",
          ".x"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "ld.script"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Linux Kernel Module",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "linux-kernel-module"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 203,
        "@extensions": [
          ".mod"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Liquid",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "liquid"
        ],
        "@tm_scope": "text.html.liquid",
        "@ace_mode": "liquid",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 204,
        "@extensions": [
          ".liquid"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Literate Agda",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "literate-agda"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 205,
        "@extensions": [
          ".lagda"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Agda"
      },
      {
        "@name": "Literate CoffeeScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "literate-coffeescript",
          "litcoffee"
        ],
        "@tm_scope": "source.litcoffee",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 206,
        "@extensions": [
          ".litcoffee",
          ".coffee.md"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "CoffeeScript"
      },
      {
        "@name": "Literate Haskell",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "literate-haskell",
          "lhaskell",
          "lhs"
        ],
        "@tm_scope": "text.tex.latex.haskell",
        "@ace_mode": "text",
        "@codemirror_mode": "haskell-literate",
        "@codemirror_mime_type": "text/x-literate-haskell",
        "@wrap": false,
        "@language_id": 207,
        "@extensions": [
          ".lhs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Haskell"
      },
      {
        "@name": "LiveScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#499886",
        "@aliases": [
          "livescript",
          "live-script",
          "ls"
        ],
        "@tm_scope": "source.livescript",
        "@ace_mode": "livescript",
        "@codemirror_mode": "livescript",
        "@codemirror_mime_type": "text/x-livescript",
        "@wrap": false,
        "@language_id": 208,
        "@extensions": [
          ".ls",
          "._ls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Slakefile"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Logos",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "logos"
        ],
        "@tm_scope": "source.logos",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 209,
        "@extensions": [
          ".xm",
          ".x",
          ".xi"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Logtalk",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "logtalk"
        ],
        "@tm_scope": "source.logtalk",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 210,
        "@extensions": [
          ".lgt",
          ".logtalk"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LookML",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#652B81",
        "@aliases": [
          "lookml"
        ],
        "@tm_scope": "source.yaml",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 211,
        "@extensions": [
          ".lookml",
          ".model.lkml",
          ".view.lkml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "LoomScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "loomscript"
        ],
        "@tm_scope": "source.loomscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 212,
        "@extensions": [
          ".ls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Lua",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#000080",
        "@aliases": [
          "lua"
        ],
        "@tm_scope": "source.lua",
        "@ace_mode": "lua",
        "@codemirror_mode": "lua",
        "@codemirror_mime_type": "text/x-lua",
        "@wrap": false,
        "@language_id": 213,
        "@extensions": [
          ".lua",
          ".fcgi",
          ".nse",
          ".p8",
          ".pd_lua",
          ".rbxs",
          ".rockspec",
          ".wlua"
        ],
        "@interpreters": [
          "lua"
        ],
        "@filenames": [
          ".luacheckrc"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "M",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "m",
          "mumps"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": "mumps",
        "@codemirror_mime_type": "text/x-mumps",
        "@wrap": false,
        "@language_id": 214,
        "@extensions": [
          ".mumps",
          ".m"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "M4",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "m4"
        ],
        "@tm_scope": "source.m4",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 215,
        "@extensions": [
          ".m4"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "M4Sugar",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "m4sugar",
          "autoconf"
        ],
        "@tm_scope": "source.m4",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 216,
        "@extensions": [
          ".m4"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "configure.ac"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "M4"
      },
      {
        "@name": "MATLAB",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#e16737",
        "@aliases": [
          "matlab",
          "octave"
        ],
        "@tm_scope": "source.matlab",
        "@ace_mode": "matlab",
        "@codemirror_mode": "octave",
        "@codemirror_mime_type": "text/x-octave",
        "@wrap": false,
        "@language_id": 225,
        "@extensions": [
          ".matlab",
          ".m"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MAXScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00a6a6",
        "@aliases": [
          "maxscript"
        ],
        "@tm_scope": "source.maxscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 217,
        "@extensions": [
          ".ms",
          ".mcr"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MLIR",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5EC8DB",
        "@aliases": [
          "mlir"
        ],
        "@tm_scope": "source.mlir",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 448253929,
        "@extensions": [
          ".mlir"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MQL4",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#62A8D6",
        "@aliases": [
          "mql4"
        ],
        "@tm_scope": "source.mql5",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 426,
        "@extensions": [
          ".mq4",
          ".mqh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MQL5",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4A76B8",
        "@aliases": [
          "mql5"
        ],
        "@tm_scope": "source.mql5",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 427,
        "@extensions": [
          ".mq5",
          ".mqh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MTML",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#b7e1f4",
        "@aliases": [
          "mtml"
        ],
        "@tm_scope": "text.html.basic",
        "@ace_mode": "html",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 218,
        "@extensions": [
          ".mtml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MUF",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "muf"
        ],
        "@tm_scope": "none",
        "@ace_mode": "forth",
        "@codemirror_mode": "forth",
        "@codemirror_mime_type": "text/x-forth",
        "@wrap": false,
        "@language_id": 219,
        "@extensions": [
          ".muf",
          ".m"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Forth"
      },
      {
        "@name": "Macaulay2",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#d8ffff",
        "@aliases": [
          "macaulay2",
          "m2"
        ],
        "@tm_scope": "source.m2",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 34167825,
        "@extensions": [
          ".m2"
        ],
        "@interpreters": [
          "M2"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Makefile",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#427819",
        "@aliases": [
          "makefile",
          "bsdmake",
          "make",
          "mf"
        ],
        "@tm_scope": "source.makefile",
        "@ace_mode": "makefile",
        "@codemirror_mode": "cmake",
        "@codemirror_mime_type": "text/x-cmake",
        "@wrap": false,
        "@language_id": 220,
        "@extensions": [
          ".mak",
          ".d",
          ".make",
          ".mk",
          ".mkfile"
        ],
        "@interpreters": [
          "make"
        ],
        "@filenames": [
          "BSDmakefile",
          "GNUmakefile",
          "Kbuild",
          "Makefile",
          "Makefile.am",
          "Makefile.boot",
          "Makefile.frag",
          "Makefile.in",
          "Makefile.inc",
          "Makefile.wat",
          "makefile",
          "makefile.sco",
          "mkfile"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Mako",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "mako"
        ],
        "@tm_scope": "text.html.mako",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 221,
        "@extensions": [
          ".mako",
          ".mao"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Markdown",
        "@fs_name": null,
        "@type": "prose",
        "@color": "#083fa1",
        "@aliases": [
          "markdown",
          "pandoc"
        ],
        "@tm_scope": "source.gfm",
        "@ace_mode": "markdown",
        "@codemirror_mode": "gfm",
        "@codemirror_mime_type": "text/x-gfm",
        "@wrap": true,
        "@language_id": 222,
        "@extensions": [
          ".md",
          ".markdown",
          ".mdown",
          ".mdwn",
          ".mdx",
          ".mkd",
          ".mkdn",
          ".mkdown",
          ".ronn",
          ".workbook"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "contents.lr"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Marko",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#42bff2",
        "@aliases": [
          "marko",
          "markojs"
        ],
        "@tm_scope": "text.marko",
        "@ace_mode": "text",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 932782397,
        "@extensions": [
          ".marko"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Mask",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#f97732",
        "@aliases": [
          "mask"
        ],
        "@tm_scope": "source.mask",
        "@ace_mode": "mask",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 223,
        "@extensions": [
          ".mask"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Mathematica",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "mathematica",
          "mma"
        ],
        "@tm_scope": "source.mathematica",
        "@ace_mode": "text",
        "@codemirror_mode": "mathematica",
        "@codemirror_mime_type": "text/x-mathematica",
        "@wrap": false,
        "@language_id": 224,
        "@extensions": [
          ".mathematica",
          ".cdf",
          ".m",
          ".ma",
          ".mt",
          ".nb",
          ".nbp",
          ".wl",
          ".wlt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Maven POM",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "maven-pom"
        ],
        "@tm_scope": "text.xml.pom",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 226,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "pom.xml"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Max",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c4a79c",
        "@aliases": [
          "max",
          "max/msp",
          "maxmsp"
        ],
        "@tm_scope": "source.json",
        "@ace_mode": "json",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/json",
        "@wrap": false,
        "@language_id": 227,
        "@extensions": [
          ".maxpat",
          ".maxhelp",
          ".maxproj",
          ".mxt",
          ".pat"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MediaWiki",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "mediawiki"
        ],
        "@tm_scope": "text.html.mediawiki",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 228,
        "@extensions": [
          ".mediawiki",
          ".wiki"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Mercury",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff2b2b",
        "@aliases": [
          "mercury"
        ],
        "@tm_scope": "source.mercury",
        "@ace_mode": "prolog",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 229,
        "@extensions": [
          ".m",
          ".moo"
        ],
        "@interpreters": [
          "mmi"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Meson",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#007800",
        "@aliases": [
          "meson"
        ],
        "@tm_scope": "source.meson",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 799141244,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "meson.build",
          "meson_options.txt"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Metal",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#8f14e9",
        "@aliases": [
          "metal"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 230,
        "@extensions": [
          ".metal"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Microsoft Developer Studio Project",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "microsoft-developer-studio-project"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 800983837,
        "@extensions": [
          ".dsp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MiniD",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "minid"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 231,
        "@extensions": [
          ".minid"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": false
      },
      {
        "@name": "Mirah",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c7a938",
        "@aliases": [
          "mirah"
        ],
        "@tm_scope": "source.ruby",
        "@ace_mode": "ruby",
        "@codemirror_mode": "ruby",
        "@codemirror_mime_type": "text/x-ruby",
        "@wrap": false,
        "@language_id": 232,
        "@extensions": [
          ".druby",
          ".duby",
          ".mirah"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Modelica",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "modelica"
        ],
        "@tm_scope": "source.modelica",
        "@ace_mode": "text",
        "@codemirror_mode": "modelica",
        "@codemirror_mime_type": "text/x-modelica",
        "@wrap": false,
        "@language_id": 233,
        "@extensions": [
          ".mo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Modula-2",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "modula-2"
        ],
        "@tm_scope": "source.modula2",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 234,
        "@extensions": [
          ".mod"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Modula-3",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#223388",
        "@aliases": [
          "modula-3"
        ],
        "@tm_scope": "source.modula-3",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 564743864,
        "@extensions": [
          ".i3",
          ".ig",
          ".m3",
          ".mg"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Module Management System",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "module-management-system"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 235,
        "@extensions": [
          ".mms",
          ".mmk"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "descrip.mmk",
          "descrip.mms"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Monkey",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "monkey"
        ],
        "@tm_scope": "source.monkey",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 236,
        "@extensions": [
          ".monkey",
          ".monkey2"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Moocode",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "moocode"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 237,
        "@extensions": [
          ".moo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "MoonScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "moonscript"
        ],
        "@tm_scope": "source.moonscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 238,
        "@extensions": [
          ".moon"
        ],
        "@interpreters": [
          "moon"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Motorola 68K Assembly",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "motorola-68k-assembly",
          "m68k"
        ],
        "@tm_scope": "source.m68k",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 477582706,
        "@extensions": [
          ".asm",
          ".i",
          ".inc",
          ".s",
          ".x68"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Assembly"
      },
      {
        "@name": "Muse",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "muse",
          "amusewiki",
          "emacs muse"
        ],
        "@tm_scope": "text.muse",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 474864066,
        "@extensions": [
          ".muse"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Mustache",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "mustache"
        ],
        "@tm_scope": "text.html.smarty",
        "@ace_mode": "smarty",
        "@codemirror_mode": "smarty",
        "@codemirror_mime_type": "text/x-smarty",
        "@wrap": false,
        "@language_id": 638334590,
        "@extensions": [
          ".mustache"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "Myghty",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "myghty"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 239,
        "@extensions": [
          ".myt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NASL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "nasl"
        ],
        "@tm_scope": "source.nasl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 171666519,
        "@extensions": [
          ".nasl",
          ".inc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NCL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#28431f",
        "@aliases": [
          "ncl"
        ],
        "@tm_scope": "source.ncl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 240,
        "@extensions": [
          ".ncl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NEON",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "neon",
          "nette object notation",
          "ne-on"
        ],
        "@tm_scope": "source.neon",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 481192983,
        "@extensions": [
          ".neon"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NL",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "nl"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 241,
        "@extensions": [
          ".nl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NPM Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "npm-config",
          "npmrc"
        ],
        "@tm_scope": "source.ini.npmrc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 685022663,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".npmrc"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "NSIS",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "nsis"
        ],
        "@tm_scope": "source.nsis",
        "@ace_mode": "text",
        "@codemirror_mode": "nsis",
        "@codemirror_mime_type": "text/x-nsis",
        "@wrap": false,
        "@language_id": 242,
        "@extensions": [
          ".nsi",
          ".nsh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nearley",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#990000",
        "@aliases": [
          "nearley"
        ],
        "@tm_scope": "source.ne",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 521429430,
        "@extensions": [
          ".ne",
          ".nearley"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nemerle",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3d3c6e",
        "@aliases": [
          "nemerle"
        ],
        "@tm_scope": "source.nemerle",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 243,
        "@extensions": [
          ".n"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NetLinx",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0aa0ff",
        "@aliases": [
          "netlinx"
        ],
        "@tm_scope": "source.netlinx",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 244,
        "@extensions": [
          ".axs",
          ".axi"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NetLinx+ERB",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#747faa",
        "@aliases": [
          "netlinx+erb"
        ],
        "@tm_scope": "source.netlinx.erb",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 245,
        "@extensions": [
          ".axs.erb",
          ".axi.erb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NetLogo",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff6375",
        "@aliases": [
          "netlogo"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 246,
        "@extensions": [
          ".nlogo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NewLisp",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#87AED7",
        "@aliases": [
          "newlisp"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 247,
        "@extensions": [
          ".nl",
          ".lisp",
          ".lsp"
        ],
        "@interpreters": [
          "newlisp"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nextflow",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3ac486",
        "@aliases": [
          "nextflow"
        ],
        "@tm_scope": "source.nextflow",
        "@ace_mode": "groovy",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 506780613,
        "@extensions": [
          ".nf"
        ],
        "@interpreters": [
          "nextflow"
        ],
        "@filenames": [
          "nextflow.config"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nginx",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "nginx",
          "nginx configuration file"
        ],
        "@tm_scope": "source.nginx",
        "@ace_mode": "text",
        "@codemirror_mode": "nginx",
        "@codemirror_mime_type": "text/x-nginx-conf",
        "@wrap": false,
        "@language_id": 248,
        "@extensions": [
          ".nginx",
          ".nginxconf",
          ".vhost"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "nginx.conf"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nim",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ffc200",
        "@aliases": [
          "nim"
        ],
        "@tm_scope": "source.nim",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 249,
        "@extensions": [
          ".nim",
          ".nim.cfg",
          ".nimble",
          ".nimrod",
          ".nims"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "nim.cfg"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ninja",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ninja"
        ],
        "@tm_scope": "source.ninja",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 250,
        "@extensions": [
          ".ninja"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nit",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#009917",
        "@aliases": [
          "nit"
        ],
        "@tm_scope": "source.nit",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 251,
        "@extensions": [
          ".nit"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nix",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#7e7eff",
        "@aliases": [
          "nix",
          "nixos"
        ],
        "@tm_scope": "source.nix",
        "@ace_mode": "nix",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 252,
        "@extensions": [
          ".nix"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Nu",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c9df40",
        "@aliases": [
          "nu",
          "nush"
        ],
        "@tm_scope": "source.nu",
        "@ace_mode": "scheme",
        "@codemirror_mode": "scheme",
        "@codemirror_mime_type": "text/x-scheme",
        "@wrap": false,
        "@language_id": 253,
        "@extensions": [
          ".nu"
        ],
        "@interpreters": [
          "nush"
        ],
        "@filenames": [
          "Nukefile"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "NumPy",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#9C8AF9",
        "@aliases": [
          "numpy"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-python",
        "@wrap": false,
        "@language_id": 254,
        "@extensions": [
          ".numpy",
          ".numpyw",
          ".numsc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Python"
      },
      {
        "@name": "OCaml",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3be133",
        "@aliases": [
          "ocaml"
        ],
        "@tm_scope": "source.ocaml",
        "@ace_mode": "ocaml",
        "@codemirror_mode": "mllike",
        "@codemirror_mime_type": "text/x-ocaml",
        "@wrap": false,
        "@language_id": 255,
        "@extensions": [
          ".ml",
          ".eliom",
          ".eliomi",
          ".ml4",
          ".mli",
          ".mll",
          ".mly"
        ],
        "@interpreters": [
          "ocaml",
          "ocamlrun",
          "ocamlscript"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ObjDump",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "objdump"
        ],
        "@tm_scope": "objdump.x86asm",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 256,
        "@extensions": [
          ".objdump"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Object Data Instance Notation",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "object-data-instance-notation"
        ],
        "@tm_scope": "source.odin-ehr",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 985227236,
        "@extensions": [
          ".odin"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ObjectScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#424893",
        "@aliases": [
          "objectscript"
        ],
        "@tm_scope": "source.objectscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 202735509,
        "@extensions": [
          ".cls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Objective-C",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#438eff",
        "@aliases": [
          "objective-c",
          "obj-c",
          "objc",
          "objectivec"
        ],
        "@tm_scope": "source.objc",
        "@ace_mode": "objectivec",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-objectivec",
        "@wrap": false,
        "@language_id": 257,
        "@extensions": [
          ".m",
          ".h"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Objective-C++",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6866fb",
        "@aliases": [
          "objective-c++",
          "obj-c++",
          "objc++",
          "objectivec++"
        ],
        "@tm_scope": "source.objc++",
        "@ace_mode": "objectivec",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-objectivec",
        "@wrap": false,
        "@language_id": 258,
        "@extensions": [
          ".mm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Objective-J",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff0c5a",
        "@aliases": [
          "objective-j",
          "obj-j",
          "objectivej",
          "objj"
        ],
        "@tm_scope": "source.js.objj",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 259,
        "@extensions": [
          ".j",
          ".sj"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Odin",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#60AFFE",
        "@aliases": [
          "odin",
          "odinlang",
          "odin-lang"
        ],
        "@tm_scope": "source.odin",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 889244082,
        "@extensions": [
          ".odin"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Omgrofl",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cabbff",
        "@aliases": [
          "omgrofl"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 260,
        "@extensions": [
          ".omgrofl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Opa",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "opa"
        ],
        "@tm_scope": "source.opa",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 261,
        "@extensions": [
          ".opa"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Opal",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f7ede0",
        "@aliases": [
          "opal"
        ],
        "@tm_scope": "source.opal",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 262,
        "@extensions": [
          ".opal"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Open Policy Agent",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "open-policy-agent"
        ],
        "@tm_scope": "source.rego",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 840483232,
        "@extensions": [
          ".rego"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "OpenCL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "opencl"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 263,
        "@extensions": [
          ".cl",
          ".opencl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "C"
      },
      {
        "@name": "OpenEdge ABL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "openedge-abl",
          "progress",
          "openedge",
          "abl"
        ],
        "@tm_scope": "source.abl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 264,
        "@extensions": [
          ".p",
          ".cls",
          ".w"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "OpenQASM",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#AA70FF",
        "@aliases": [
          "openqasm"
        ],
        "@tm_scope": "source.qasm",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 153739399,
        "@extensions": [
          ".qasm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "OpenRC runscript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "openrc-runscript",
          "openrc"
        ],
        "@tm_scope": "source.shell",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 265,
        "@extensions": [
        ],
        "@interpreters": [
          "openrc-run"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Shell"
      },
      {
        "@name": "OpenSCAD",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "openscad"
        ],
        "@tm_scope": "source.scad",
        "@ace_mode": "scad",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 266,
        "@extensions": [
          ".scad"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "OpenStep Property List",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "openstep-property-list"
        ],
        "@tm_scope": "source.plist",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 598917541,
        "@extensions": [
          ".plist"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "OpenType Feature File",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "opentype-feature-file",
          "AFDKO"
        ],
        "@tm_scope": "source.opentype",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 374317347,
        "@extensions": [
          ".fea"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Org",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "org"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 267,
        "@extensions": [
          ".org"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ox",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "ox"
        ],
        "@tm_scope": "source.ox",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 268,
        "@extensions": [
          ".ox",
          ".oxh",
          ".oxo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Oxygene",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cdd0e3",
        "@aliases": [
          "oxygene"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 269,
        "@extensions": [
          ".oxygene"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Oz",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#fab738",
        "@aliases": [
          "oz"
        ],
        "@tm_scope": "source.oz",
        "@ace_mode": "text",
        "@codemirror_mode": "oz",
        "@codemirror_mime_type": "text/x-oz",
        "@wrap": false,
        "@language_id": 270,
        "@extensions": [
          ".oz"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "P4",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#7055b5",
        "@aliases": [
          "p4"
        ],
        "@tm_scope": "source.p4",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 348895984,
        "@extensions": [
          ".p4"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PHP",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4F5D95",
        "@aliases": [
          "php",
          "inc"
        ],
        "@tm_scope": "text.html.php",
        "@ace_mode": "php",
        "@codemirror_mode": "php",
        "@codemirror_mime_type": "application/x-httpd-php",
        "@wrap": false,
        "@language_id": 272,
        "@extensions": [
          ".php",
          ".aw",
          ".ctp",
          ".fcgi",
          ".inc",
          ".php3",
          ".php4",
          ".php5",
          ".phps",
          ".phpt"
        ],
        "@interpreters": [
          "php"
        ],
        "@filenames": [
          ".php",
          ".php_cs",
          ".php_cs.dist",
          "Phakefile"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "PLSQL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dad8d8",
        "@aliases": [
          "plsql"
        ],
        "@tm_scope": "none",
        "@ace_mode": "sql",
        "@codemirror_mode": "sql",
        "@codemirror_mime_type": "text/x-plsql",
        "@wrap": false,
        "@language_id": 273,
        "@extensions": [
          ".pls",
          ".bdy",
          ".ddl",
          ".fnc",
          ".pck",
          ".pkb",
          ".pks",
          ".plb",
          ".plsql",
          ".prc",
          ".spc",
          ".sql",
          ".tpb",
          ".tps",
          ".trg",
          ".vw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PLpgSQL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "plpgsql"
        ],
        "@tm_scope": "source.sql",
        "@ace_mode": "pgsql",
        "@codemirror_mode": "sql",
        "@codemirror_mime_type": "text/x-sql",
        "@wrap": false,
        "@language_id": 274,
        "@extensions": [
          ".pgsql",
          ".sql"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "POV-Ray SDL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "pov-ray-sdl",
          "pov-ray",
          "povray"
        ],
        "@tm_scope": "source.pov-ray sdl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 275,
        "@extensions": [
          ".pov",
          ".inc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pan",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cc0000",
        "@aliases": [
          "pan"
        ],
        "@tm_scope": "source.pan",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 276,
        "@extensions": [
          ".pan"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Papyrus",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#6600cc",
        "@aliases": [
          "papyrus"
        ],
        "@tm_scope": "source.papyrus.skyrim",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 277,
        "@extensions": [
          ".psc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Parrot",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f3ca0a",
        "@aliases": [
          "parrot"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 278,
        "@extensions": [
          ".parrot"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Parrot Assembly",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "parrot-assembly",
          "pasm"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 279,
        "@extensions": [
          ".pasm"
        ],
        "@interpreters": [
          "parrot"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Parrot"
      },
      {
        "@name": "Parrot Internal Representation",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "parrot-internal-representation",
          "pir"
        ],
        "@tm_scope": "source.parrot.pir",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 280,
        "@extensions": [
          ".pir"
        ],
        "@interpreters": [
          "parrot"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Parrot"
      },
      {
        "@name": "Pascal",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#E3F171",
        "@aliases": [
          "pascal"
        ],
        "@tm_scope": "source.pascal",
        "@ace_mode": "pascal",
        "@codemirror_mode": "pascal",
        "@codemirror_mime_type": "text/x-pascal",
        "@wrap": false,
        "@language_id": 281,
        "@extensions": [
          ".pas",
          ".dfm",
          ".dpr",
          ".inc",
          ".lpr",
          ".pascal",
          ".pp"
        ],
        "@interpreters": [
          "instantfpc"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pawn",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dbb284",
        "@aliases": [
          "pawn"
        ],
        "@tm_scope": "source.pawn",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 271,
        "@extensions": [
          ".pwn",
          ".inc",
          ".sma"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pep8",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#C76F5B",
        "@aliases": [
          "pep8"
        ],
        "@tm_scope": "source.pep8",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 840372442,
        "@extensions": [
          ".pep"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Perl",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0298c3",
        "@aliases": [
          "perl",
          "cperl"
        ],
        "@tm_scope": "source.perl",
        "@ace_mode": "perl",
        "@codemirror_mode": "perl",
        "@codemirror_mime_type": "text/x-perl",
        "@wrap": false,
        "@language_id": 282,
        "@extensions": [
          ".pl",
          ".al",
          ".cgi",
          ".fcgi",
          ".perl",
          ".ph",
          ".plx",
          ".pm",
          ".psgi",
          ".t"
        ],
        "@interpreters": [
          "cperl",
          "perl"
        ],
        "@filenames": [
          "Makefile.PL",
          "Rexfile",
          "ack",
          "cpanfile"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Pic",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "pic"
        ],
        "@tm_scope": "source.pic",
        "@ace_mode": "text",
        "@codemirror_mode": "troff",
        "@codemirror_mime_type": "text/troff",
        "@wrap": false,
        "@language_id": 425,
        "@extensions": [
          ".pic",
          ".chem"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Roff"
      },
      {
        "@name": "Pickle",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "pickle"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 284,
        "@extensions": [
          ".pkl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PicoLisp",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "picolisp"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 285,
        "@extensions": [
          ".l"
        ],
        "@interpreters": [
          "picolisp",
          "pil"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PigLatin",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#fcd7de",
        "@aliases": [
          "piglatin"
        ],
        "@tm_scope": "source.pig_latin",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 286,
        "@extensions": [
          ".pig"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pike",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#005390",
        "@aliases": [
          "pike"
        ],
        "@tm_scope": "source.pike",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 287,
        "@extensions": [
          ".pike",
          ".pmod"
        ],
        "@interpreters": [
          "pike"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PlantUML",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "plantuml"
        ],
        "@tm_scope": "source.wsd",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 833504686,
        "@extensions": [
          ".puml",
          ".iuml",
          ".plantuml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pod",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "pod"
        ],
        "@tm_scope": "none",
        "@ace_mode": "perl",
        "@codemirror_mode": "perl",
        "@codemirror_mime_type": "text/x-perl",
        "@wrap": true,
        "@language_id": 288,
        "@extensions": [
          ".pod"
        ],
        "@interpreters": [
          "perl"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pod 6",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "pod-6"
        ],
        "@tm_scope": "source.perl6fe",
        "@ace_mode": "perl",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 155357471,
        "@extensions": [
          ".pod",
          ".pod6"
        ],
        "@interpreters": [
          "perl6"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PogoScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#d80074",
        "@aliases": [
          "pogoscript"
        ],
        "@tm_scope": "source.pogoscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 289,
        "@extensions": [
          ".pogo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pony",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "pony"
        ],
        "@tm_scope": "source.pony",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 290,
        "@extensions": [
          ".pony"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PostCSS",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "postcss"
        ],
        "@tm_scope": "source.postcss",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 262764437,
        "@extensions": [
          ".pcss",
          ".postcss"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "CSS"
      },
      {
        "@name": "PostScript",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#da291c",
        "@aliases": [
          "postscript",
          "postscr"
        ],
        "@tm_scope": "source.postscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 291,
        "@extensions": [
          ".ps",
          ".eps",
          ".epsi",
          ".pfa"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PowerBuilder",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#8f0f8d",
        "@aliases": [
          "powerbuilder"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 292,
        "@extensions": [
          ".pbt",
          ".sra",
          ".sru",
          ".srw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PowerShell",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#012456",
        "@aliases": [
          "powershell",
          "posh",
          "pwsh"
        ],
        "@tm_scope": "source.powershell",
        "@ace_mode": "powershell",
        "@codemirror_mode": "powershell",
        "@codemirror_mime_type": "application/x-powershell",
        "@wrap": false,
        "@language_id": 293,
        "@extensions": [
          ".ps1",
          ".psd1",
          ".psm1"
        ],
        "@interpreters": [
          "pwsh"
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Prisma",
        "@fs_name": null,
        "@type": "data",
        "@color": "#0c344b",
        "@aliases": [
          "prisma"
        ],
        "@tm_scope": "source.prisma",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 499933428,
        "@extensions": [
          ".prisma"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Processing",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0096D8",
        "@aliases": [
          "processing"
        ],
        "@tm_scope": "source.processing",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 294,
        "@extensions": [
          ".pde"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Proguard",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "proguard"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 716513858,
        "@extensions": [
          ".pro"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Prolog",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#74283c",
        "@aliases": [
          "prolog"
        ],
        "@tm_scope": "source.prolog",
        "@ace_mode": "prolog",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 295,
        "@extensions": [
          ".pl",
          ".pro",
          ".prolog",
          ".yap"
        ],
        "@interpreters": [
          "swipl",
          "yap"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Propeller Spin",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#7fa2a7",
        "@aliases": [
          "propeller-spin"
        ],
        "@tm_scope": "source.spin",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 296,
        "@extensions": [
          ".spin"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Protocol Buffer",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "protocol-buffer",
          "protobuf",
          "Protocol Buffers"
        ],
        "@tm_scope": "source.protobuf",
        "@ace_mode": "protobuf",
        "@codemirror_mode": "protobuf",
        "@codemirror_mime_type": "text/x-protobuf",
        "@wrap": false,
        "@language_id": 297,
        "@extensions": [
          ".proto"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Public Key",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "public-key"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": "asciiarmor",
        "@codemirror_mime_type": "application/pgp",
        "@wrap": false,
        "@language_id": 298,
        "@extensions": [
          ".asc",
          ".pub"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pug",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#a86454",
        "@aliases": [
          "pug"
        ],
        "@tm_scope": "text.jade",
        "@ace_mode": "jade",
        "@codemirror_mode": "pug",
        "@codemirror_mime_type": "text/x-pug",
        "@wrap": false,
        "@language_id": 179,
        "@extensions": [
          ".jade",
          ".pug"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Puppet",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#302B6D",
        "@aliases": [
          "puppet"
        ],
        "@tm_scope": "source.puppet",
        "@ace_mode": "text",
        "@codemirror_mode": "puppet",
        "@codemirror_mime_type": "text/x-puppet",
        "@wrap": false,
        "@language_id": 299,
        "@extensions": [
          ".pp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Modulefile"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Pure Data",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "pure-data"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 300,
        "@extensions": [
          ".pd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PureBasic",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5a6986",
        "@aliases": [
          "purebasic"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 301,
        "@extensions": [
          ".pb",
          ".pbi"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "PureScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#1D222D",
        "@aliases": [
          "purescript"
        ],
        "@tm_scope": "source.purescript",
        "@ace_mode": "haskell",
        "@codemirror_mode": "haskell",
        "@codemirror_mime_type": "text/x-haskell",
        "@wrap": false,
        "@language_id": 302,
        "@extensions": [
          ".purs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Python",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3572A5",
        "@aliases": [
          "python",
          "python3",
          "rusthon"
        ],
        "@tm_scope": "source.python",
        "@ace_mode": "python",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-python",
        "@wrap": false,
        "@language_id": 303,
        "@extensions": [
          ".py",
          ".cgi",
          ".fcgi",
          ".gyp",
          ".gypi",
          ".lmi",
          ".py3",
          ".pyde",
          ".pyi",
          ".pyp",
          ".pyt",
          ".pyw",
          ".rpy",
          ".smk",
          ".spec",
          ".tac",
          ".wsgi",
          ".xpy"
        ],
        "@interpreters": [
          "python",
          "python2",
          "python3"
        ],
        "@filenames": [
          ".gclient",
          "DEPS",
          "SConscript",
          "SConstruct",
          "Snakefile",
          "wscript"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Python console",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "python-console",
          "pycon"
        ],
        "@tm_scope": "text.python.console",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 428,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": false,
        "@group_name": "Python"
      },
      {
        "@name": "Python traceback",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "python-traceback"
        ],
        "@tm_scope": "text.python.traceback",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 304,
        "@extensions": [
          ".pytb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": false,
        "@group_name": "Python"
      },
      {
        "@name": "Q#",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#fed659",
        "@aliases": [
          "q#",
          "qsharp"
        ],
        "@tm_scope": "source.qsharp",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 697448245,
        "@extensions": [
          ".qs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "QML",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#44a51c",
        "@aliases": [
          "qml"
        ],
        "@tm_scope": "source.qml",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 305,
        "@extensions": [
          ".qml",
          ".qbs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "QMake",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "qmake"
        ],
        "@tm_scope": "source.qmake",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 306,
        "@extensions": [
          ".pro",
          ".pri"
        ],
        "@interpreters": [
          "qmake"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Qt Script",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00b841",
        "@aliases": [
          "qt-script"
        ],
        "@tm_scope": "source.js",
        "@ace_mode": "javascript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "text/javascript",
        "@wrap": false,
        "@language_id": 558193693,
        "@extensions": [
          ".qs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "installscript.qs",
          "toolchain_installscript.qs"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Quake",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#882233",
        "@aliases": [
          "quake"
        ],
        "@tm_scope": "source.quake",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 375265331,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "m3makefile",
          "m3overrides"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "R",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#198CE7",
        "@aliases": [
          "r",
          "R",
          "Rscript",
          "splus"
        ],
        "@tm_scope": "source.r",
        "@ace_mode": "r",
        "@codemirror_mode": "r",
        "@codemirror_mime_type": "text/x-rsrc",
        "@wrap": false,
        "@language_id": 307,
        "@extensions": [
          ".r",
          ".rd",
          ".rsx"
        ],
        "@interpreters": [
          "Rscript"
        ],
        "@filenames": [
          ".Rprofile",
          "expr-dist"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RAML",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#77d9fb",
        "@aliases": [
          "raml"
        ],
        "@tm_scope": "source.yaml",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 308,
        "@extensions": [
          ".raml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RDoc",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "rdoc"
        ],
        "@tm_scope": "text.rdoc",
        "@ace_mode": "rdoc",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 309,
        "@extensions": [
          ".rdoc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "REALbasic",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "realbasic"
        ],
        "@tm_scope": "source.vbnet",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 310,
        "@extensions": [
          ".rbbas",
          ".rbfrm",
          ".rbmnu",
          ".rbres",
          ".rbtbar",
          ".rbuistate"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "REXX",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "rexx",
          "arexx"
        ],
        "@tm_scope": "source.rexx",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 311,
        "@extensions": [
          ".rexx",
          ".pprx",
          ".rex"
        ],
        "@interpreters": [
          "regina",
          "rexx"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RMarkdown",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "rmarkdown"
        ],
        "@tm_scope": "source.gfm",
        "@ace_mode": "markdown",
        "@codemirror_mode": "gfm",
        "@codemirror_mime_type": "text/x-gfm",
        "@wrap": true,
        "@language_id": 313,
        "@extensions": [
          ".rmd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RPC",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "rpc",
          "rpcgen",
          "oncrpc",
          "xdr"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 1031374237,
        "@extensions": [
          ".x"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RPM Spec",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "rpm-spec",
          "specfile"
        ],
        "@tm_scope": "source.rpm-spec",
        "@ace_mode": "text",
        "@codemirror_mode": "rpm",
        "@codemirror_mime_type": "text/x-rpm-spec",
        "@wrap": false,
        "@language_id": 314,
        "@extensions": [
          ".spec"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RUNOFF",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#665a4e",
        "@aliases": [
          "runoff"
        ],
        "@tm_scope": "text.runoff",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 315,
        "@extensions": [
          ".rnh",
          ".rno"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Racket",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3c5caa",
        "@aliases": [
          "racket"
        ],
        "@tm_scope": "source.racket",
        "@ace_mode": "lisp",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 316,
        "@extensions": [
          ".rkt",
          ".rktd",
          ".rktl",
          ".scrbl"
        ],
        "@interpreters": [
          "racket"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ragel",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#9d5200",
        "@aliases": [
          "ragel",
          "ragel-rb",
          "ragel-ruby"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 317,
        "@extensions": [
          ".rl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Raku",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0000fb",
        "@aliases": [
          "raku",
          "perl6",
          "perl-6"
        ],
        "@tm_scope": "source.perl6fe",
        "@ace_mode": "perl",
        "@codemirror_mode": "perl",
        "@codemirror_mime_type": "text/x-perl",
        "@wrap": false,
        "@language_id": 283,
        "@extensions": [
          ".6pl",
          ".6pm",
          ".nqp",
          ".p6",
          ".p6l",
          ".p6m",
          ".pl",
          ".pl6",
          ".pm",
          ".pm6",
          ".t"
        ],
        "@interpreters": [
          "perl6",
          "raku",
          "rakudo"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Rascal",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#fffaa0",
        "@aliases": [
          "rascal"
        ],
        "@tm_scope": "source.rascal",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 173616037,
        "@extensions": [
          ".rsc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Raw token data",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "raw-token-data",
          "raw"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 318,
        "@extensions": [
          ".raw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Readline Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "readline-config",
          "inputrc",
          "readline"
        ],
        "@tm_scope": "source.inputrc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 538732839,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".inputrc",
          "inputrc"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "Reason",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff5847",
        "@aliases": [
          "reason"
        ],
        "@tm_scope": "source.reason",
        "@ace_mode": "rust",
        "@codemirror_mode": "rust",
        "@codemirror_mime_type": "text/x-rustsrc",
        "@wrap": false,
        "@language_id": 869538413,
        "@extensions": [
          ".re",
          ".rei"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Rebol",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#358a5b",
        "@aliases": [
          "rebol"
        ],
        "@tm_scope": "source.rebol",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 319,
        "@extensions": [
          ".reb",
          ".r",
          ".r2",
          ".r3",
          ".rebol"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Red",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f50000",
        "@aliases": [
          "red",
          "red/system"
        ],
        "@tm_scope": "source.red",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 320,
        "@extensions": [
          ".red",
          ".reds"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Redcode",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "redcode"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 321,
        "@extensions": [
          ".cw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Regular Expression",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "regular-expression",
          "regexp",
          "regex"
        ],
        "@tm_scope": "source.regexp",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 363378884,
        "@extensions": [
          ".regexp",
          ".regex"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ren'Py",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ff7f7f",
        "@aliases": [
          "ren'py",
          "renpy"
        ],
        "@tm_scope": "source.renpy",
        "@ace_mode": "python",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 322,
        "@extensions": [
          ".rpy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RenderScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "renderscript"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 323,
        "@extensions": [
          ".rs",
          ".rsh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Rich Text Format",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "rich-text-format"
        ],
        "@tm_scope": "text.rtf",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 51601661,
        "@extensions": [
          ".rtf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ring",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#2D54CB",
        "@aliases": [
          "ring"
        ],
        "@tm_scope": "source.ring",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 431,
        "@extensions": [
          ".ring"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Riot",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#A71E49",
        "@aliases": [
          "riot"
        ],
        "@tm_scope": "text.html.riot",
        "@ace_mode": "html",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 878396783,
        "@extensions": [
          ".riot"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "RobotFramework",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "robotframework"
        ],
        "@tm_scope": "text.robot",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 324,
        "@extensions": [
          ".robot"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Roff",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#ecdebe",
        "@aliases": [
          "roff",
          "groff",
          "man",
          "manpage",
          "man page",
          "man-page",
          "mdoc",
          "nroff",
          "troff"
        ],
        "@tm_scope": "text.roff",
        "@ace_mode": "text",
        "@codemirror_mode": "troff",
        "@codemirror_mime_type": "text/troff",
        "@wrap": true,
        "@language_id": 141,
        "@extensions": [
          ".roff",
          ".1",
          ".1in",
          ".1m",
          ".1x",
          ".2",
          ".3",
          ".3in",
          ".3m",
          ".3p",
          ".3pm",
          ".3qt",
          ".3x",
          ".4",
          ".5",
          ".6",
          ".7",
          ".8",
          ".9",
          ".l",
          ".man",
          ".mdoc",
          ".me",
          ".ms",
          ".n",
          ".nr",
          ".rno",
          ".tmac"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "eqnrc",
          "mmn",
          "mmt",
          "troffrc",
          "troffrc-end"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Roff Manpage",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "roff-manpage"
        ],
        "@tm_scope": "text.roff",
        "@ace_mode": "text",
        "@codemirror_mode": "troff",
        "@codemirror_mime_type": "text/troff",
        "@wrap": true,
        "@language_id": 612669833,
        "@extensions": [
          ".1",
          ".1in",
          ".1m",
          ".1x",
          ".2",
          ".3",
          ".3in",
          ".3m",
          ".3p",
          ".3pm",
          ".3qt",
          ".3x",
          ".4",
          ".5",
          ".6",
          ".7",
          ".8",
          ".9",
          ".man",
          ".mdoc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Roff"
      },
      {
        "@name": "Rouge",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cc0088",
        "@aliases": [
          "rouge"
        ],
        "@tm_scope": "source.clojure",
        "@ace_mode": "clojure",
        "@codemirror_mode": "clojure",
        "@codemirror_mime_type": "text/x-clojure",
        "@wrap": false,
        "@language_id": 325,
        "@extensions": [
          ".rg"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Ruby",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#701516",
        "@aliases": [
          "ruby",
          "jruby",
          "macruby",
          "rake",
          "rb",
          "rbx"
        ],
        "@tm_scope": "source.ruby",
        "@ace_mode": "ruby",
        "@codemirror_mode": "ruby",
        "@codemirror_mime_type": "text/x-ruby",
        "@wrap": false,
        "@language_id": 326,
        "@extensions": [
          ".rb",
          ".builder",
          ".eye",
          ".fcgi",
          ".gemspec",
          ".god",
          ".jbuilder",
          ".mspec",
          ".pluginspec",
          ".podspec",
          ".rabl",
          ".rake",
          ".rbi",
          ".rbuild",
          ".rbw",
          ".rbx",
          ".ru",
          ".ruby",
          ".spec",
          ".thor",
          ".watchr"
        ],
        "@interpreters": [
          "jruby",
          "macruby",
          "rake",
          "rbx",
          "ruby"
        ],
        "@filenames": [
          ".irbrc",
          ".pryrc",
          ".simplecov",
          "Appraisals",
          "Berksfile",
          "Brewfile",
          "Buildfile",
          "Capfile",
          "Dangerfile",
          "Deliverfile",
          "Fastfile",
          "Gemfile",
          "Gemfile.lock",
          "Guardfile",
          "Jarfile",
          "Mavenfile",
          "Podfile",
          "Puppetfile",
          "Rakefile",
          "Snapfile",
          "Thorfile",
          "Vagrantfile",
          "buildfile"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Rust",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dea584",
        "@aliases": [
          "rust"
        ],
        "@tm_scope": "source.rust",
        "@ace_mode": "rust",
        "@codemirror_mode": "rust",
        "@codemirror_mime_type": "text/x-rustsrc",
        "@wrap": false,
        "@language_id": 327,
        "@extensions": [
          ".rs",
          ".rs.in"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "SAS",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#B34936",
        "@aliases": [
          "sas"
        ],
        "@tm_scope": "source.sas",
        "@ace_mode": "text",
        "@codemirror_mode": "sas",
        "@codemirror_mime_type": "text/x-sas",
        "@wrap": false,
        "@language_id": 328,
        "@extensions": [
          ".sas"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SCSS",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#c6538c",
        "@aliases": [
          "scss"
        ],
        "@tm_scope": "source.css.scss",
        "@ace_mode": "scss",
        "@codemirror_mode": "css",
        "@codemirror_mime_type": "text/x-scss",
        "@wrap": false,
        "@language_id": 329,
        "@extensions": [
          ".scss"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SMT",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "smt"
        ],
        "@tm_scope": "source.smt",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 330,
        "@extensions": [
          ".smt2",
          ".smt"
        ],
        "@interpreters": [
          "boolector",
          "cvc4",
          "mathsat5",
          "opensmt",
          "smt-rat",
          "smtinterpol",
          "stp",
          "verit",
          "yices2",
          "z3"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SPARQL",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "sparql"
        ],
        "@tm_scope": "source.sparql",
        "@ace_mode": "text",
        "@codemirror_mode": "sparql",
        "@codemirror_mime_type": "application/sparql-query",
        "@wrap": false,
        "@language_id": 331,
        "@extensions": [
          ".sparql",
          ".rq"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SQF",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3F3F3F",
        "@aliases": [
          "sqf"
        ],
        "@tm_scope": "source.sqf",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 332,
        "@extensions": [
          ".sqf",
          ".hqf"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SQL",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "sql"
        ],
        "@tm_scope": "source.sql",
        "@ace_mode": "sql",
        "@codemirror_mode": "sql",
        "@codemirror_mime_type": "text/x-sql",
        "@wrap": false,
        "@language_id": 333,
        "@extensions": [
          ".sql",
          ".cql",
          ".ddl",
          ".inc",
          ".mysql",
          ".prc",
          ".tab",
          ".udf",
          ".viw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SQLPL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "sqlpl"
        ],
        "@tm_scope": "source.sql",
        "@ace_mode": "sql",
        "@codemirror_mode": "sql",
        "@codemirror_mime_type": "text/x-sql",
        "@wrap": false,
        "@language_id": 334,
        "@extensions": [
          ".sql",
          ".db2"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SRecode Template",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#348a34",
        "@aliases": [
          "srecode-template"
        ],
        "@tm_scope": "source.lisp",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 335,
        "@extensions": [
          ".srt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SSH Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ssh-config"
        ],
        "@tm_scope": "source.ssh-config",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 554920715,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "ssh-config",
          "ssh_config",
          "sshconfig",
          "sshconfig.snip",
          "sshd-config",
          "sshd_config"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "STON",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "ston"
        ],
        "@tm_scope": "source.smalltalk",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 336,
        "@extensions": [
          ".ston"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Smalltalk"
      },
      {
        "@name": "SVG",
        "@fs_name": null,
        "@type": "data",
        "@color": "#ff9900",
        "@aliases": [
          "svg"
        ],
        "@tm_scope": "text.xml.svg",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 337,
        "@extensions": [
          ".svg"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SWIG",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "swig"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 1066250075,
        "@extensions": [
          ".i"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Sage",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "sage"
        ],
        "@tm_scope": "source.python",
        "@ace_mode": "python",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-python",
        "@wrap": false,
        "@language_id": 338,
        "@extensions": [
          ".sage",
          ".sagews"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SaltStack",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#646464",
        "@aliases": [
          "saltstack",
          "saltstate",
          "salt"
        ],
        "@tm_scope": "source.yaml.salt",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 339,
        "@extensions": [
          ".sls"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Sass",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#a53b70",
        "@aliases": [
          "sass"
        ],
        "@tm_scope": "source.sass",
        "@ace_mode": "sass",
        "@codemirror_mode": "sass",
        "@codemirror_mime_type": "text/x-sass",
        "@wrap": false,
        "@language_id": 340,
        "@extensions": [
          ".sass"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Scala",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c22d40",
        "@aliases": [
          "scala"
        ],
        "@tm_scope": "source.scala",
        "@ace_mode": "scala",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-scala",
        "@wrap": false,
        "@language_id": 341,
        "@extensions": [
          ".scala",
          ".kojo",
          ".sbt",
          ".sc"
        ],
        "@interpreters": [
          "scala"
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Scaml",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "scaml"
        ],
        "@tm_scope": "source.scaml",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 342,
        "@extensions": [
          ".scaml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "HTML"
      },
      {
        "@name": "Scheme",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#1e4aec",
        "@aliases": [
          "scheme"
        ],
        "@tm_scope": "source.scheme",
        "@ace_mode": "scheme",
        "@codemirror_mode": "scheme",
        "@codemirror_mime_type": "text/x-scheme",
        "@wrap": false,
        "@language_id": 343,
        "@extensions": [
          ".scm",
          ".sch",
          ".sld",
          ".sls",
          ".sps",
          ".ss"
        ],
        "@interpreters": [
          "bigloo",
          "chicken",
          "csi",
          "gosh",
          "guile",
          "r6rs",
          "scheme"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Scilab",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "scilab"
        ],
        "@tm_scope": "source.scilab",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 344,
        "@extensions": [
          ".sci",
          ".sce",
          ".tst"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Self",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0579aa",
        "@aliases": [
          "self"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 345,
        "@extensions": [
          ".self"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ShaderLab",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "shaderlab"
        ],
        "@tm_scope": "source.shaderlab",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 664257356,
        "@extensions": [
          ".shader"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Shell",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#89e051",
        "@aliases": [
          "shell",
          "sh",
          "shell-script",
          "bash",
          "zsh"
        ],
        "@tm_scope": "source.shell",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 346,
        "@extensions": [
          ".sh",
          ".bash",
          ".bats",
          ".cgi",
          ".command",
          ".env",
          ".fcgi",
          ".ksh",
          ".sh.in",
          ".tmux",
          ".tool",
          ".zsh"
        ],
        "@interpreters": [
          "ash",
          "bash",
          "dash",
          "ksh",
          "mksh",
          "pdksh",
          "rc",
          "sh",
          "zsh"
        ],
        "@filenames": [
          ".bash_aliases",
          ".bash_history",
          ".bash_logout",
          ".bash_profile",
          ".bashrc",
          ".cshrc",
          ".env",
          ".env.example",
          ".flaskenv",
          ".login",
          ".profile",
          ".zlogin",
          ".zlogout",
          ".zprofile",
          ".zshenv",
          ".zshrc",
          "9fs",
          "PKGBUILD",
          "bash_aliases",
          "bash_logout",
          "bash_profile",
          "bashrc",
          "cshrc",
          "gradlew",
          "login",
          "man",
          "profile",
          "zlogin",
          "zlogout",
          "zprofile",
          "zshenv",
          "zshrc"
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "ShellSession",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "shellsession",
          "bash session",
          "console"
        ],
        "@tm_scope": "text.shell-session",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 347,
        "@extensions": [
          ".sh-session"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Shen",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#120F14",
        "@aliases": [
          "shen"
        ],
        "@tm_scope": "source.shen",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 348,
        "@extensions": [
          ".shen"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Sieve",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "sieve"
        ],
        "@tm_scope": "source.sieve",
        "@ace_mode": "text",
        "@codemirror_mode": "sieve",
        "@codemirror_mime_type": "application/sieve",
        "@wrap": false,
        "@language_id": 208976687,
        "@extensions": [
          ".sieve"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Slash",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#007eff",
        "@aliases": [
          "slash"
        ],
        "@tm_scope": "text.html.slash",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 349,
        "@extensions": [
          ".sl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Slice",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#003fa2",
        "@aliases": [
          "slice"
        ],
        "@tm_scope": "source.slice",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 894641667,
        "@extensions": [
          ".ice"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Slim",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#2b2b2b",
        "@aliases": [
          "slim"
        ],
        "@tm_scope": "text.slim",
        "@ace_mode": "text",
        "@codemirror_mode": "slim",
        "@codemirror_mime_type": "text/x-slim",
        "@wrap": false,
        "@language_id": 350,
        "@extensions": [
          ".slim"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SmPL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#c94949",
        "@aliases": [
          "smpl",
          "coccinelle"
        ],
        "@tm_scope": "source.smpl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 164123055,
        "@extensions": [
          ".cocci"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Smali",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "smali"
        ],
        "@tm_scope": "source.smali",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 351,
        "@extensions": [
          ".smali"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Smalltalk",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#596706",
        "@aliases": [
          "smalltalk",
          "squeak"
        ],
        "@tm_scope": "source.smalltalk",
        "@ace_mode": "text",
        "@codemirror_mode": "smalltalk",
        "@codemirror_mime_type": "text/x-stsrc",
        "@wrap": false,
        "@language_id": 352,
        "@extensions": [
          ".st",
          ".cs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Smarty",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "smarty"
        ],
        "@tm_scope": "text.html.smarty",
        "@ace_mode": "smarty",
        "@codemirror_mode": "smarty",
        "@codemirror_mime_type": "text/x-smarty",
        "@wrap": false,
        "@language_id": 353,
        "@extensions": [
          ".tpl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Solidity",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#AA6746",
        "@aliases": [
          "solidity"
        ],
        "@tm_scope": "source.solidity",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 237469032,
        "@extensions": [
          ".sol"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SourcePawn",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#f69e1d",
        "@aliases": [
          "sourcepawn",
          "sourcemod"
        ],
        "@tm_scope": "source.sourcepawn",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 354,
        "@extensions": [
          ".sp",
          ".inc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Spline Font Database",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "spline-font-database"
        ],
        "@tm_scope": "text.sfd",
        "@ace_mode": "yaml",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 767169629,
        "@extensions": [
          ".sfd"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Squirrel",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#800000",
        "@aliases": [
          "squirrel"
        ],
        "@tm_scope": "source.c++",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-c++src",
        "@wrap": false,
        "@language_id": 355,
        "@extensions": [
          ".nut"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Stan",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#b2011d",
        "@aliases": [
          "stan"
        ],
        "@tm_scope": "source.stan",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 356,
        "@extensions": [
          ".stan"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Standard ML",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dc566d",
        "@aliases": [
          "standard-ml",
          "sml"
        ],
        "@tm_scope": "source.ml",
        "@ace_mode": "text",
        "@codemirror_mode": "mllike",
        "@codemirror_mime_type": "text/x-ocaml",
        "@wrap": false,
        "@language_id": 357,
        "@extensions": [
          ".ml",
          ".fun",
          ".sig",
          ".sml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Starlark",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#76d275",
        "@aliases": [
          "starlark",
          "bazel",
          "bzl"
        ],
        "@tm_scope": "source.python",
        "@ace_mode": "python",
        "@codemirror_mode": "python",
        "@codemirror_mime_type": "text/x-python",
        "@wrap": false,
        "@language_id": 960266174,
        "@extensions": [
          ".bzl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "BUCK",
          "BUILD",
          "BUILD.bazel",
          "Tiltfile",
          "WORKSPACE"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Stata",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "stata"
        ],
        "@tm_scope": "source.stata",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 358,
        "@extensions": [
          ".do",
          ".ado",
          ".doh",
          ".ihlp",
          ".mata",
          ".matah",
          ".sthlp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Stylus",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#ff6347",
        "@aliases": [
          "stylus"
        ],
        "@tm_scope": "source.stylus",
        "@ace_mode": "stylus",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 359,
        "@extensions": [
          ".styl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SubRip Text",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "subrip-text"
        ],
        "@tm_scope": "text.srt",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 360,
        "@extensions": [
          ".srt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "SugarSS",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "sugarss"
        ],
        "@tm_scope": "source.css.postcss.sugarss",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 826404698,
        "@extensions": [
          ".sss"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "CSS"
      },
      {
        "@name": "SuperCollider",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#46390b",
        "@aliases": [
          "supercollider"
        ],
        "@tm_scope": "source.supercollider",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 361,
        "@extensions": [
          ".sc",
          ".scd"
        ],
        "@interpreters": [
          "sclang",
          "scsynth"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Svelte",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#ff3e00",
        "@aliases": [
          "svelte"
        ],
        "@tm_scope": "source.svelte",
        "@ace_mode": "html",
        "@codemirror_mode": "htmlmixed",
        "@codemirror_mime_type": "text/html",
        "@wrap": false,
        "@language_id": 928734530,
        "@extensions": [
          ".svelte"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Swift",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ffac45",
        "@aliases": [
          "swift"
        ],
        "@tm_scope": "source.swift",
        "@ace_mode": "text",
        "@codemirror_mode": "swift",
        "@codemirror_mime_type": "text/x-swift",
        "@wrap": false,
        "@language_id": 362,
        "@extensions": [
          ".swift"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "SystemVerilog",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#DAE1C2",
        "@aliases": [
          "systemverilog"
        ],
        "@tm_scope": "source.systemverilog",
        "@ace_mode": "verilog",
        "@codemirror_mode": "verilog",
        "@codemirror_mime_type": "text/x-systemverilog",
        "@wrap": false,
        "@language_id": 363,
        "@extensions": [
          ".sv",
          ".svh",
          ".vh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TI Program",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#A0AA87",
        "@aliases": [
          "ti-program"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 422,
        "@extensions": [
          ".8xp",
          ".8xk",
          ".8xk.txt",
          ".8xp.txt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TLA",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "tla"
        ],
        "@tm_scope": "source.tla",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 364,
        "@extensions": [
          ".tla"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TOML",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "toml"
        ],
        "@tm_scope": "source.toml",
        "@ace_mode": "toml",
        "@codemirror_mode": "toml",
        "@codemirror_mime_type": "text/x-toml",
        "@wrap": false,
        "@language_id": 365,
        "@extensions": [
          ".toml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "Cargo.lock",
          "Gopkg.lock",
          "poetry.lock"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TSQL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "tsql"
        ],
        "@tm_scope": "source.tsql",
        "@ace_mode": "sql",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 918334941,
        "@extensions": [
          ".sql"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TSV",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "tsv"
        ],
        "@tm_scope": "source.generic-db",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 1035892117,
        "@extensions": [
          ".tsv"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TSX",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "tsx"
        ],
        "@tm_scope": "source.tsx",
        "@ace_mode": "javascript",
        "@codemirror_mode": "jsx",
        "@codemirror_mime_type": "text/jsx",
        "@wrap": false,
        "@language_id": 94901924,
        "@extensions": [
          ".tsx"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "TypeScript"
      },
      {
        "@name": "TXL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "txl"
        ],
        "@tm_scope": "source.txl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 366,
        "@extensions": [
          ".txl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Tcl",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#e4cc98",
        "@aliases": [
          "tcl"
        ],
        "@tm_scope": "source.tcl",
        "@ace_mode": "tcl",
        "@codemirror_mode": "tcl",
        "@codemirror_mime_type": "text/x-tcl",
        "@wrap": false,
        "@language_id": 367,
        "@extensions": [
          ".tcl",
          ".adp",
          ".tm"
        ],
        "@interpreters": [
          "tclsh",
          "wish"
        ],
        "@filenames": [
          "owh",
          "starfield"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Tcsh",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "tcsh"
        ],
        "@tm_scope": "source.shell",
        "@ace_mode": "sh",
        "@codemirror_mode": "shell",
        "@codemirror_mime_type": "text/x-sh",
        "@wrap": false,
        "@language_id": 368,
        "@extensions": [
          ".tcsh",
          ".csh"
        ],
        "@interpreters": [
          "csh",
          "tcsh"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Shell"
      },
      {
        "@name": "TeX",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#3D6117",
        "@aliases": [
          "tex",
          "latex"
        ],
        "@tm_scope": "text.tex.latex",
        "@ace_mode": "tex",
        "@codemirror_mode": "stex",
        "@codemirror_mime_type": "text/x-stex",
        "@wrap": true,
        "@language_id": 369,
        "@extensions": [
          ".tex",
          ".aux",
          ".bbx",
          ".cbx",
          ".cls",
          ".dtx",
          ".ins",
          ".lbx",
          ".ltx",
          ".mkii",
          ".mkiv",
          ".mkvi",
          ".sty",
          ".toc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Tea",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "tea"
        ],
        "@tm_scope": "source.tea",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 370,
        "@extensions": [
          ".tea"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Terra",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00004c",
        "@aliases": [
          "terra"
        ],
        "@tm_scope": "source.terra",
        "@ace_mode": "lua",
        "@codemirror_mode": "lua",
        "@codemirror_mime_type": "text/x-lua",
        "@wrap": false,
        "@language_id": 371,
        "@extensions": [
          ".t"
        ],
        "@interpreters": [
          "lua"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Texinfo",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "texinfo"
        ],
        "@tm_scope": "text.texinfo",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 988020015,
        "@extensions": [
          ".texinfo",
          ".texi",
          ".txi"
        ],
        "@interpreters": [
          "makeinfo"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Text",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "text",
          "fundamental"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 372,
        "@extensions": [
          ".txt",
          ".fr",
          ".nb",
          ".ncl",
          ".no"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "COPYING",
          "COPYING.regex",
          "COPYRIGHT.regex",
          "FONTLOG",
          "INSTALL",
          "INSTALL.mysql",
          "LICENSE",
          "LICENSE.mysql",
          "NEWS",
          "README.1ST",
          "README.me",
          "README.mysql",
          "click.me",
          "delete.me",
          "go.mod",
          "go.sum",
          "keep.me",
          "package.mask",
          "package.use.mask",
          "package.use.stable.mask",
          "read.me",
          "readme.1st",
          "test.me",
          "use.mask",
          "use.stable.mask"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Textile",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "textile"
        ],
        "@tm_scope": "none",
        "@ace_mode": "textile",
        "@codemirror_mode": "textile",
        "@codemirror_mime_type": "text/x-textile",
        "@wrap": true,
        "@language_id": 373,
        "@extensions": [
          ".textile"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Thrift",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "thrift"
        ],
        "@tm_scope": "source.thrift",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 374,
        "@extensions": [
          ".thrift"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Turing",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#cf142b",
        "@aliases": [
          "turing"
        ],
        "@tm_scope": "source.turing",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 375,
        "@extensions": [
          ".t",
          ".tu"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Turtle",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "turtle"
        ],
        "@tm_scope": "source.turtle",
        "@ace_mode": "text",
        "@codemirror_mode": "turtle",
        "@codemirror_mime_type": "text/turtle",
        "@wrap": false,
        "@language_id": 376,
        "@extensions": [
          ".ttl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Twig",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#c1d026",
        "@aliases": [
          "twig"
        ],
        "@tm_scope": "text.html.twig",
        "@ace_mode": "twig",
        "@codemirror_mode": "twig",
        "@codemirror_mime_type": "text/x-twig",
        "@wrap": false,
        "@language_id": 377,
        "@extensions": [
          ".twig"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Type Language",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "type-language",
          "tl"
        ],
        "@tm_scope": "source.tl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 632765617,
        "@extensions": [
          ".tl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "TypeScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#2b7489",
        "@aliases": [
          "typescript",
          "ts"
        ],
        "@tm_scope": "source.ts",
        "@ace_mode": "typescript",
        "@codemirror_mode": "javascript",
        "@codemirror_mime_type": "application/typescript",
        "@wrap": false,
        "@language_id": 378,
        "@extensions": [
          ".ts"
        ],
        "@interpreters": [
          "deno",
          "ts-node"
        ],
        "@filenames": [
        ],
        "@popular": true,
        "@searchable": true
      },
      {
        "@name": "Unified Parallel C",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4e3617",
        "@aliases": [
          "unified-parallel-c"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 379,
        "@extensions": [
          ".upc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "C"
      },
      {
        "@name": "Unity3D Asset",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "unity3d-asset"
        ],
        "@tm_scope": "source.yaml",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 380,
        "@extensions": [
          ".anim",
          ".asset",
          ".mask",
          ".mat",
          ".meta",
          ".prefab",
          ".unity"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Unix Assembly",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "unix-assembly"
        ],
        "@tm_scope": "source.x86",
        "@ace_mode": "assembly_x86",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 120,
        "@extensions": [
          ".s",
          ".ms"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Assembly"
      },
      {
        "@name": "Uno",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#9933cc",
        "@aliases": [
          "uno"
        ],
        "@tm_scope": "source.cs",
        "@ace_mode": "csharp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csharp",
        "@wrap": false,
        "@language_id": 381,
        "@extensions": [
          ".uno"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "UnrealScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a54c4d",
        "@aliases": [
          "unrealscript"
        ],
        "@tm_scope": "source.java",
        "@ace_mode": "java",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-java",
        "@wrap": false,
        "@language_id": 382,
        "@extensions": [
          ".uc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "UrWeb",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "urweb",
          "Ur/Web",
          "Ur"
        ],
        "@tm_scope": "source.ur",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 383,
        "@extensions": [
          ".ur",
          ".urs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "V",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4f87c4",
        "@aliases": [
          "v",
          "vlang"
        ],
        "@tm_scope": "source.v",
        "@ace_mode": "golang",
        "@codemirror_mode": "go",
        "@codemirror_mime_type": "text/x-go",
        "@wrap": false,
        "@language_id": 603371597,
        "@extensions": [
          ".v"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "VBA",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#867db1",
        "@aliases": [
          "vba",
          "vb6",
          "visual basic 6",
          "visual basic for applications"
        ],
        "@tm_scope": "source.vbnet",
        "@ace_mode": "text",
        "@codemirror_mode": "vb",
        "@codemirror_mime_type": "text/x-vb",
        "@wrap": false,
        "@language_id": 399230729,
        "@extensions": [
          ".bas",
          ".cls",
          ".frm",
          ".frx",
          ".vba"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "VBScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#15dcdc",
        "@aliases": [
          "vbscript"
        ],
        "@tm_scope": "source.vbnet",
        "@ace_mode": "text",
        "@codemirror_mode": "vbscript",
        "@codemirror_mime_type": "text/vbscript",
        "@wrap": false,
        "@language_id": 408016005,
        "@extensions": [
          ".vbs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "VCL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#148AA8",
        "@aliases": [
          "vcl"
        ],
        "@tm_scope": "source.varnish.vcl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 384,
        "@extensions": [
          ".vcl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "VHDL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#adb2cb",
        "@aliases": [
          "vhdl"
        ],
        "@tm_scope": "source.vhdl",
        "@ace_mode": "vhdl",
        "@codemirror_mode": "vhdl",
        "@codemirror_mime_type": "text/x-vhdl",
        "@wrap": false,
        "@language_id": 385,
        "@extensions": [
          ".vhdl",
          ".vhd",
          ".vhf",
          ".vhi",
          ".vho",
          ".vhs",
          ".vht",
          ".vhw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Vala",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#fbe5cd",
        "@aliases": [
          "vala"
        ],
        "@tm_scope": "source.vala",
        "@ace_mode": "vala",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 386,
        "@extensions": [
          ".vala",
          ".vapi"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Verilog",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#b2b7f8",
        "@aliases": [
          "verilog"
        ],
        "@tm_scope": "source.verilog",
        "@ace_mode": "verilog",
        "@codemirror_mode": "verilog",
        "@codemirror_mime_type": "text/x-verilog",
        "@wrap": false,
        "@language_id": 387,
        "@extensions": [
          ".v",
          ".veo"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Vim Help File",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "vim-help-file",
          "vimhelp"
        ],
        "@tm_scope": "text.vim-help",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 508563686,
        "@extensions": [
          ".txt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Vim Snippet",
        "@fs_name": null,
        "@type": "markup",
        "@color": null,
        "@aliases": [
          "vim-snippet",
          "SnipMate",
          "UltiSnip",
          "UltiSnips",
          "NeoSnippet"
        ],
        "@tm_scope": "source.vim-snippet",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 81265970,
        "@extensions": [
          ".snip",
          ".snippet",
          ".snippets"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Vim script",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#199f4b",
        "@aliases": [
          "vim-script",
          "vim",
          "viml",
          "nvim"
        ],
        "@tm_scope": "source.viml",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 388,
        "@extensions": [
          ".vim",
          ".vba",
          ".vmb"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".exrc",
          ".gvimrc",
          ".nvimrc",
          ".vimrc",
          "_vimrc",
          "gvimrc",
          "nvimrc",
          "vimrc"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Visual Basic .NET",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#945db7",
        "@aliases": [
          "visual-basic-.net",
          "visual basic",
          "vbnet",
          "vb .net",
          "vb.net"
        ],
        "@tm_scope": "source.vbnet",
        "@ace_mode": "text",
        "@codemirror_mode": "vb",
        "@codemirror_mime_type": "text/x-vb",
        "@wrap": false,
        "@language_id": 389,
        "@extensions": [
          ".vb",
          ".vbhtml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Volt",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#1F1F1F",
        "@aliases": [
          "volt"
        ],
        "@tm_scope": "source.d",
        "@ace_mode": "d",
        "@codemirror_mode": "d",
        "@codemirror_mime_type": "text/x-d",
        "@wrap": false,
        "@language_id": 390,
        "@extensions": [
          ".volt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Vue",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#2c3e50",
        "@aliases": [
          "vue"
        ],
        "@tm_scope": "text.html.vue",
        "@ace_mode": "html",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 391,
        "@extensions": [
          ".vue"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Wavefront Material",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "wavefront-material"
        ],
        "@tm_scope": "source.wavefront.mtl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 392,
        "@extensions": [
          ".mtl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Wavefront Object",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "wavefront-object"
        ],
        "@tm_scope": "source.wavefront.obj",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 393,
        "@extensions": [
          ".obj"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Web Ontology Language",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "web-ontology-language"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 394,
        "@extensions": [
          ".owl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "WebAssembly",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#04133b",
        "@aliases": [
          "webassembly",
          "wast",
          "wasm"
        ],
        "@tm_scope": "source.webassembly",
        "@ace_mode": "lisp",
        "@codemirror_mode": "commonlisp",
        "@codemirror_mime_type": "text/x-common-lisp",
        "@wrap": false,
        "@language_id": 956556503,
        "@extensions": [
          ".wast",
          ".wat"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "WebIDL",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "webidl"
        ],
        "@tm_scope": "source.webidl",
        "@ace_mode": "text",
        "@codemirror_mode": "webidl",
        "@codemirror_mime_type": "text/x-webidl",
        "@wrap": false,
        "@language_id": 395,
        "@extensions": [
          ".webidl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "WebVTT",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "webvtt"
        ],
        "@tm_scope": "source.vtt",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": true,
        "@language_id": 658679714,
        "@extensions": [
          ".vtt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Wget Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "wget-config",
          "wgetrc"
        ],
        "@tm_scope": "source.wgetrc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 668457123,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".wgetrc"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "Windows Registry Entries",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "windows-registry-entries"
        ],
        "@tm_scope": "source.reg",
        "@ace_mode": "ini",
        "@codemirror_mode": "properties",
        "@codemirror_mime_type": "text/x-properties",
        "@wrap": false,
        "@language_id": 969674868,
        "@extensions": [
          ".reg"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Wollok",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#a23738",
        "@aliases": [
          "wollok"
        ],
        "@tm_scope": "source.wollok",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 632745969,
        "@extensions": [
          ".wlk"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "World of Warcraft Addon Data",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "world-of-warcraft-addon-data"
        ],
        "@tm_scope": "source.toc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 396,
        "@extensions": [
          ".toc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "X BitMap",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "x-bitmap",
          "xbm"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 782911107,
        "@extensions": [
          ".xbm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "C"
      },
      {
        "@name": "X Font Directory Index",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "x-font-directory-index"
        ],
        "@tm_scope": "source.fontdir",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 208700028,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          "encodings.dir",
          "fonts.alias",
          "fonts.dir",
          "fonts.scale"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "X PixMap",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "x-pixmap",
          "xpm"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 781846279,
        "@extensions": [
          ".xpm",
          ".pm"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "C"
      },
      {
        "@name": "X10",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4B6BEF",
        "@aliases": [
          "x10",
          "xten"
        ],
        "@tm_scope": "source.x10",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 397,
        "@extensions": [
          ".x10"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XC",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#99DA07",
        "@aliases": [
          "xc"
        ],
        "@tm_scope": "source.xc",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 398,
        "@extensions": [
          ".xc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XCompose",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "xcompose"
        ],
        "@tm_scope": "config.xcompose",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 225167241,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".XCompose",
          "XCompose",
          "xcompose"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XML",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "xml",
          "rss",
          "xsd",
          "wsdl"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 399,
        "@extensions": [
          ".xml",
          ".adml",
          ".admx",
          ".ant",
          ".axml",
          ".builds",
          ".ccproj",
          ".ccxml",
          ".clixml",
          ".cproject",
          ".cscfg",
          ".csdef",
          ".csl",
          ".csproj",
          ".ct",
          ".depproj",
          ".dita",
          ".ditamap",
          ".ditaval",
          ".dll.config",
          ".dotsettings",
          ".filters",
          ".fsproj",
          ".fxml",
          ".glade",
          ".gml",
          ".gmx",
          ".grxml",
          ".gst",
          ".iml",
          ".ivy",
          ".jelly",
          ".jsproj",
          ".kml",
          ".launch",
          ".mdpolicy",
          ".mjml",
          ".mm",
          ".mod",
          ".mxml",
          ".natvis",
          ".ncl",
          ".ndproj",
          ".nproj",
          ".nuspec",
          ".odd",
          ".osm",
          ".pkgproj",
          ".pluginspec",
          ".proj",
          ".props",
          ".ps1xml",
          ".psc1",
          ".pt",
          ".rdf",
          ".resx",
          ".rss",
          ".sch",
          ".scxml",
          ".sfproj",
          ".shproj",
          ".srdf",
          ".storyboard",
          ".sublime-snippet",
          ".targets",
          ".tml",
          ".ts",
          ".tsx",
          ".ui",
          ".urdf",
          ".ux",
          ".vbproj",
          ".vcxproj",
          ".vsixmanifest",
          ".vssettings",
          ".vstemplate",
          ".vxml",
          ".wixproj",
          ".workflow",
          ".wsdl",
          ".wsf",
          ".wxi",
          ".wxl",
          ".wxs",
          ".x3d",
          ".xacro",
          ".xaml",
          ".xib",
          ".xlf",
          ".xliff",
          ".xmi",
          ".xml.dist",
          ".xproj",
          ".xsd",
          ".xspec",
          ".xul",
          ".zcml"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".classpath",
          ".cproject",
          ".project",
          "App.config",
          "NuGet.config",
          "Settings.StyleCop",
          "Web.Debug.config",
          "Web.Release.config",
          "Web.config",
          "packages.config"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XML Property List",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "xml-property-list"
        ],
        "@tm_scope": "text.xml.plist",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 75622871,
        "@extensions": [
          ".plist",
          ".stTheme",
          ".tmCommand",
          ".tmLanguage",
          ".tmPreferences",
          ".tmSnippet",
          ".tmTheme"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "XML"
      },
      {
        "@name": "XPages",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "xpages"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 400,
        "@extensions": [
          ".xsp-config",
          ".xsp.metadata"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XProc",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "xproc"
        ],
        "@tm_scope": "text.xml",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 401,
        "@extensions": [
          ".xpl",
          ".xproc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XQuery",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#5232e7",
        "@aliases": [
          "xquery"
        ],
        "@tm_scope": "source.xq",
        "@ace_mode": "xquery",
        "@codemirror_mode": "xquery",
        "@codemirror_mime_type": "application/xquery",
        "@wrap": false,
        "@language_id": 402,
        "@extensions": [
          ".xquery",
          ".xq",
          ".xql",
          ".xqm",
          ".xqy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XS",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "xs"
        ],
        "@tm_scope": "source.c",
        "@ace_mode": "c_cpp",
        "@codemirror_mode": "clike",
        "@codemirror_mime_type": "text/x-csrc",
        "@wrap": false,
        "@language_id": 403,
        "@extensions": [
          ".xs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "XSLT",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#EB8CEB",
        "@aliases": [
          "xslt",
          "xsl"
        ],
        "@tm_scope": "text.xml.xsl",
        "@ace_mode": "xml",
        "@codemirror_mode": "xml",
        "@codemirror_mime_type": "text/xml",
        "@wrap": false,
        "@language_id": 404,
        "@extensions": [
          ".xslt",
          ".xsl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Xojo",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "xojo"
        ],
        "@tm_scope": "source.xojo",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 405,
        "@extensions": [
          ".xojo_code",
          ".xojo_menu",
          ".xojo_report",
          ".xojo_script",
          ".xojo_toolbar",
          ".xojo_window"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Xtend",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "xtend"
        ],
        "@tm_scope": "source.xtend",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 406,
        "@extensions": [
          ".xtend"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "YAML",
        "@fs_name": null,
        "@type": "data",
        "@color": "#cb171e",
        "@aliases": [
          "yaml",
          "yml"
        ],
        "@tm_scope": "source.yaml",
        "@ace_mode": "yaml",
        "@codemirror_mode": "yaml",
        "@codemirror_mime_type": "text/x-yaml",
        "@wrap": false,
        "@language_id": 407,
        "@extensions": [
          ".yml",
          ".mir",
          ".reek",
          ".rviz",
          ".sublime-syntax",
          ".syntax",
          ".yaml",
          ".yaml-tmlanguage",
          ".yaml.sed",
          ".yml.mysql"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".clang-format",
          ".clang-tidy",
          ".gemrc",
          "glide.lock",
          "yarn.lock"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "YANG",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "yang"
        ],
        "@tm_scope": "source.yang",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 408,
        "@extensions": [
          ".yang"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "YARA",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#220000",
        "@aliases": [
          "yara"
        ],
        "@tm_scope": "source.yara",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 805122868,
        "@extensions": [
          ".yar",
          ".yara"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "YASnippet",
        "@fs_name": null,
        "@type": "markup",
        "@color": "#32AB90",
        "@aliases": [
          "yasnippet",
          "snippet",
          "yas"
        ],
        "@tm_scope": "source.yasnippet",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 378760102,
        "@extensions": [
          ".yasnippet"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Yacc",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#4B6C4B",
        "@aliases": [
          "yacc"
        ],
        "@tm_scope": "source.yacc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 409,
        "@extensions": [
          ".y",
          ".yacc",
          ".yy"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ZAP",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0d665e",
        "@aliases": [
          "zap"
        ],
        "@tm_scope": "source.zap",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 952972794,
        "@extensions": [
          ".zap",
          ".xzap"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ZIL",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#dc75e5",
        "@aliases": [
          "zil"
        ],
        "@tm_scope": "source.zil",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 973483626,
        "@extensions": [
          ".zil",
          ".mud"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Zeek",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "zeek",
          "bro"
        ],
        "@tm_scope": "source.zeek",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 40,
        "@extensions": [
          ".zeek",
          ".bro"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ZenScript",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#00BCD1",
        "@aliases": [
          "zenscript"
        ],
        "@tm_scope": "source.zenscript",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 494938890,
        "@extensions": [
          ".zs"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Zephir",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#118f9e",
        "@aliases": [
          "zephir"
        ],
        "@tm_scope": "source.php.zephir",
        "@ace_mode": "php",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 410,
        "@extensions": [
          ".zep"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Zig",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#ec915c",
        "@aliases": [
          "zig"
        ],
        "@tm_scope": "source.zig",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 646424281,
        "@extensions": [
          ".zig"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "Zimpl",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "zimpl"
        ],
        "@tm_scope": "none",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 411,
        "@extensions": [
          ".zimpl",
          ".zmpl",
          ".zpl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "cURL Config",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "curl-config",
          "curlrc"
        ],
        "@tm_scope": "source.curlrc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 992375436,
        "@extensions": [
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".curlrc",
          "_curlrc"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "desktop",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "desktop"
        ],
        "@tm_scope": "source.desktop",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 412,
        "@extensions": [
          ".desktop",
          ".desktop.in"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "dircolors",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "dircolors"
        ],
        "@tm_scope": "source.dircolors",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 691605112,
        "@extensions": [
          ".dircolors"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".dir_colors",
          ".dircolors",
          "DIR_COLORS",
          "_dir_colors",
          "_dircolors",
          "dir_colors"
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "eC",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#913960",
        "@aliases": [
          "ec"
        ],
        "@tm_scope": "source.c.ec",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 413,
        "@extensions": [
          ".ec",
          ".eh"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "edn",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "edn"
        ],
        "@tm_scope": "source.clojure",
        "@ace_mode": "clojure",
        "@codemirror_mode": "clojure",
        "@codemirror_mime_type": "text/x-clojure",
        "@wrap": false,
        "@language_id": 414,
        "@extensions": [
          ".edn"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "fish",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "fish"
        ],
        "@tm_scope": "source.fish",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 415,
        "@extensions": [
          ".fish"
        ],
        "@interpreters": [
          "fish"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "Shell"
      },
      {
        "@name": "mIRC Script",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#3d57c3",
        "@aliases": [
          "mirc-script"
        ],
        "@tm_scope": "source.msl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 517654727,
        "@extensions": [
          ".mrc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "mcfunction",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#E22837",
        "@aliases": [
          "mcfunction"
        ],
        "@tm_scope": "source.mcfunction",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 462488745,
        "@extensions": [
          ".mcfunction"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "mupad",
        "@fs_name": null,
        "@type": "programming",
        "@color": null,
        "@aliases": [
          "mupad"
        ],
        "@tm_scope": "source.mupad",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 416,
        "@extensions": [
          ".mu"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "nanorc",
        "@fs_name": null,
        "@type": "data",
        "@color": null,
        "@aliases": [
          "nanorc"
        ],
        "@tm_scope": "source.nanorc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 775996197,
        "@extensions": [
          ".nanorc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
          ".nanorc",
          "nanorc"
        ],
        "@popular": false,
        "@searchable": true,
        "@group_name": "INI"
      },
      {
        "@name": "nesC",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#94B0C7",
        "@aliases": [
          "nesc"
        ],
        "@tm_scope": "source.nesc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 417,
        "@extensions": [
          ".nc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "ooc",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#b0b77e",
        "@aliases": [
          "ooc"
        ],
        "@tm_scope": "source.ooc",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 418,
        "@extensions": [
          ".ooc"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "q",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#0040cd",
        "@aliases": [
          "q"
        ],
        "@tm_scope": "source.q",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 970539067,
        "@extensions": [
          ".q"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "reStructuredText",
        "@fs_name": null,
        "@type": "prose",
        "@color": null,
        "@aliases": [
          "restructuredtext",
          "rst"
        ],
        "@tm_scope": "text.restructuredtext",
        "@ace_mode": "text",
        "@codemirror_mode": "rst",
        "@codemirror_mime_type": "text/x-rst",
        "@wrap": true,
        "@language_id": 419,
        "@extensions": [
          ".rst",
          ".rest",
          ".rest.txt",
          ".rst.txt"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "sed",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#64b970",
        "@aliases": [
          "sed"
        ],
        "@tm_scope": "source.sed",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 847830017,
        "@extensions": [
          ".sed"
        ],
        "@interpreters": [
          "gsed",
          "minised",
          "sed",
          "ssed"
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "wdl",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#42f1f4",
        "@aliases": [
          "wdl"
        ],
        "@tm_scope": "source.wdl",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 374521672,
        "@extensions": [
          ".wdl"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "wisp",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#7582D1",
        "@aliases": [
          "wisp"
        ],
        "@tm_scope": "source.clojure",
        "@ace_mode": "clojure",
        "@codemirror_mode": "clojure",
        "@codemirror_mime_type": "text/x-clojure",
        "@wrap": false,
        "@language_id": 420,
        "@extensions": [
          ".wisp"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      },
      {
        "@name": "xBase",
        "@fs_name": null,
        "@type": "programming",
        "@color": "#403a40",
        "@aliases": [
          "xbase",
          "advpl",
          "clipper",
          "foxpro"
        ],
        "@tm_scope": "source.harbour",
        "@ace_mode": "text",
        "@codemirror_mode": null,
        "@codemirror_mime_type": null,
        "@wrap": false,
        "@language_id": 421,
        "@extensions": [
          ".prg",
          ".ch",
          ".prw"
        ],
        "@interpreters": [
        ],
        "@filenames": [
        ],
        "@popular": false,
        "@searchable": true
      }
    ]
  JSON

  languages.each { |attributes| Language.create(attributes) }
end
