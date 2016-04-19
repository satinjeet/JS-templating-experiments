var gulp = require('gulp');
var gulpWatch = require('gulp-watch');
var SnocketClass = require('snockets');
var snockets = new SnocketClass();
var fs = require('fs');

function compile() {
    snockets.scan('src/main.coffee', function(err, map){
        if (err) {
            console.log(err);
        } else {
            _map = map.map['src/main.coffee'];
            for (var i = 0; i < )
        }
    });
}

gulp.task('default', function() {
    gulp.src('src/**/*.coffee')
        .pipe(
            gulpWatch('src/**/*.coffee', compile)
        )
});

