gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
rename = require 'gulp-rename'
sass = require 'gulp-sass'
uglify = require 'gulp-uglify'

gulp.task 'coffee', ->
	gulp.src './app/**/*.coffee'
	.pipe coffee
		bare: true
	.pipe concat 'main.js'
	.pipe gulp.dest './scripts'
	.pipe uglify
		preserveComments: 'some'
	.pipe rename 'main.min.js'
	.pipe gulp.dest './scripts'

gulp.task 'sass', ->
	gulp.src './sass/master.scss'
	.pipe sass
		outputStyle: 'compressed'
	.pipe gulp.dest './styles'

gulp.task 'watch', ->
	gulp.watch './app/**/*.coffee', ['coffee']
	gulp.watch './sass/*.scss', ['sass']

gulp.task 'default', ->
	gulp.start 'coffee'
	gulp.start 'sass'