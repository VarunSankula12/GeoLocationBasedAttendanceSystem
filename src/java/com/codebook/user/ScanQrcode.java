
package com.codebook.admin;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class ScanQrcode {
        public static String scanQR(File qrCodeImage) throws IOException {
            BufferedImage bufferedImage = ImageIO.read(qrCodeImage);
            BinaryBitmap binaryBitmap = new BinaryBitmap(
            new HybridBinarizer(new BufferedImageLuminanceSource(bufferedImage))
        );

        try {
            Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap);
            return qrCodeResult.getText();
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Handle the case where QR code couldn't be scanned.
        }
        }
}
