get '/tags' do

   @tag = Tag.all
   erb :tags_print
end

get '/tags/:tag' do
  #params[:tag] => ejemplo: 3
  #Aquí busco todos los post relacionados al tag que tengo en turno
  @tag = Tag.find(params[:tag]).posts
  erb :tag_post
  
end