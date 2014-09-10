<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="<%= envelope.soap_env%>"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    <% if (envelope.namespaces !== null) { %>
        <% _.each(envelope.namespaces, function(namespace) { %>
            <% if (namespace.full !== void 0) { %>
            xmlns:<%=namespace.short%>="<%=namespace.full%>"
            <% } %>
        <% }); %>
    <% } %>>

    <% if (head !== null) { %>
        <SOAP-ENV:Header>
            <% _.each(head, function(headItem) { %>
                <%= headItem%>
            <% }); %>
        </SOAP-ENV:Header>
    <% } %>

    <SOAP-ENV:Body>
        <% if (body.namespace !== null) {%>
            <<%= body.namespace%>:<%=body.method%>>
        <% } else {%>
            <<%=body.method%>>
        <% } %>

            <% if (body.params !== false) {%>
                <%= body.params%>
            <% } %>

        <% if (body.namespace !== null) {%>
            </<%= body.namespace%>:<%=body.method%>>
        <% } else { %>
            </<%=body.method%>>
        <% } %>
    </SOAP-ENV:Body>

</SOAP-ENV:Envelope>