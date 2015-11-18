/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WSClass;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;

/**
 * Jersey REST client generated for REST resource:we
 * [HotelREST/reserva_habitacion]<br>
 * USAGE:
 * <pre>
 *        RESTReservaHotel client = new RESTReservaHotel();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Santi
 */
public class RESTReservaHotel {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/HotelREST/webresources/";

    public RESTReservaHotel() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("HotelREST/reserva_habitacion");
    }

    /**
     * @param responseType Class representing the response
     * @param id_hotel form parameter
     * @param fecha form parameter
     * @return response object (instance of responseType class)
     */
    public <T> T reserva_habitacion(Class<T> responseType, String id_hotel, String fecha) throws ClientErrorException {
        String[] formParamNames = new String[]{"id_hotel", "fecha"};
        String[] formParamValues = new String[]{id_hotel, fecha};
        return webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_FORM_URLENCODED).post(javax.ws.rs.client.Entity.form(getQueryOrFormParams(formParamNames, formParamValues)), responseType);
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
