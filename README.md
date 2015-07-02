# Intensional LCF

To build, clone this in a location that also contains
[sml-lcf](https://github.com/jonsterling/sml-lcf),
[sml-zipper](https://github.com/jonsterling/sml-zipper), and
[sml-spreads](https://github.com/jonsterling/sml-spreads).

"Intensional LCF" is a version of LCF which is indexed over a frame `<W,R>`. An
example such frame is the frame of fans of sequents, such that for sequents
`S1,S2`, `S1 <= S2` in case all the tactic scripts which suffice to make
evident `S1` also suffice to make evident `S2`. Doubtless there are many
others.
