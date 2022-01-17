class PublicationsController < ApplicationController
  def index
    matching_publications = Publication.all

    @list_of_publications = matching_publications.order({ :created_at => :desc })

    render({ :template => "publications/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_publications = Publication.where({ :id => the_id })

    @the_publication = matching_publications.at(0)

    render({ :template => "publications/show.html.erb" })
  end

  def create
    the_publication = Publication.new
    the_publication.pub_name = params.fetch("query_pub_name")
    the_publication.pub_address = params.fetch("query_pub_address")
    the_publication.articles_count = params.fetch("query_articles_count")

    if the_publication.valid?
      the_publication.save
      redirect_to("/publications", { :notice => "Publication created successfully." })
    else
      redirect_to("/publications", { :notice => "Publication failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_publication = Publication.where({ :id => the_id }).at(0)

    the_publication.pub_name = params.fetch("query_pub_name")
    the_publication.pub_address = params.fetch("query_pub_address")
    the_publication.articles_count = params.fetch("query_articles_count")

    if the_publication.valid?
      the_publication.save
      redirect_to("/publications/#{the_publication.id}", { :notice => "Publication updated successfully."} )
    else
      redirect_to("/publications/#{the_publication.id}", { :alert => "Publication failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_publication = Publication.where({ :id => the_id }).at(0)

    the_publication.destroy

    redirect_to("/publications", { :notice => "Publication deleted successfully."} )
  end
end
