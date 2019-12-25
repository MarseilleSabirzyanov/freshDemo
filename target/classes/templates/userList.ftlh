<#import "parts/common.ftlh" as c>

<@c.page>
    List of users
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <#list users as user>
        <tr>
            <th>${user.username}</th>
            <th><#list user.roles as role>${role}<#sep>, </#list></th>
            <th><a href="/user/${user.id}">edit</a> </th>
        </tr>
        </#list>
    </table>
</@c.page>