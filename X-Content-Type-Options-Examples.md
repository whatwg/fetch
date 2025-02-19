
# X-Content-Type-Options Header Examples

## Introduction

The `X-Content-Type-Options` HTTP response header is used to protect against MIME type sniffing vulnerabilities. It instructs the browser to follow the MIME types specified in the `Content-Type` headers and not to attempt to guess the MIME type.

## Example Usage

### Example 1: Setting `X-Content-Type-Options` to `nosniff`

This is the most common usage of the `X-Content-Type-Options` header. By setting it to `nosniff`, you ensure that the browser does not override the `Content-Type` header.

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
X-Content-Type-Options: nosniff

<!DOCTYPE html>
<html>
<head>
    <title>Example</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>
```

### Example 2: Using with JavaScript Files

When serving JavaScript files, it is important to set the `X-Content-Type-Options` header to `nosniff` to prevent the browser from interpreting the file as a different MIME type.

```http
HTTP/1.1 200 OK
Content-Type: application/javascript
X-Content-Type-Options: nosniff

console.log('Hello, World!');
```

## Benefits

- **Security**: Prevents MIME type sniffing, which can lead to security vulnerabilities.
- **Consistency**: Ensures that the browser adheres to the specified `Content-Type` header.

## Conclusion

The `X-Content-Type-Options` header is a simple yet effective way to enhance the security of your web applications. By using the `nosniff` directive, you can prevent browsers from interpreting files as a different MIME type, thereby reducing the risk of certain types of attacks.
