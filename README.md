# Intensional LCF

"Intensional LCF" is a version of LCF which is indexed over a frame `<W,R>`. An
example such frame is the frame of fans of sequents, such that for sequents
`S1,S2`, `S1 <= S2` in case all the tactic scripts which suffice to make
evident `S1` also suffice to make evident `S2`. Doubtless there are many
others.

### Development

To develop this library, first get its submodules:

```sh
git submodule init
git submodule update
```

Then, load `development.cm` in the SML/NJ repl:

```sh
rlwrap sml
> CM.make "development.cm";
```

### Library Integration

To use this library as a dependency, you need to source `zipper.cm` in your CM
file, and bind the `libs` anchor to a location which contains
[`sml-spreads`](https://github.com/jonsterling/sml-spreads),
[`sml-zipper`](https://github.com/jonsterling/sml-zipper), and
[`sml-lcf`](https://github.com/jonsterling/sml-lcf).  For example, if `vendor`
contains these dependencies, use:

```cm
  intensional-lcf.cm (bind:(anchor:libs value:vendor))
```
