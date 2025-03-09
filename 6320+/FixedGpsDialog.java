/* @file FixedGpsDialog.java
 *
 * @author marco corvi
 * @date dec 2011
 *
 * @brief TopoDroid GPS-location for fixed stations
 * --------------------------------------------------------
 *  Copyright This software is distributed under GPL-3.0 or later
 *  See the file COPYING.
 * --------------------------------------------------------
 *
 * mod HB HBX_gps
 *
 */
package com.topodroidhb.TDX;

import com.topodroidhb.utils.TDMath; // HBX_gps
import com.topodroidhb.utils.TDColor; // HBX_gps
import com.topodroidhb.utils.TDLog;
import com.topodroidhb.utils.TDString;
import com.topodroidhb.utils.TDUtil;
import com.topodroidhb.ui.MyKeyboard;
import com.topodroidhb.ui.MyDialog;
import com.topodroidhb.prefs.TDSetting;

import com.topodroidhb.mag.Geodetic; // HBX_gps
import com.topodroidhb.mag.WorldMagneticModel;

import java.util.Iterator;

import java.util.Locale;

// import android.app.Dialog;
import android.annotation.SuppressLint;
// import android.annotation.TargetApi;
// import android.os.Build;

//import android.graphics.Canvas;
import android.annotation.TargetApi;
import android.graphics.Bitmap; // HBX_gps
import android.os.Build;
import android.os.Bundle;

import android.content.Context;
import android.content.Intent;

// import android.view.inputmethod.EditorInfo;
import android.view.KeyEvent;
// import android.view.ViewGroup.LayoutParams;

import android.view.ViewGroup; //HBX_gps
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.EditText;
import android.widget.Button;
// import android.widget.AdapterView;
// import android.widget.AdapterView.OnItemClickListener;
// import android.widget.TextView.OnEditorActionListener;

import android.view.View;
// import android.widget.ListView;
import android.inputmethodservice.KeyboardView;

import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.location.GpsStatus;
import android.location.GpsSatellite;
// import android.location.GpsStatus.Listener;
import android.location.GnssStatus; // TODO

import android.net.Uri;

