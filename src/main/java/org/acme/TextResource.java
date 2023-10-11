package org.acme;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/api/text")
public class TextResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getText() {
        return "Initial Text";
    }
}
