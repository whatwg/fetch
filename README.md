This repository hosts the [Fetch Standard](https://fetch.spec.whatwg.org/).

## Code of conduct

We are committed to providing a friendly, safe, and welcoming environment for all. Please read and respect the [Code of Conduct](https://whatwg.org/code-of-conduct).

## Contribution opportunities

Folks notice minor and larger issues with the Fetch Standard all the time and we'd love your help fixing those. Pull requests for typographical and grammar errors are also most welcome.

Issues labeled ["good first issue"](https://github.com/whatwg/fetch/labels/good%20first%20issue) are a good place to get a taste for editing the Fetch Standard. Note that we don't assign issues and there's no reason to ask for availability either, just provide a pull request.

If you are thinking of suggesting a new feature, read through the [FAQ](https://whatwg.org/faq) and [Working Mode](https://whatwg.org/working-mode) documents to get yourself familiarized with the process.

We'd be happy to help you with all of this [on Chat](https://whatwg.org/chat).

## Pull requests

In short, change `fetch.bs` and submit your patch, with a [good commit message](https://github.com/whatwg/meta/blob/main/COMMITTING.md).

Please add your name to the Acknowledgments section in your first pull request, even for trivial fixes. The names are sorted lexicographically.

To ensure your patch meets all the necessary requirements, please also see the [Contributor Guidelines](https://github.com/whatwg/meta/blob/main/CONTRIBUTING.md). Editors of the Fetch Standard are expected to follow the [Maintainer Guidelines](https://github.com/whatwg/meta/blob/main/MAINTAINERS.md).

## Tests

Tests are an essential part of the standardization process and will need to be created or adjusted as changes to the standard are made. Tests for the Fetch Standard can be found in the `fetch/` directory of [`web-platform-tests/wpt`](https://github.com/web-platform-tests/wpt).

A dashboard showing the tests running against browser engines can be seen at [wpt.fyi/results/fetch](https://wpt.fyi/results/fetch).

## Building "locally"

For quick local iteration, run `make`; this will use a web service to build the standard, so that you don't have to install anything. See more in the [Contributor Guidelines](https://github.com/whatwg/meta/blob/main/CONTRIBUTING.md#building).

## Formatting

Use a column width of 100 characters.

Do not use newlines inside "inline" elements, even if that means exceeding the column width requirement.
```html
<p>The
<dfn method for=DOMTokenList lt=remove(tokens)|remove()><code>remove(<var>tokens</var>&hellip;)</code></dfn>
method, when invoked, must run these steps:
```
is okay and
  ```html
<p>The <dfn method for=DOMTokenList
lt=remove(tokens)|remove()><code>remove(<var>tokens</var>&hellip;)</code></dfn> method, when
invoked, must run these steps:
```
is not.

Using newlines between "inline" element tag names and their content is also forbidden. (This actually alters the content, by adding spaces.) That is
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
 <li><p>For each <var>token</var> in <var>tokens</var>, in given order, that is not in
 <a>tokens</a>, append <var>token</var> to <a>tokens</a>.
```
is not indented, but
```html
<ol>
 <li>
  <p>For each <var>token</var> in <var>tokens</var>, run these substeps:

  <ol>
   <li><p>If <var>token</var> is the empty string, <a>throw</a> a {{SyntaxError}} exception.
```
is.

End tags may be included (if done consistently) and attributes may be quoted (using double quotes), though the prevalent theme is to omit end tags and not quote attributes (unless they contain a space).

Place one newline between paragraphs (including list elements). Place three newlines before `<h2>`, and two newlines before other headings. This does not apply when a nested heading follows the parent heading.
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
Use camel-case for variable names and "spaced" names for definitions, algorithms, etc.
```html
<p>A <a for=/>request</a> has an associated
<dfn export for=request id=concept-request-redirect-mode>redirect mode</dfn>,...
```
```html
<p>Let <var>redirectMode</var> be <var>request</var>'s <a for=request>redirect mode</a>.
```

## Formatting

Use a column width of 100 characters.

Do not use newlines inside "inline" elements, even if that means exceeding the column width requirement.
```html
<p>The
<dfn method for=DOMTokenList lt=remove(tokens)|remove()><code>remove(<var>tokens</var>&hellip;)</code></dfn>
method, when invoked, must run these steps:
```
is okay and
  ```html
<p>The <dfn method for=DOMTokenList
lt=remove(tokens)|remove()><code>remove(<var>tokens</var>&hellip;)</code></dfn> method, when
invoked, must run these steps:
```
is not.

Using newlines between "inline" element tag names and their content is also forbidden. (This actually alters the content, by adding spaces.) That is
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
 <li><p>For each <var>token</var> in <var>tokens</var>, in given order, that is not in
 <a>tokens</a>, append <var>token</var> to <a>tokens</a>.
```
is not indented, but
```html
<ol>
 <li>
  <p>For each <var>token</var> in <var>tokens</var>, run these substeps:

  <ol>
   <li><p>If <var>token</var> is the empty string, <a>throw</a> a {{SyntaxError}} exception.
```
is.

End tags may be included (if done consistently) and attributes may be quoted (using double quotes), though the prevalent theme is to omit end tags and not quote attributes (unless they contain a space).

Place one newline between paragraphs (including list elements). Place three newlines before `<h2>`, and two newlines before other headings. This does not apply when a nested heading follows the parent heading.
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
Use camel-case for variable names and "spaced" names for definitions, algorithms, etc.
```html
<p>A <a for=/>request</a> has an associated
<dfn export for=request id=concept-request-redirect-mode>redirect mode</dfn>,...
```
```html
<p>Let <var>redirectMode</var> be <var>request</var>'s <a for=request>redirect mode</a>.
```

## Formatting

Use a column width of 100 characters.

Do not use newlines inside "inline" elements, even if that means exceeding the column width requirement.
```html
<p>The
<dfn method for=DOMTokenList lt=remove(tokens)|remove()><code>remove(<var>tokens</var>&hellip;)</code></dfn>
method, when invoked, must run these steps:
```
is okay and
  ```html
<p>The <dfn method for=DOMTokenList
lt=remove(tokens)|remove()><code>remove(<var>tokens</var>&hellip;)</code></dfn> method, when
invoked, must run these steps:
```
is not.

Using newlines between "inline" element tag names and their content is also forbidden. (This actually alters the content, by adding spaces.) That is
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
 <li><p>For each <var>token</var> in <var>tokens</var>, in given order, that is not in
 <a>tokens</a>, append <var>token</var> to <a>tokens</a>.
```
is not indented, but
```html
<ol>
 <li>
  <p>For each <var>token</var> in <var>tokens</var>, run these substeps:

  <ol>
   <li><p>If <var>token</var> is the empty string, <a>throw</a> a {{SyntaxError}} exception.
```
is.

End tags may be included (if done consistently) and attributes may be quoted (using double quotes), though the prevalent theme is to omit end tags and not quote attributes (unless they contain a space).

Place one newline between paragraphs (including list elements). Place three newlines before `<h2>`, and two newlines before other headings. This does not apply when a nested heading follows the parent heading.
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
Use camel-case for variable names and "spaced" names for definitions, algorithms, etc.
```html
<p>A <a for=/>request</a> has an associated
<dfn export for=request id=concept-request-redirect-mode>redirect mode</dfn>,...
```
```html
<p>Let <var>redirectMode</var> be <var>request</var>'s <a for=request>redirect mode</a>.
```
