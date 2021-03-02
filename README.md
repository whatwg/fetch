This repository hosts the [Fetch Standard](https://fetch.spec.whatwg.org/).

## Code of conduct

We are committed to providing a friendly, safe, and welcoming environment for all. Please read and
respect the [WHATWG Code of Conduct](https://whatwg.org/code-of-conduct).

## Contribution opportunities

Folks notice minor and larger issues with the Fetch Standard all the time and we'd love your help
fixing those. Pull requests for typographical and grammar errors are also most welcome.

We'd be happy to mentor you through this process. If you're interested and need help getting
started, leave a comment on the issue or ask around [on IRC](https://whatwg.org/irc).

## Pull requests

In short, change `fetch.bs` and submit your patch, with a
[good commit message](https://github.com/whatwg/meta/blob/main/COMMITTING.md). Consider
reading through the [WHATWG FAQ](https://whatwg.org/faq) if you are new here.

Please add your name to the Acknowledgments section in your first pull request, even for trivial
fixes. The names are sorted lexicographically.

## Building "locally"

For quick local iteration, run `make`. To verify your changes locally, run `make deploy`. See more
in the
[WHATWG Contributor Guidelines](https://github.com/whatwg/meta/blob/main/CONTRIBUTING.md#building).

## Formatting

Use a column width of 100 characters.

Do not use newlines inside "inline" elements, even if that means exceeding the column width
requirement.
```html
 <li><p>Execute
 <a href=https://w3c.github.io/webappsec-csp/#set-response-csp-list>set <var>response</var>'s CSP list</a>
 on <var>response</var>. <span data-anolis-ref>CSP</span>
```
is okay and
  ```html
 <li><p>Execute
 <a href=https://w3c.github.io/webappsec-csp/#set-response-csp-list>set <var>response</var>'s CSP
 list</a> on <var>response</var>. <span data-anolis-ref>CSP</span>
```
is not.

Using newlines between "inline" element tag names and their content is also forbidden. (This
actually alters the content, by adding spaces.) That is
```html
<a>token</a>
```
is fine and
```html
<a>token
</a>
```
is not.

An `<li>` element always has a `<p>` element inside it, unless it's a child of `<ul class=brief>`.

If a "block" element contains a single "block" element, do not put it on a newline.

Do not indent for anything except a new "block" element. For instance
```html
 <li><p>Set <var>response</var>'s <span title=concept-response-url-list>url list</span> to a copy of
 <var>request</var>'s <span title=concept-request-url-list>url list</span>.
```
is not indented, but
```html
 <li>
  <p>Run these substeps <span data-anolis-spec=html>in parallel</span>:

  <ol>
```
is.

End tags must be omitted when possible and attribute values must not be quoted (if necessary, use
double quotes).

Place one newline between paragraphs (including list elements). Place three newlines before `<h2>`,
and two newlines before other headings. This does not apply when a nested heading follows the parent
heading.

```html
<ul>
 <li><p>Do not place a newline above.

 <li><p>Place a newline above.
</ul>

<p>Place a newline above.


<h3>Place two newlines above.</h3>

<h4>Placing one newline is OK here.</h4>


<h4>Place two newlines above.</h4>
```

Use camel case for variable names and sentence case use spaced names for definitions, algorithms,
etc.

```html
<p>A <a for=/>request</a> has an associated
<dfn export for=request id=concept-request-redirect-mode>redirect mode</dfn>,...
```
```html
<p>Let <var>redirectMode</var> be <var>request</var>'s <a for=request>redirect mode</a>.
```

## Merge policy

If you can commit to this repository, see the
[maintainer guidelines](https://github.com/whatwg/meta/blob/main/MAINTAINERS.md).

## Tests

Tests can be found in the `fetch/` directory of
[web-platform-tests/wpt](https://github.com/web-platform-tests/wpt).
