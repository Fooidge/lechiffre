gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
rename = require 'gulp-rename'
sass = require 'gulp-sass'
uglify = require 'gulp-uglify'

libs = [
	'./bower_components/angular/angular.js'
	#'./bower_components/angular/angular.min.js.map'
	'./bower_components/lodash/dist/lodash.min.js'
]

gulp.task 'coffee', ->
	gulp.src './app/**/*.coffee'
	.pipe coffee
		bare: true
	.pipe concat 'main.js'
	.pipe gulp.dest './htdocs/scripts'
	.pipe uglify
		preserveComments: 'some'
	.pipe rename 'main.min.js'
	.pipe gulp.dest './htdocs/scripts'

gulp.task 'library', ->
	gulp.src libs
	.pipe concat 'libs.js'
	.pipe gulp.dest './htdocs/scripts'

gulp.task 'sass', ->
	gulp.src './sass/master.scss'
	.pipe sass
		outputStyle: 'compressed'
	.pipe gulp.dest './htdocs/styles'

gulp.task 'watch', ->
	gulp.watch './app/**/*.coffee', ['coffee']
	gulp.watch './sass/*.scss', ['sass']
	gulp.watch libs, ['library']

gulp.task 'default', ->
	gulp.start 'coffee'
	gulp.start 'sass'
	gulp.start 'library'