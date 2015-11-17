/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADServlets;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;

/**
 * Jersey REST client generated for REST resource:we
 * [VueloREST/consulta_libres]<br>
 * USAGE:
 * <pre>
 *        RESTConsultaLibresVuelo client = new RESTConsultaLibresVuelo();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Santi
 */
public class RESTConsultaLibresVuelo {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/VueloREST/webresources/";

    public RESTConsultaLibresVuelo() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("VueloREST/consulta_libres");
    }

    /**
     * @param responseType Class representing the response
     * @param id_vuelo query parameter
     * @param fecha query parameter
     * @return response object (instance of responseType class)
     */
    public <T> T consulta_libres(Class<T> responseType, String id_vuelo, String fecha) throws ClientErrorException {
        String[] queryParamNames = new String[]{"id_vuelo", "fecha"};
        String[] queryParamValues = new String[]{id_vuelo, fecha};
        ;
        javax.ws.rs.core.Form form = getQueryOrFormParams(queryParamNames, queryParamValues);
        javax.ws.rs.core.MultivaluedMap<String, String> map = form.asMap();
        for (java.util.Map.Entry<String, java.util.List<String>> entry : map.entrySet()) {
            java.util.List<String> list = entry.getValue();
            String[] values = list.toArray(new String[list.size()]);
            webTarget = webTarget.queryParam(entry.getKey(), (Object[]) values);
        }
        return webTarget.request().get(responseType);
    }

    private Form getQueryOrFormParams(String[] paramNames, String[] paramValues) {
        Form form = new javax.ws.rs.core.Form();
        for (int i = 0; i < paramNames.length; i++) {
            if (paramValues[i] != null) {
                form = form.param(paramNames[i], paramValues[i]);
            }
        }
        return form;
    }

    public void close() {
        client.close();
    }
    
}
