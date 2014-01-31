class FixtureController < ApplicationController
	def index
		@fixtures = Fixture.all
	end
end
