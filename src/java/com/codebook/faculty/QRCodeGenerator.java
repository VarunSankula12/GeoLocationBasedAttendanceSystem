package com.codebook.admin;

import java.io.File;  
import java.io.IOException;  
import java.util.HashMap;  
import java.util.Map;  
import com.google.zxing.BarcodeFormat;  
import com.google.zxing.EncodeHintType;  
import com.google.zxing.MultiFormatWriter;  
import com.google.zxing.NotFoundException;  
import com.google.zxing.WriterException;  
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;  
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;  
import java.io.ByteArrayOutputStream;
import java.util.Base64;
public class QRCodeGenerator 
{  
        public static byte[] generateQRcode(String data, int h, int w) throws WriterException, IOException {
    BitMatrix matrix = new MultiFormatWriter().encode(data, BarcodeFormat.QR_CODE, w, h);

    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    MatrixToImageWriter.writeToStream(matrix, "PNG", outputStream);

    return outputStream.toByteArray();
}
    }

 
