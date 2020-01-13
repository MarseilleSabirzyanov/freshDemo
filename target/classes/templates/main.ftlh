<#import "parts/common.ftlh" as c>

<@c.page>
        <div class="form-row">
                <div class="form-group col-md-6">
                        <form class="form-inline" method="get" action="/main">
                                <input class="form-control" type="text" name="filter" value="${filter!}" placeholder="Serch by tag">
                                <button class="btn btn-primary ml-2 " type="submit">Search</button>
                        </form>
                </div>
        </div>

        <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Add new message
        </a>

        <div class="collapse <#if message??>show</#if>" id="collapseExample">
                <div class="form-group">
                        <form method="post" action="/main" enctype="multipart/form-data">
                                <div class="form-group">
                                        <input class="form-control ${(textError??)?string('is-invalid', '')}"
                                               value="<#if message??>${message.text}</#if>" type="text" name="text" placeholder="Введите сообщение" />
                                        <#if textError??>
                                                <div class="invalid-feedback">
                                                        ${textError}
                                                </div>
                                        </#if>
                                </div>
                                <div class="form-group">
                                        <input class="form-control ${(tagError??)?string('is-invalid', '')}"
                                               value="<#if message??>${message.tag}</#if>" type="text" name="tag" placeholder="Тэг">
                                        <#if tagError??>
                                                <div class="invalid-feedback">
                                                        ${tagError}
                                                </div>
                                        </#if>
                                </div>
                                <div class="form-group">
                                        <div class="custom-file">
                                                <input type="file" name="file" id="customFile">
                                                <label class="custom-file-label" for="customFile">Choose file</label>
                                        </div>
                                </div>
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <div class="form-group">
                                        <button class="btn btn-primary" type="submit">Add</button>
                                </div>
                        </form>
                </div>
        </div>
        <div class="card-columns">
                <#list messages as message>
                        <div class="card my-3">
                                <#if message.filename??>
                                        <img src="/img/${message.filename}">
                                </#if>
                                <div class="m-2">
                                        <span>${message.text}</span>
                                        <i>${message.tag}</i>
                                </div>
                                <div class="card-footer text-muted">
                                        <strong>${message.authorName}</strong>
                                </div>
                        </div>
                <#else>
                        No message
                </#list>
        </div>
</@c.page>