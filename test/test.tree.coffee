path = require "path"
should = require "should"
gitteh = require "../lib/gitteh"
utils = require "./utils"
fixtures = require "./fixtures"

secondCommit = fixtures.projectRepo.secondCommit

describe "Tree", ->
	repo = null
	tree = null

	describe "Using the project repo...", ->
		it "can find second commit tree (#{secondCommit.tree})", (done) ->
			gitteh.openRepository fixtures.projectRepo.path, (err, _repo) ->
				repo = _repo

				repo.tree secondCommit.tree, (err, _tree) ->
					tree = _tree
					should.not.exist err
					tree.should.be.an.instanceof gitteh.Tree
					done()
	describe "The second project commit tree...", ->
		describe "#id", ->
			it "is correct", ->
				tree.id.should.equal secondCommit.tree
			it "is immutable", -> utils.checkImmutable tree, "id"
		describe "#entries", ->
			it "are correct", ->
				