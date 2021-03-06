/*****************************************************************
SPINE - Signal Processing In-Node Environment is a framework that
allows dynamic configuration of feature extraction capabilities 
of WSN nodes via an OtA protocol

Copyright (C) 2007 Telecom Italia S.p.A. 
 
GNU Lesser General Public License
 
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation, 
version 2.1 of the License. 
 
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.
 
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the
Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA  02111-1307, USA.
*****************************************************************/

 /**
 *  Module component for the Data SPINE packet.
 *
 *
 * @author Raffaele Gravina
 *
 * @version 1.2
 */ 
 module SpineDataPktC {
       provides interface OutPacket;
 }

 implementation {

    uint8_t dataBuf[SPINE_DATA_PKT_MAX_SIZE];


    command void* OutPacket.build(void* payload, uint8_t len, uint8_t* builtLen) {

        uint8_t functionCode;
        uint8_t dataSize;

        memcpy(&functionCode, payload, 1);
        dataBuf[0] = functionCode;

        memcpy(&dataSize, (payload+1), 1);
        dataBuf[1] = dataSize;
        
        memcpy((dataBuf+2), (payload+2), dataSize);

        *builtLen = (2+dataSize);
        return dataBuf;
    }

 }
