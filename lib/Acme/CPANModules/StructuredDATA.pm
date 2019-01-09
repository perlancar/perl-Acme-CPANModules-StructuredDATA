package Acme::CPANModules::StructuredDATA;

# DATE
# VERSION

our $LIST = {
    summary => 'Modules that give some structure to DATA',
    description => <<'_',

The DATA file handle is a convenient feature provided by Perl to let scripts
access its own source code (specifically the part after __END__ or __DATA__).
Scripts can usually put some data so they can run without additional data files.

Instead of just a stream of bytes, some modules allow you to access the DATA as
some kind of structured storage.

_
    entries => [
        {
            module=>'Data::Section',
            description => <<'_',

With this module, you can put several strings in your DATA section, each
prepended with a header line containing the label for each. For example:

    __[ content1 ]__
    content for content1.

    __[ content2 ]__
    content
    for
    content2

and access each string by referring to its label.

_
        },
        {
            module=>'Data::Section::Seekable',
            description => <<'_',

This module is similar to <pm:Data::Section> in letting you put several
multipart content in DATA with the exception that it writes a table of content
(TOC) of all parts at the beginning of DATA, e.g.:

    __DATA__
    Data::Section::Seekable v1
    part1,0,14
    part2,14,17,important

    This is part1
    This is part
    two

The first paragraph after __DATA__ is called the TOC which lists all the parts
along with their offsets and lengths. It is therefore possible to locate any
part just from reading the TOC instead of scanning for headers on the whole
data. It is useful when the amount of data is quite large and you need quick
access to random parts.

_
        },
        {
            module=>'Inline::Files',
            description => <<'_',

This is a prior art for <pm:Data::Section> but more magical (using source
filters) and allows writing in addition to reading your parts. It completely
replaces __DATA__ with an unlimited number of __LABEL__'s. I'd be wary in using
it, and the module itself gives such warning.

_
        },
    ],
};

1;
# ABSTRACT:
