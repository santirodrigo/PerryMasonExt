/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WSClass;

/**
 *
 * @author Santi
 */
public class SOAPHotel {

    public static int consultaLibres(int idHotel, int fecha) {
        hotel.HotelWS_Service service = new hotel.HotelWS_Service();
        hotel.HotelWS port = service.getHotelWSPort();
        return port.consultaLibres(idHotel, fecha);
    }

    public static int reservaHabitacion(int idHotel, int fecha) {
        hotel.HotelWS_Service service = new hotel.HotelWS_Service();
        hotel.HotelWS port = service.getHotelWSPort();
        return port.reservaHabitacion(idHotel, fecha);
    }
       
}
