enable :sessions

get '/create' do
  erb :create
end


#Mostrar el post creado
get "/post/:id" do 
 @post = Post.find(params[:id])
  erb :post
end

#actualizar post
get "/update/:id" do
  @edit = Post.find(params[:id])
  @edit_tags = @edit.tags
   erb :update
end

#mostrar post a borrar
get "/delete/:id" do
  p "estoy por borrar"
  @delete = Post.find(params[:id])
  erb :delete
end


# mostrar todos los post
get '/post_print' do
  @post = Post.all
  erb :post_print
end

#Crear un post
post "/create" do 
  @title = params[:title]
  @body = params[:body]
  tags = params[:post][:tags] # esto viene del create.erb / name="post[tags]"
 
  post = Post.new(title: @title, body: @body)
  post.save
  if post.valid? == true
    tags.split(',').each do |tag|
      #strip is use for eliminate blank spaces becasuse if i let it be, my database include ej. 'fitness' and ' fitness', but in 'view', i cant realize this issue
      new_tag = tag.strip
      verify_tag = Tag.find_by(tag: new_tag)
      if verify_tag
        post.tags << verify_tag
        #la siguiente línea de código es lo mismo que escribir la línea de arriba (p post.tags << verify_tag)
        #PostTag.create(post_id: post.id, tag_id: tag.id) 
      else
        post.tags << Tag.create(tag: new_tag)
      end 
    end
  redirect to("/post/#{post.id}")
  else
    p "no se guardo " 
    session[:no_title] = "Falta agregar un titulo y/o contenido"
    #@error_message_login = "Email y/o password incorrectos"
    redirect to '/create'
  end

end


post "/edit/:id" do
  tags = params[:tags]
  post = Post.find(params[:id])
  # el params[:post] viene de view/update.erb/ name="post[body] y name="post[title]"
  post.update(params[:post])
  if post.valid?
    p 'valido'
   
      #iterate the hash where old tag is the key and new_tag is de value
      tags.each do |old_tag, new_tag|
        #strip for eliminate blank spaces
        newold_tag = old_tag.strip
        new_tagnew = new_tag.strip
        if new_tagnew == ""
           removed_tag = Tag.find_by(tag: newold_tag)
           post.tags.delete(removed_tag)
        else
          unless newold_tag == new_tagnew
            #Disassociate tag
            removed_tag2 = Tag.find_by(tag: newold_tag)
            post.tags.delete(removed_tag2)
            #Associate tag
            tag = Tag.find_by(tag: new_tagnew)
            if tag
              p "viendo que hace tag"
              p post.tags << tag
            else
              created_tag = Tag.create(tag: new_tagnew)
              post.tags << created_tag
            end
          end
        end 
      end
      redirect to("/post/#{post.id}")
  else   
    session[:no_title] = "No puedes dejar vacío el título y/o el contenido, sin embargo recuerda que sí puedes editarlo"
    #@error_message_login = "Email y/o password incorrectos"
    redirect to "/update/#{post.id}"

  end
end

#borrar post
delete '/delete/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect to ('/')
end


   