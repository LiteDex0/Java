<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск книг</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group">
                <label for="title">Поиск по названию книги:</label>
            </div>
            <div class="form-group col-md-2">
                 <input type="text" name="title"><br>
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <div class="card-columns">
        <#list book as book>
            <a href="/book/${book.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${book.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${book.title}</h5>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
<#if user.email??>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новую книгу
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/book/create" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label for="bookName">Название книги</label>
                <input type="text" required class="form-control"
                       id="bookName" name="title">
            </div>

            <div class="form-group">
                <label for="tagBook">Жанр</label>
                <input type="text" required class="form-control"
                       id="tagBook" name="tag">
            </div>


            <div class="form-group">
                <label for="description">Описание книги</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <label for="author">Автор</label>
                <input type="text" required class="form-control"
                       id="authorBook" name="author">
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>















</#if>
</@t.template>