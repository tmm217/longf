class WritersController < ApplicationController
  def index
    matching_writers = Writer.all

    @list_of_writers = matching_writers.order({ :created_at => :desc })

    render({ :template => "writers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_writers = Writer.where({ :id => the_id })

    @the_writer = matching_writers.at(0)

    render({ :template => "writers/show.html.erb" })
  end

  def create
    the_writer = Writer.new
    the_writer.name = params.fetch("query_name")
    the_writer.articles_count = params.fetch("query_articles_count")

    if the_writer.valid?
      the_writer.save
      redirect_to("/writers", { :notice => "Writer created successfully." })
    else
      redirect_to("/writers", { :notice => "Writer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_writer = Writer.where({ :id => the_id }).at(0)

    the_writer.name = params.fetch("query_name")
    the_writer.articles_count = params.fetch("query_articles_count")

    if the_writer.valid?
      the_writer.save
      redirect_to("/writers/#{the_writer.id}", { :notice => "Writer updated successfully."} )
    else
      redirect_to("/writers/#{the_writer.id}", { :alert => "Writer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_writer = Writer.where({ :id => the_id }).at(0)

    the_writer.destroy

    redirect_to("/writers", { :notice => "Writer deleted successfully."} )
  end
end
