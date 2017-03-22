post1 = Post.create(title: 'Titulo 1', body: '¿Vives todos los días en inflamación? ¡Cámbialo ahora! Con este programa comienza a sanar tus intestinos.')
post2 = Post.create(title: 'Titulo 2', body: 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,')
post3 = Post.create(title: 'Titulo 2', body: 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,')

tag1 = Tag.create(tag: "complementos")
tag2 = Tag.create(tag: "fitness")
tag3 = Tag.create(tag: "recetas")

postag1 = PostTag.create(post_id: post1.id, tag_id: tag1.id)
postag2 = PostTag.create(post_id: post2.id, tag_id: tag3.id)
postag3 = PostTag.create(post_id: post3.id, tag_id: tag2.id)

