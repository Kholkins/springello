<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2" >Search</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">
        Add new message
    </a>
    <div class="collapse multi-collapse" id="multiCollapseExample1" >
        <div class="form-group mt-3">
            <form class="form-group" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control" type="text" name="text" placeholder="Введите сообщение" />
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="tag" placeholder="Тэг">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>

                <input class="form-control" type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button class="btn btn-primary" type="submit">Добавить</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer bg-transparent border-success">
                ${message.authorName}
            </div>
        </div>
    <#else>
        No message
    </#list>
    </div>
</@c.page>