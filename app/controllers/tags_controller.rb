# frozen_string_literal: true

# Controller to list popular tags
class TagsController < ApplicationController
  # GET /tags
  def index
    @tags = Tag.find_by_popularity
    render json: @tags
  end
end
