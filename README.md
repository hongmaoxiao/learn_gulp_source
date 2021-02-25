[![Build Status](https://travis-ci.org/wearefractal/gulp.png?branch=master)](https://travis-ci.org/wearefractal/gulp)

## Information

<table>
<tr> 
<td>Package</td><td>gulp</td>
</tr>
<tr>
<td>Description</td>
<td>Simple stream-y build helper</td>
</tr>
<tr>
<td>Node Version</td>
<td>>= 0.4</td>
</tr>
</table>

## Usage

```javascript
var gulp = require('gulp');
var jade = require('gulp-jade');
var coffee = require('gulp-coffee');
var minify = require('gulp-minify');

// compile, minify, and copy templates
gulp.task('templates', function(){
  gulp.folder("./client/templates")
    .pipe(jade)
    .pipe(minify)
    .pipe(gulp.folder("./public/templates"));
});

gulp.task('scripts', function(){
  
  // compile, minify, and copy coffeescript
  gulp.folder("./client/js", {ignore: ["vendor"]})
    .pipe(coffee)
    .pipe(minify)
    .pipe(gulp.folder("./public/js"));

  // copy vendor files
  gulp.folder("./client/js/vendor")
    .pipe(minify)
    .pipe(gulp.folder("./public/js/vendor"));

});

// copy all static assets
gulp.task('copy', function(){
  gulp.folder("./client/img")
    .pipe(gulp.folder("./public/img"));

  gulp.folder("./client/css")
    .pipe(gulp.folder("./public/css"));

  gulp.files("./client/*.html")
    .pipe(gulp.folder("./public"));

  gulp.files("./client/*.ico")
    .pipe(gulp.folder("./public"));

});

// default task gets called when you run the `gulp` command
gulp.task('default', function(){
  gulp.run('templates', 'scripts', 'copy');
});
```

### gulp.files(glob[, opt])

Takes a glob and represents an array of files with no structure. Can be piped to a folder.

### gulp.folder(path[, opt])

Takes a folder path and represents it's structure. Can be piped to and from.

### gulp.task(name, fn)

All steps code must be defined within a task. Tasks that you want to run from the command line should not have spaces in them.

Tasks can be executed by running `gulp <taskname>`

Just running `gulp` will execute the task you registered called default.


### gulp.run(tasks...)

Executes tasks in order.

```javascript
gulp.run('script', 'copyfiles', 'docss');
```

Use gulp.run to run tasks from other tasks. You will probably use this in your default task and to group small tasks into larger tasks.

## LICENSE

(MIT License)

Copyright (c) 2013 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