class FixedGpsDialog extends MyDialog
                     implements View.OnClickListener
                              , View.OnLongClickListener
                              , TextView.OnEditorActionListener
                              , LocationListener
                              , GpsStatus.Listener
{
  private final FixedActivity mParent;
  // private boolean  mLocated;
  private LocationManager mLocManager = null;
  private WorldMagneticModel mWMM;

  private TextView mTVlat;
  private TextView mTVlng;
  // private TextView mTVh_ell;
  private TextView mTVh_geo;
  private TextView mTVerr;
  private EditText mETstation;
  private EditText mETcomment;

  private Button   mBtnLoc;
  private Button   mBtnAdd;
  private Button   mBtnView;

  private Button   mBtnStatus;
  // private Button   mBtnCancel;

  private double mLat = 0;  // decimal degrees
  private double mLng = 0;  // decimal degrees
  private double mHEll = 0; // ellipsoid altitude [meters]
  private double mHGeo; // altimetric (geoid) altitude
  private boolean mLocStarted = false;
  private double mErrH = -1;
  private double mErrV = -1;
  // private double mErr  = -1; // location error [m]
  // private double mErr2H = -1; // H location error [m]
  // private double mErr2V = -1; // V location error [m]
  private boolean mHasLocation;
  private int mNrSatellites = 0;
  public int mNrSatellitesAll = 0; // HBX_gps n2

  private double errMin = 1000;
  private double errMax =    0;
  private boolean errOk = false; // when error is getting stable: error decreases, then increases, then decreases again
                                 // or after one minute has passed
  private long retStart = -1L;

  private boolean useGps = TDandroid.BELOW_API_24;
  // private GpsStatus mGpsStatus = null;   // deprecated API-24 crash API-31
  // private GnssStatus mGnssStatus = null; // added API-24
  private GnssStatus.Callback mGnssStatusCallback = null; // added API-24
  private boolean mLocating; // whether is locating
  private boolean mGpsEnabled = false;

  private long mFineLocationTime = 60000L; // default 1 minute

  private MyKeyboard mKeyboard;
  // HBX_gps
  private TextView mHBadat; // HBX_gps
  private TextView mHBskala; // HBX_gps
  private ImageView mPoz1; // HBX_gps
  private int GPSx,GPSy,GPSz,GPSva, GPSha, GPSni=0, GPSerr2, hbWx; //HBX_gps
  //private long GPSx,GPSy,GPSz,GPSva, GPSha;
  private int GPSbmX= 1000, GPSbmY=GPSbmX;
  private Bitmap GPSbitmap = Bitmap.createBitmap( GPSbmX+1, GPSbmY+1, Bitmap.Config.ARGB_8888 ); // HBX_gps
  //Bitmap GPSbitmap = Bitmap.createBitmap( 401, 401, Bitmap.Config.ARGB_8888 ); // HBX_gps
  int[][] GPShistogr= new int[3][GPSbmX+1];
  private boolean GPSftp=false,GPSfp=false; // HBX_gps
  // HBX_gps

  @SuppressLint("MissingPermission")
  FixedGpsDialog(Context context, FixedActivity parent )
  {
    super( context, null, R.string.FixedGpsDialog ); // null app
    mParent = parent;
    if ( TDandroid.checkLocation( context ) ) { // CHECK_PERMISSIONS
      mLocManager = (LocationManager) mContext.getSystemService( Context.LOCATION_SERVICE );
      if ( mLocManager != null ) {
        if ( useGps /* TDandroid.BELOW_API_31 */ ) {
          // mGpsStatus = mLocManager.getGpsStatus( null );
          mGpsEnabled = true; // FIXME
        } else { // TODO
          mGpsEnabled = mLocManager.isProviderEnabled( LocationManager.GPS_PROVIDER );
          // TDLog.v("GNSS gps enabled " + mGpsEnabled );
        }
      }
    }
    mHasLocation = false;
    mFineLocationTime = 1000L * TDSetting.mFineLocation;
    // mLocating = false;
    // TDLog.v(  "GPS Unit Location " + TopoDroidApp.mUnitLocation + " ddmmss " + TDUtil.DDMMSS );
  }

// -------------------------------------------------------------------
  @TargetApi(Build.VERSION_CODES.R)
  @Override
  protected void onCreate(Bundle savedInstanceState) 
  {
    super.onCreate(savedInstanceState);
    // TDLog.Log( TDLog.LOG_LOC, "Location onCreate" );

    //hbWx = getWindow().getContext().getDisplay().getWidth();// HBX_gps nem er semmit
    /*
    android:id="@+id/pozicio1"
    android:layout_width="match_parent"
    android:layout_height="1000px"
    */
    initLayout( R.layout.fixed_gps_dialog, R.string.title_fixed_gps );
    getWindow().setLayout( ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT );//HBX_gps

    mTVlng = (TextView) findViewById(R.id.longitude );
    mTVlat = (TextView) findViewById(R.id.latitude  );
    // mTVh_ell = (TextView) findViewById(R.id.h_ellipsoid  );   // ellipsoid
    mTVh_geo = (TextView) findViewById(R.id.h_geoid );    // geoid
    mTVerr = (TextView) findViewById(R.id.error );        // location error
    mETstation = (EditText) findViewById( R.id.station );
    mETcomment = (EditText) findViewById( R.id.comment );
    mHBadat = (TextView) findViewById(R.id.adatok );          // HBX_gps  egyéb adatok
    mHBskala = (TextView) findViewById(R.id.skala );          // HBX_gps  skála felirat
    mPoz1 = (ImageView) findViewById( R.id.pozicio1 ); // HBX_gps
    //mPoz1.setMaxHeight(hbWx-300); // HBX_gps nem er semmit
    //mPoz1.setMaxWidth(hbWx-300); // HBX_gps nem er semmit
    mPoz1.setImageBitmap(GPSbitmap); // HBX_gps

    mETstation.setOnEditorActionListener( this );
    mETcomment.setOnEditorActionListener( this );

    mETstation.setOnLongClickListener( this );

    mBtnLoc = (Button) findViewById( R.id.button_loc );
    mBtnStatus = mBtnLoc;
    mBtnAdd = (Button) findViewById(R.id.button_add );
    mBtnView = (Button) findViewById( R.id.button_view );

    mBtnLoc.setOnClickListener( this );
    mBtnAdd.setOnClickListener( this );
    mBtnView.setOnClickListener( this );

    mLocating = false;
    mWMM = new WorldMagneticModel( mContext );

    mKeyboard = new MyKeyboard( mContext, (KeyboardView)findViewById( R.id.keyboardview ),
                                R.xml.my_keyboard_base, R.xml.my_keyboard_qwerty );
    if ( TDSetting.mKeyboard ) {
      if ( TDSetting.mStationNames == 1 ) {
        MyKeyboard.registerEditText( mKeyboard, mETstation, MyKeyboard.FLAG_POINT );
      } else {
        MyKeyboard.registerEditText( mKeyboard, mETstation, MyKeyboard.FLAG_POINT_LCASE_2ND );
      }
    } else {
      mKeyboard.hide();
      if ( TDSetting.mStationNames == 1 ) {
        mETstation.setInputType( TDConst.NUMBER_DECIMAL );
      }
    }
    // HBX_gps skála
    for (int xi=(GPSbmX/2-200); xi<(GPSbmX/2+1); xi++) GPSbitmap.setPixel(xi, GPSbmY-2, TDColor.FULL_RED);
    for (int yi=(GPSbmY-6); yi<(GPSbmY-1); yi++) {
      for (int xi = (GPSbmX/2-200); xi < (GPSbmX/2+1); xi += 20) GPSbitmap.setPixel(xi, yi, TDColor.FULL_RED);
    }
    for (int yi=GPSbmY-12; yi<(GPSbmY-1); yi++) {
      for (int xi = (GPSbmX/2-200); xi < (GPSbmX/2+1); xi += 40) GPSbitmap.setPixel(xi, yi, TDColor.FULL_RED);
    }
    // középkereszt
    for (int xi=(GPSbmX/2-5); xi<(GPSbmX/2+5); xi++) GPSbitmap.setPixel(xi, (GPSbmY/2), TDColor.WHITE);
    for (int yi=(GPSbmY/2-5); yi<(GPSbmY/2+5); yi++) GPSbitmap.setPixel( (GPSbmX/2),yi , TDColor.WHITE);

    for (int yi=0; yi<3; yi++) {
      for (int xi = 0; xi < (GPSbmX); xi++)  GPShistogr[yi][xi]=0;
    }
    // HBX_gps

  }


  private boolean addFixedPoint( )
  {
    String name = mETstation.getText().toString();
    if ( name.length() == 0 ) {
      mETstation.setError( mContext.getResources().getString( R.string.error_station_required ) );
      return false;
    }
    name = TDUtil.toStationFromName( name );
    if ( ! TDUtil.isStationName( name ) ) {
      mETstation.setError( mContext.getResources().getString( R.string.bad_station_name ) );
      return false;
    }
    mETstation.setText( name );

    if ( mParent.hasFixed( name ) ) {
      mETstation.setError( mContext.getResources().getString( R.string.error_station_fixed ) );
      return false;
    }
    String comment = mETcomment.getText().toString();
    // if ( comment == null ) comment = "";
    mParent.addFixedPoint( name, mLng, mLat, mHEll, mHGeo, comment, FixedInfo.SRC_TOPODROID, mErrH, mErrV );
    return true;
  }

  @Override
  public boolean onEditorAction(TextView v, int actionId, KeyEvent event)
  {
    CutNPaste.dismissPopup();
    return false;
  }
  //   // TDLog.Log( TDLog.LOG_INPUT, "Location onEditorAction " + actionId );
  //   // if ( actionId == 6 )
  //   {
  //     if ( (EditText)v == mETstation ) {
  //       if ( mLocating ) {
  //         setGPSoff();
  //       }
  //       mBtnLoc.setEnabled( false );
  //       // mHasLocation = false;
  //       mBtnAdd.setEnabled( false );
  //       mBtnView.setEnabled( false );
  //       CharSequence item = mETstation.getText();
  //       if ( item != null && item.length() > 0 ) {
  //         String str = item.toString();
  //         // check if station has already a location
  //         if ( mApp.mData.hasFixedStation( -1L, TDInstance.sid, str ) ) {
  //           String error = mContext.getResources().getString( R.string.error_station_already_fixed );
  //           mETstation.setError( error );
  //           return false;
  //         }
  //         boolean enabled =  ( str != null && str.length() > 0 );
  //         mBtnLoc.setEnabled( enabled );
  //         mBtnAdd.setEnabled( enabled );
  //         mBtnView.setEnabled( enabled );
  //       }
  //     }
  //   }
  //   return false;
  // }

  @Override
  public boolean onLongClick(View v) 
  {
    CutNPaste.makePopup( mContext, (EditText)v );
    return true;
  }

  @Override
  public void onClick(View v) 
  {
    if ( CutNPaste.dismissPopup() ) return;
    MyKeyboard.close( mKeyboard );

    boolean do_toast = false;
    Button b = (Button) v;
    if ( b == mBtnAdd ) {
      // stop GPS location and start dialog for lat/long/alt data
      if ( mLocating ) {
        setGPSoff();
      }
      if ( mHasLocation ) {
        if ( addFixedPoint() ) dismiss();
      } else {
        do_toast = true;
      }
    } else if ( b == mBtnView ) {
      if ( mHasLocation ) {
        Uri uri = Uri.parse( "geo:" + mLat + "," + mLng + "?q=" + mLat + "," + mLng );
        mContext.startActivity( new Intent( Intent.ACTION_VIEW, uri ) );
      } else {
        do_toast = true;
      }
    } else if ( b == mBtnLoc ) {
      // TDLog.v("GNSS locating " + mLocating );
      if ( mLocating ) {
        setGPSoff();
      } else {      
        setGPSon();
        errMin = 1000;
        errMax =    0;
        errOk  = false;
        retStart = -1L;
      }
    }
    if ( do_toast ) {
      TDToast.makeBad( R.string.no_location_data );
    }
  }


  /** location is stored in decimal degrees but displayed as deg:min:sec
   * N.B. the caller must check loc != null
   */
  private final double mW0 = 0.8;
  private final double mW1 = 1 - mW0;
  //private final double mW2 = mW1 / mW0; //HBX_gps
  private final double mR = Geodetic.EARTH_A; // approx earth radius //HBX_gps
  double GPScentX,GPScentY,GPScentZ; // HBX_gps

  private void displayLocation( Location loc /*, boolean do_error*/ )
  {
    GPSni++;if (GPSni>GPSbmX) GPSni=GPSbmX; // HBX_gps
    double err3 = 0;
    mErrH = -1;
    mErrV = -1;
    if ( ! mLocStarted ) {
      mLat  = loc.getLatitude();  // decimal degree
      mLng  = loc.getLongitude();
      mHEll = loc.getAltitude();  // meter
      mLocStarted = true;
      // mErr  = 1000;              // start with a large value
      // mErr2H = 1000;
      // mErr2V = 1000;
    } else {
      double lat0 = loc.getLatitude();
      double lng0 = loc.getLongitude();
      double hel0 = loc.getAltitude();
      double lat  = mW1 * lat0 + mW0 * mLat; // 0.2 - 0.8 aranyban a régi koo javara osszegzi az ujal
      double lng  = mW1 * lng0 + mW0 * mLng;
      double hell = mW1 * hel0 + mW0 * mHEll;
      if ( loc.hasAccuracy() ) {
        mErrH = loc.getAccuracy(); // meters
        err3 = mErrH;
        if ( TDandroid.BELOW_API_26 ) {
          mErrV = Math.abs( hel0 - mHEll );
        } else {
          if ( loc.hasVerticalAccuracy() ) {
            mErrV = loc.getVerticalAccuracyMeters();
            err3 = Math.sqrt( mErrV * mErrV + mErrH * mErrH );
          // } else {
          //   mErrV = 0;
          }
        }
      } else {
        err3 = -1;
        // mErrH =-1;
        // mErrV =-1;
      }
      mLat  = lat;
      mLng  = lng;
      mHEll = hell;
      //      GPSerr2 = (int) Math.sqrt(err2 * 100); // HBX_gps

      if (!GPSfp) { // HBX_gps first position
        GPScentX = mLng; //18.95046d;
        GPScentY = mLat; //47.1440133d;
        GPScentZ = mHEll; //140.0d;
        GPSfp = true;
      }
/*
      if (ret < 1) {
        if (!GPSftp) { // HBX_gps first true position
          GPScentX = mLng; //18.95046d;
          GPScentY = mLat; //47.1440133d;
          GPScentZ = mHEll; //140.0d;
          GPSftp = true;
        }
*/


      if ( err3 > 0 ) {
        // double dlat = (lat0-mLat) * mR * TDMath.DEG2RAD;
        // double dlng = (lng0-mLng) * mR * TDMath.DEG2RAD * Math.cos( mLat * TDMath.DEG2RAD );
        // double dhel = hel0 - mHEll;
        // double err2H = dlat*dlat + dlng*dlng;
        // double err2V = dhel*dhel;
        // double err2  = err2H + err2V;
        // mErr2  = mW0 * mErr2  + mW2 * err2;
        // mErr2H = mW0 * mErr2H + mW2 * err2H;
        // mErr2V = mW0 * mErr2V + mW2 * err2V;
        // err3  = 10 * Math.sqrt( mErr2 );  // FIXME multiplied by 10
        // mErrH  = 10 * Math.sqrt( mErr2H );
        // mErrV  = 10 * Math.sqrt( mErr2V );
        if ( errOk ) {
          if ( err3 > errMax ) { 
            errMax = err3;
          } else if ( err3 < errMin ) {
            errMin = err3;
          }
        } else {
          if ( retStart < 0 ) {
            retStart = System.currentTimeMillis();
            TDToast.makeLong( R.string.location_start_fine );
          } else if ( System.currentTimeMillis() - retStart > mFineLocationTime ) {
            errOk  = true;
            errMin = err3;
            errMax = err3;
          }
        }
      }
    }
    mHGeo = mWMM.ellipsoidToGeoid( mLat, mLng, mHEll ); 
    mHasLocation = true;


// HBX_gps
    if (true) {
      //mTVlng.setText(String.format(mContext.getResources().getString(R.string.fmt_longitude_dd_dms), FixedInfo.double2string(mLng)) + " " +
      //        String.format(mContext.getResources().getString(R.string.fmt_longitude_dd_dms), FixedInfo.double2string(loc.getLongitude())) + " " +
      //        String.format("Lo %1$.9f", loc.getLongitude()) + " " +
      //        Location.convert(loc.getLongitude(), Location.FORMAT_SECONDS)
      //); // HBX_gps
      //mTVlat.setText(String.format(mContext.getResources().getString(R.string.fmt_latitude_dd_dms), FixedInfo.double2string(mLat)) + " " +
      //        String.format(mContext.getResources().getString(R.string.fmt_latitude_dd_dms), FixedInfo.double2string(loc.getLatitude())) + " " +
      //        String.format("La %1$.9f", loc.getLatitude()) + " " +
      //        Location.convert(loc.getLatitude(), Location.FORMAT_SECONDS)
      //); // HBX_gps
      //mTVlng.setText( String.format( mContext.getResources().getString( R.string.fmt_longitude ), FixedInfo.double2string( mLng ) ) );
      //mTVlat.setText( String.format( mContext.getResources().getString( R.string.fmt_latitude ), FixedInfo.double2string( mLat ) ) );
      // mTValt.setText( String.format(Locale.US, mContext.getResources().getString( R.string.fmt_h_ellipsoid ), mHEll ) );
      //mTVasl.setText(String.format(Locale.US, mContext.getResources().getString(R.string.fmt_h_geoid), mHGeo) + " " +
      //       String.format(" GPS V %1$s m", loc.getAltitude()));
      //mTVerr.setText(String.format(Locale.US, mContext.getResources().getString(R.string.fmt_error_m), 0));
      //GPScentX=18.950469d; //18.95046d;
      //GPScentY=47.143983d; //47.1440133d;
      //GPScentZ=140.0d; //130.0d;
      double GPSlngsc = mR * TDMath.DEG2RAD * Math.cos(mLat * TDMath.DEG2RAD); //74600.0d;
      double GPSlatsc = mR * TDMath.DEG2RAD; //111000.0d;
      float GPSvAcc = 1;
      int GPSscale = 40; // pixel/m
      int GPSsctxt = (int) (200 / GPSscale);
      double GPSactLong = loc.getLongitude();
      double GPSactLat = loc.getLatitude();
      double GPSactAlt = loc.getAltitude();
      //final int randomx = new Random().nextInt(10) ;
      //final int randomy = new Random().nextInt(10) ;
      GPSx = (int) ((GPSactLong - GPScentX) * GPSlngsc * GPSscale + GPSbmX / 2);
      if (GPSx < 0) GPSx = 0;
      if (GPSx > GPSbmX) GPSx = GPSbmX;
      GPShistogr[0][GPSx]++;
      if (GPShistogr[0][GPSx] > GPSbmY) GPShistogr[0][GPSx] = GPSbmY;
      GPSy = (int) ((GPSactLat - GPScentY) * GPSlatsc * GPSscale + GPSbmY / 2);
      if (GPSy < 0) GPSy = 0;
      if (GPSy > GPSbmY) GPSy = GPSbmY;
      GPShistogr[1][GPSy]++;
      if (GPShistogr[1][GPSy] > GPSbmY) GPShistogr[1][GPSy] = GPSbmY;
      GPSz = (int) (((GPSactAlt - GPScentZ) * GPSscale + GPSbmX / 2));
      if (GPSz < 0) GPSz = 0;
      if (GPSz > GPSbmX) GPSz = GPSbmX;
      if (GPSz > GPSbmY) GPSz = GPSbmY;
      GPShistogr[2][GPSz]++;
      if (GPShistogr[2][GPSz] > GPSbmY) GPShistogr[2][GPSz] = GPSbmY;
      if (TDandroid.ABOVE_API_23) {

          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
              GPSvAcc = loc.getVerticalAccuracyMeters();
          }

      }
      GPSva = (int) (GPSvAcc * GPSscale) - 30;
      if (GPSva < 0) GPSva = 0;
      if (GPSva > GPSbmY) GPSva = GPSbmY;
      if (GPSerr2 < 0) GPSerr2 = 0;
      if (GPSerr2 > GPSbmY) GPSerr2 = GPSbmY;

      mHBadat.setText(String.format(" Acc: H%1$.2f m V%2$.2f m", (loc.getAccuracy()), (GPSvAcc)) + " " +
              String.format(" GPS x %1$s y %2$s z %3$s ", GPSx, GPSy, GPSz )
      ); // HBX_gps
      mHBskala.setHeight(100);
      mHBskala.setTextColor(TDColor.FULL_RED);
      mHBskala.setText(
              String.format("%1$sm", GPSsctxt)
      ); // HBX_gps
      GPSbitmap.setPixel(GPSz, GPSva, TDColor.FULL_RED);
      GPSbitmap.setPixel(GPSz, GPSy, TDColor.DARK_ORANGE);
      GPSbitmap.setPixel(GPSx, GPSbmY - GPSz, TDColor.VIOLET);
      GPSbitmap.setPixel(GPSx, GPSy, TDColor.FIXED_YELLOW);
      if (GPSbitmap.getPixel(GPSx, GPShistogr[0][GPSx]) == 0)
        GPSbitmap.setPixel(GPSx, GPShistogr[0][GPSx], TDColor.BACK_YELLOW);
      if (GPSbitmap.getPixel(GPShistogr[1][GPSy], GPSy) == 0)
        GPSbitmap.setPixel(GPShistogr[1][GPSy], GPSy, TDColor.BACK_YELLOW);
      if (GPSbitmap.getPixel(GPSbmX - GPShistogr[2][GPSz], GPSbmY - GPSz) == 0)
        GPSbitmap.setPixel(GPSbmX - GPShistogr[2][GPSz], GPSbmY - GPSz, TDColor.DARK_VIOLET);

      GPSbitmap.setPixel(GPSni, (int) GPSerr2, TDColor.FULL_GREEN);
      GPSx = (int) ((mLng - GPScentX) * GPSlngsc * GPSscale + GPSbmX / 2);
      if (GPSx < 0) GPSx = 0;
      if (GPSx > GPSbmX) GPSx = GPSbmX;
      GPSy = (int) ((mLat - GPScentY) * GPSlatsc * GPSscale + GPSbmY / 2);
      if (GPSy < 0) GPSy = 0;
      if (GPSy > GPSbmY) GPSy = GPSbmY;
      GPSbitmap.setPixel(GPSx, GPSy, TDColor.BLUE);
      mPoz1.setImageBitmap(GPSbitmap); // HBX_gps
      if (GPSni == GPSbmX) { // saját átlagolás nullázás
        GPSni = 0;
        //mErr2 = -1;
      }
    }
// HBX_gps



    // mTVlng.setText( String.format( mContext.getResources().getString( R.string.fmt_longitude ), FixedInfo.double2string( mLng ) ) );
    // mTVlat.setText( String.format( mContext.getResources().getString( R.string.fmt_latitude ), FixedInfo.double2string( mLat ) ) );
    mTVlng.setText( String.format( mContext.getResources().getString( R.string.fmt_longitude_dd_dms ),
      FixedInfo.double2degree( mLng ), FixedInfo.double2ddmmss( mLng ) ) );
    mTVlat.setText( String.format( mContext.getResources().getString( R.string.fmt_latitude_dd_dms ),
      FixedInfo.double2degree( mLat ), FixedInfo.double2ddmmss( mLat ) ) );
    // mTVh_ell.setText( String.format(Locale.US, mContext.getResources().getString( R.string.fmt_h_ellipsoid ), mHEll ) );
    mTVh_geo.setText( String.format(Locale.US, mContext.getResources().getString( R.string.fmt_h_geoid ), mHGeo )
                    + String.format(" Alt %1$.2f ", loc.getAltitude()) // HBX_gps
            //      + " xxx " + stringFromJNI()
    ); // HBX_gps
    // String aa=stringFromJNI();
    if ( errOk && err3 >= 0 /* && err3 < (errMax + errMin)/2 */ ) { 
      if ( TDandroid.BELOW_API_26 ) {
        mTVerr.setText( String.format(Locale.US, mContext.getResources().getString( R.string.fmt_error_h ), mErrH ) ); // TODO only if mErrH >= 0
      } else if ( mErrV > 0 ) {
        mTVerr.setText( String.format(Locale.US, mContext.getResources().getString( R.string.fmt_error_m ), mErrH, mErrV ) );
      } else { 
        mTVerr.setText( String.format(Locale.US, mContext.getResources().getString( R.string.fmt_error_h ), mErrH ) );
      }
    } else {
      mTVerr.setText( R.string.error_m );
    }
    // if ( do_error ) {
    //   mTVerr.setTextColor( 0xff00ff00 );
    // } else {
    //   mTVerr.setTextColor( 0xff00ffff );
    // }
  }

  // -----------------------------------------------------------

  private void setGPSoff()
  {
    mBtnLoc.setText( mContext.getResources().getString( R.string.button_gps_start ) );
    mBtnStatus.setBackgroundColor( 0xff3366ff );
    stopLocating();
  }

  private void stopLocating()
  {
    if ( mLocManager != null ) {
      // TDLog.v("GNSS stop locating ");
      mLocManager.removeUpdates( this );
      if ( useGps /* TDandroid.BELOW_API_31 */ ) {
        mLocManager.removeGpsStatusListener( this );
      } else { // TODO
        mLocManager.unregisterGnssStatusCallback( mGnssStatusCallback ); // API_24
        mGnssStatusCallback = null;
      }
    }
    mLocating = false;
  }

  @SuppressLint("MissingPermission")
  private void setGPSon()
  {
    // mBtnLoc.setText( mContext.getResources().getString( R.string.button_gps_stop ) );
    mHasLocation = false;
    mBtnStatus.setText( TDString.ZERO );
    mBtnStatus.setBackgroundColor( 0x80ff0000 );
    mLocStarted = false;
    // mErr  = -1; // restart location averaging
    if ( mLocManager != null && mGpsEnabled ) {
      // TDLog.v("GNSS start locating ");
      if ( useGps /* TDandroid.BELOW_API_31 */ ) { 
        mLocManager.addGpsStatusListener( this );
      } else { // TODO
        if ( mGnssStatusCallback == null ) {
          mGnssStatusCallback = new GnssStatus.Callback() { // API_24
            @Override public void onFirstFix( int millis ) { TDLog.v("GNSS first fix " + millis ); }

            @Override public void onSatelliteStatusChanged( GnssStatus status )
            {
              int nr = status.getSatelliteCount(); // API_24
              int nr_sat = 0;
              for ( int k = 0; k<nr; ++k ){
                if ( status.usedInFix( k ) ) nr_sat++; // API_24
              }
              // TDLog.v("GNSS satellites " + nr_sat );
              setNrSatellites( nr_sat , nr); // HBX_gps n2 csak ez mukodik!
              //GnssStatus.CONSTELLATION_GPS
              //status.
            }

            @Override public void onStarted() { TDLog.v("GNSS started" ); }

            @Override public void  onStopped() { TDLog.v("GNSS stopped" ); }

          };       
        }
        mLocManager.registerGnssStatusCallback( mGnssStatusCallback ); // API_24
      }
      mLocManager.requestLocationUpdates( LocationManager.GPS_PROVIDER, 1000, 0, this );
      mLocating = true;
    }
  }

  @Override
  public void onLocationChanged( Location loc )
  {
    // TDLog.v( "Location Changed nr satellites used in fix " + mNrSatellites );
    if ( loc != null && mNrSatellites > 3 ) displayLocation( loc /*, true */ );
    // mLocated = true;
  }

  @Override
  public void onProviderDisabled( String provider )
  {
  }

  @Override
  public void onProviderEnabled( String provider )
  {
  }

  @Override
  public void onStatusChanged( String provider, int status, Bundle extras )
  {
    // TDLog.v("onStatusChanged provider " + provider + " status " + status );
  }

  @SuppressLint("MissingPermission")
  private int getNrSatellites()
  {
    int  nr = 0;
    if ( useGps /* TDandroid.BELOW_API_31 */ ) {
      GpsStatus gps_status = mLocManager.getGpsStatus( null );
      Iterator< GpsSatellite > sats = gps_status.getSatellites().iterator();
      while( sats.hasNext() ) {
        GpsSatellite sat = sats.next();
        if ( sat.usedInFix() ) ++nr;
      }
    } else { // TODO
      // GnssStatus gnss_status = (new GnssStatus.Builder()).build();
      // nr = gnss_status.getSatelliteCount();
      // TDLog.v("GNSS satellites " + nr );
      nr = mNrSatellites;
    }
    return nr;
  }

