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
[good commit message](https://github.com/whatwg/meta/blob/master/COMMITTING.md). Consider
reading through the [WHATWG FAQ](https://whatwg.org/faq) if you are new here.

Please add your name to the Acknowledgments section in your first pull request, even for trivial
fixes. The names are sorted lexicographically.

## Building "locally"

For quick local iteration, run `make`. To verify your changes locally, run `make deploy`. See more
in the
[WHATWG Contributor Guidelines](https://github.com/whatwg/meta/blob/master/CONTRIBUTING.md#building).

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

Place one new line between paragraphs (including list elements). Place two or more new lines before
headings (e.g., <h3>). This doesn't apply when a nested heading follows the parent heading.

```html
<ul>
 <li><p>Do not place a new line above.

 <li><p>Place a new line above.
</ul>

<p>Place a new line above.


<h3>Place two or more new lines above.</h3>

<h4>Placing one new line is OK here.</h4>


<h4>Place two or more new lines above.</h4>
```

Use camelCase for variable names. On the other hand, it is OK to use spaced names for defined
names (properties, algorithms, etc).


```html
<p>A <a for=/>request</a> has an associated
<dfn export for=request id=concept-request-redirect-mode>redirect mode</dfn>,...

...
<p>Let <var>redirectMode</var> be <var>request</var>'s <a for=request>redirect mode</a>.
...
```

## Merge policy

If you can commit to this repository, see the
[maintainer guidelines](https://github.com/whatwg/meta/blob/master/MAINTAINERS.md).

## Tests

Tests can be found in the `fetch/` directory of
[web-platform-tests/wpt](https://github.com/web-platform-tests/wpt).