// HBX_gps n2
  @SuppressLint("MissingPermission")
  private int getNrSatellitesAll()
  {
    int  nr = 0;
    int  nr2 = 0;
    if ( useGps /* TDandroid.BELOW_API_31 */ ) {
      GpsStatus gps_status = mLocManager.getGpsStatus( null );
      Iterator< GpsSatellite > sats = gps_status.getSatellites().iterator();
      while( sats.hasNext() ) {
        GpsSatellite sat = sats.next();
        if ( sat.usedInFix() ) ++nr2;
        ++nr2;
      }
    } else { // TODO
      // GnssStatus gnss_status = (new GnssStatus.Builder()).build();
      // nr = gnss_status.getSatelliteCount();
      // TDLog.v("GNSS satellites " + nr );
      nr = mNrSatellites;
      nr2 = mNrSatellites;
    }
    mNrSatellitesAll = 50;
    return nr2;
  }
//HBX_gps n2

  @Override
  public void onGpsStatusChanged( int event ) 
  {
    // TDLog.v("GNSS gps status change " + event );
    if ( event == GpsStatus.GPS_EVENT_SATELLITE_STATUS ) {
      // TDLog.v("GNSS gps status satellite change");
      if ( mLocManager == null ) {
        return;
      }
      setNrSatellites( getNrSatellites(), getNrSatellitesAll()+24); // HBX_gps n2 nincs hatasa!
      setNrSatellitesAll( getNrSatellitesAll() ); // HBX_gps n2
    }
  }
  private void setNrSatellitesAll(int nr ) { // HBX_gps n2
    mNrSatellitesAll = nr;
  }

  /** set the number of satellites (used in fix) and update interface accordingly
   * @param nr number of satellites
   */
  @TargetApi(Build.VERSION_CODES.N)
  private void setNrSatellites(int nr, int nr2 ) // HBX_gps n2
  {
    mNrSatellites = nr;
    mNrSatellitesAll = nr2; //HBX_gps n2
    // TDLog.Log(TDLog.LOG_LOC, "onGpsStatusChanged nr satellites used in fix " + mNrSatellites );
    // TDLog.v( "GPS Status Changed nr satellites used in fix " + mNrSatellites );
/*// HBX_gps
    int nr1;
      GnssStatus gnss_status = null;
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R)
      {
        gnss_status = new GnssStatus.Builder().build();
        nr1 = gnss_status.getSatelliteCount();
        //int nr2 = gps_status.
      }
      else
      {
        @SuppressLint("MissingPermission") GpsStatus gps_status = mLocManager.getGpsStatus( null );
        //Iterator< GpsSatellite > sats = gps_status.getSatellites().iterator();
        nr1 = gps_status.getMaxSatellites();
        mLocManager.
      }
*/// HBX_gps


    mBtnStatus.setText( String.format(Locale.US, "%1d/%2d", mNrSatellites,mNrSatellitesAll) );// HBX_gps n2

    switch ( mNrSatellites ) {
      case 0: mBtnStatus.setBackgroundColor( 0x80ff0000 );
              break;
      case 1: mBtnStatus.setBackgroundColor( 0x80993333 );
              break;
      case 2: mBtnStatus.setBackgroundColor( 0x80666633 );
              break;
      case 3: mBtnStatus.setBackgroundColor( 0x80339933 );
              break;
      default: mBtnStatus.setBackgroundColor( 0x8000ff00 );
              break;
    }

    if ( mNrSatellites > 3 ) {
      try {
        Location loc = mLocManager.getLastKnownLocation( LocationManager.GPS_PROVIDER );
        if ( loc != null ) displayLocation( loc /*, false*/ );
      } catch ( IllegalArgumentException e ) {
        TDLog.e( "onGpsStatusChanged IllegalArgumentException " );
      } catch ( SecurityException e ) {
        TDLog.e( "onGpsStatusChanged SecurityException " );
      }
    }
  }

  // -----------------------------------------------------------

  @Override
  public void onBackPressed()
  {
    if ( CutNPaste.dismissPopup() ) return;
    if ( MyKeyboard.close( mKeyboard ) ) return;
    stopLocating();
    dismiss();
  }

}

