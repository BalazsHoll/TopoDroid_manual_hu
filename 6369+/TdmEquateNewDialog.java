/** @file TdmEquateNewDialog.java
 *
 * @author marco corvi
 * @date may 2017
 *
 * @brief TopoDroid Manager new equate dialog
 * --------------------------------------------------------
 *  Copyright This software is distributed under GPL-3.0 or later
 *  See the file COPYING.
 * --------------------------------------------------------
 */
package com.topodroidHB2.tdm;

import com.topodroidHB2.utils.TDLog;
import com.topodroidHB2.ui.MyDialog;
import com.topodroidHB2.TDX.R;
import com.topodroidHB2.TDX.TDToast;

// import java.util.List;
import java.util.ArrayList;

// import android.app.Activity;
// import android.app.Dialog;
import android.os.Bundle;
import android.content.Context;
// import android.content.Intent;

import android.view.View;
import android.view.View.OnClickListener;
// import android.view.ViewGroup.LayoutParams;
// import android.view.View.OnKeyListener;
// import android.view.KeyEvent;
// import android.view.Window;

import android.widget.LinearLayout;
import android.widget.Button;
import android.widget.TextView;
import android.widget.EditText;
// import android.widget.Spinner;
// import android.widget.ArrayAdapter;


class TdmEquateNewDialog extends MyDialog
                         implements OnClickListener
{
  TdmViewActivity mParent;
  ArrayList< TdmViewCommand > mCommands;
  // String[] mStation;
  // Spinner[] mSpinner;
  EditText[] mEdit;
  int size;

  private Button mBTok;
  private Button mBTback;
  private Button mBTall; // HB EQ all
  private Button mBTsearch; // HB EQ all
  private Button mBTone; // HB EQ all
  int j0=0; // HB EQ all
  int l0=0; // HB EQ all

  TdmEquateNewDialog( Context context, TdmViewActivity parent, ArrayList< TdmViewCommand > commands )
  {
    super( context, null, R.string.TdmEquateNewDialog ); // null app
    mParent   = parent;
    mCommands = commands;
    size = mCommands.size();
    // mStation = new String[size];
    mEdit = new EditText[size];
    // mSpinner = new Spinner[size];
    for ( int k=0; k<size; ++k ) {
      // mStation[k] = null;
      mEdit[k] = null;
      // mSpinner[k] = null;
    }
  }

  public void onCreate( Bundle bundle )
  {
    super.onCreate( bundle );

    initLayout( R.layout.tdequate_new_dialog, R.string.title_equate_new );

    mBTok = (Button) findViewById( R.id.button_ok );
    mBTok.setOnClickListener( this );
    mBTback = (Button) findViewById( R.id.button_back );
    mBTback.setOnClickListener( this );
    mBTall = (Button) findViewById( R.id.button_all ); // HB EQ all
    mBTall.setOnClickListener( this ); // HB EQ all
    mBTsearch = (Button) findViewById( R.id.button_search ); // HB EQ all
    mBTsearch.setOnClickListener( this ); // HB EQ all
    mBTone = (Button) findViewById( R.id.button_one ); // HB EQ all
    mBTone.setOnClickListener( this ); // HB EQ all

    LinearLayout layout4 = (LinearLayout) findViewById( R.id.layout4 );
    LinearLayout.LayoutParams lp1 = new LinearLayout.LayoutParams( 
      LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT );
    lp1.setMargins( 0, 10, 20, 10 );
    LinearLayout.LayoutParams lp2 = new LinearLayout.LayoutParams( 
      LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT );
    lp2.setMargins( 0, 10, 20, 10 );

    for ( int k=0; k<size; ++k ) {
      TdmViewCommand vc = mCommands.get( k );
      // List< TdmViewStation > vs = vc.mStations;
      
      LinearLayout layout = new LinearLayout( mContext );
      TextView text = new TextView( mContext );
      text.setText( vc.name() );
      mEdit[k] = new EditText( mContext );
      mEdit[k].setHint( "..." );
      
      // mSpinner[k] = new Spinner( mContext );
      // ArrayAdapter adapter = new ArrayAdapter<String>( mContext, R.layout.menu, mTypes );
      // spinner[k].setAdapter( adapter );
      layout.addView( text, lp1 );
      layout.addView( mEdit[k], lp2 );
      // layout.addView( spinner[k], lp );
      layout4.addView( layout, lp2 );
    }
    layout4.invalidate();
  }

  @Override
  public void onClick(View v) 
  {
    Button b = (Button) v;
    if ( b == mBTok ) {
      String bad_station = null;
      ArrayList< String > sts = new ArrayList<>();
      for ( int k=0; k<size; ++k ) {
        TdmViewCommand vc = mCommands.get( k );
        String survey = vc.name();
        int len = survey.length();
        //while ( len > 0 && survey.charAt( len - 1 ) == '.' ) -- len;
        String station = mEdit[k].getText().toString();
        if ( !station.equals("-") ) {// HB EQ all
          if ( station != null && station.length() > 0 ) {
            if ( vc.getViewStation( station ) != null ) {
              sts.add( station + "@" + survey.substring(0,len) );
              TDLog.v("added station: " + sts.size() );
            } else {
              bad_station = station + "@" + survey.substring(0,len);
              TDLog.v("Bad station: " + bad_station );
              break;
            }
          } else {
            mEdit[k].setError( mContext.getResources().getString( R.string.error_name_required ) );
            return;
          }
        }
      }
      if ( bad_station == null ) {
        mParent.makeEquate( sts ); // does nothing if sts.size() <= 1
      } else {
        TDToast.makeWarn( String.format( mContext.getResources().getString( R.string.bad_station ), bad_station ) );
        return;
      }
        //-------------------------------------------------------------------------------HB EQ all
    } else if ( b == mBTall ) { // HB EQ all
          ArrayList<String> stations = new ArrayList<>();
          if (size > 1) {
              for (int j = 0; j < ( size - 1 ) ; ++j) {
                  // int good_station = 0; FIXME moved inside and replaced with a boolean
                  TdmViewCommand vc0 = mCommands.get(j);
                  String survey0 = vc0.name();
                  for (TdmViewStation st : vc0.mStations) {
                      if (st.mEquated) continue; //break; // FIXME break or continue ? it depends on the semantics of "all"
                      String station = st.name();
                      // boolean old = false;
                      // for ( String st0 : stations ) {
                      //     if ( st0.equals( station ) ) old = true;
                      // }
                      // if (!old)  
                      // FIXME the above can be condensed as below
                      if ( ! stations.contains( station ) ) {
                          boolean good_station = false;
                          ArrayList<String> sts = new ArrayList<>();
                          int len0 = survey0.length();
                          //while (len0 > 0 && survey0.charAt(len0 - 1) == '.') --len0;
                          sts.add(station + "@" + survey0.substring(0, len0));
                          for (int k = ( j + 1 ); k < size; ++k) {
                              TdmViewCommand vc = mCommands.get(k);
                              String survey = vc.name();
                              int len = survey.length();
                              //while (len > 0 && survey.charAt(len - 1) == '.') --len; // ?
                              //String station = station0;
                              if (station != null && station.length() > 0) { // FIXME this is guaranteed - or the test should be done when station is assigned
                                                                             // use TDSting.isNullOrEmpty( station )
                                  if (vc.getViewStation(station) != null) {
                                    sts.add(station + "@" + survey.substring(0, len)); //
                                    good_station = true; // good_station++;
                                  } else {
                                    // TDLog.v("Good station: " + good_station + survey);
                                  }
                              } else {
                                  //mEdit[k].setError(mContext.getResources().getString(R.string.error_name_required));
                                  //return;
                              }
                          }
                          if (good_station ) { // if (good_station > 0) 
                            mParent.makeEquate(sts); // does nothing if sts.size() <= 1
                            stations.add(station);
                          }
                      }
                  }
              }
              //TDToast.makeWarn(String.format("size %d", size));
          }
    } else if ( b == mBTone ) { // HB EQ all one equation - no loop
        ArrayList<String> stations = new ArrayList<>(); // kapcsolódási pont lista

        int eq_group_nr = 0; // nincs még csoport
        int eq_group_nr_max = 0; // nincs még csoport
        int[] eq_group = new int[size];
        for (int j = 0; j < ( size ) ; ++j ) eq_group[j]=-1; // nem tertoznak a felmérések semmilyen csoportba
        
        if (size > 1) {
            for (int j = 0; j < ( size - 1 ) ; ++j) { // minden felmérésre az utolsó előttig
                TdmViewCommand vc0 = mCommands.get(j);
                String survey0 = vc0.name(); // a felmérés neve
                for (TdmViewStation st : vc0.mStations) { // minden mérési pontra
                    if (st.mEquated) break; // ha a mérési pont már része kapcsolódásnak kiugrik
                    String station = st.name(); // a mérési pont neve
                    if ( ! stations.contains( station ) ) { // ha a pontra még nincs kapcsolat
                        boolean good_station = false; // nincs még jó mp
                        ArrayList<String> sts = new ArrayList<>(); // mérési pontok listája
                        int len0 = survey0.length(); // a felmérés nevének hossza
                        //while (len0 > 0 && survey0.charAt(len0 - 1) == '.') --len0; // FIXME ! It should also be prohibited when creating the survey! It is allowed there.
                        sts.add(station + "@" + survey0.substring(0, len0)); // hozzáadja az alap felmérést és pontot a mérési pont listához
                        for (int k = ( j + 1 ); k < size; ++k) { // minden felmérésre a következőtől
                            TdmViewCommand vc = mCommands.get(k);
                            String survey = vc.name(); // a kapcsolódó felmérés neve
                            int len = survey.length();
                            //while (len > 0 && survey.charAt(len - 1) == '.') --len; // ? FIXME ! It should also be prohibited when creating the survey! It is allowed there.
                            if (station != null && station.length() > 0) { // FIXME this is guaranteed - or the test should be done when station is assigned
                                if (vc.getViewStation(station) != null) { // ha van ilyen pont a következő mérésben FIXME ha mindkettő szerepel az előzőekben akkor nem
                                    if ((eq_group[j] == eq_group[k]) && (eq_group[j] != -1) ) { // hurok
                                        // loop
                                    } else {
                                        sts.add(station + "@" + survey.substring(0, len));
                                        good_station = true; // van jó kapcsolódás
                                        if (eq_group[j] == -1 && eq_group[k] == -1) { // ha nincs még kapcsolata egyik felmérésnek sem
                                            eq_group_nr++;
                                            eq_group_nr_max++;
                                            eq_group[j] = eq_group_nr;
                                            eq_group[k] = eq_group_nr;
                                        } else if (eq_group[j] == -1) {
                                            eq_group[j] = eq_group[k];
                                        } else if (eq_group[k] == -1) {
                                            eq_group[k] = eq_group[j];
                                        } else { // két csoport összekapcsolása
                                            for (int l = 0; l < ( size ) ; ++l ) if (eq_group[l]==eq_group[k]) eq_group[l]=eq_group[j]; // k átírása j-re
                                            eq_group_nr_max--;
                                        }
                                    }
                                } else {
                                    // TDLog.v("Good station: " + good_station + survey);
                                }
                            } else {
                                //mEdit[k].setError(mContext.getResources().getString(R.string.error_name_required));
                                //return;
                            }
                        }
                        if (good_station ) { // if (good_station > 0)
                            mParent.makeEquate(sts); // does nothing if sts.size() <= 1
                            stations.add(station); // station exist equate a mérési pont hozzáadása a kapcsolódási pont listához
                        }
                    }
                }
            }
            TDToast.makeWarn(String.format("Group %d", eq_group_nr_max));
        }

    } else if ( b == mBTsearch ) {
          ArrayList<String> stations = new ArrayList<>();
          for (int k = 0; k < size ; ++k) mEdit[k].setText("-");
          if (size > 1) {
              for (int j = j0; j < ( size - 1 ) ; ++j) {
                  // int good_station = 0; FIXME same as above
                  TdmViewCommand vc0 = mCommands.get(j);
                  String survey0 = vc0.name();
                  for (int l=l0;l<vc0.mStations.size(); ++l ){
                      TdmViewStation st = vc0.mStations.get(l);
                      if (st.mEquated) break; // FIXME break or continue ?
                      String station = st.name();
                      // boolean old = false;
                      // for ( String st0 : stations ) {
                      //     if ( st0.equals( station ) ) old = true;
                      // }
                      // if (!old) 
                      if ( ! stations.contains( station ) ) {
                          boolean good_station = false;
                          ArrayList<String> sts = new ArrayList<>();
                          int len0 = survey0.length();
                          //while (len0 > 0 && survey0.charAt(len0 - 1) == '.') --len0; // ?
                          for (int k = j+1; k < size; ++k) {
                              TdmViewCommand vc = mCommands.get(k);
                              String survey = vc.name();
                              int len = survey.length();
                              //while (len > 0 && survey.charAt(len - 1) == '.') --len; // ?
                              //String station = station0;
                              if (station != null && station.length() > 0) {
                                  if (vc.getViewStation(station) != null) {
                                      sts.add(station + "@" + survey.substring(0, len)); //
                                      mEdit[j].setText(station);
                                      mEdit[k].setText(station);
                                      good_station = true; // ++;
                                  } else {
                                      //TDLog.v("HBEQ Bad station: " + good_station + survey);
                                  }
                              } else {
                                  //mEdit[k].setError(mContext.getResources().getString(R.string.error_name_required));
                                  //return;
                              }
                          }
                          if (good_station ) { // if (good_station > 0) 
                              j0=j;
                              l0=l+1;
                              if (l0>=vc0.mStations.size()) {
                                  j0=j+1;
                                  l0=0;
                              }
                              // good_station = 0; // FIXME why reset the local variable ?
                              return;
                          }
                      }
                  }
              }
              //TDToast.makeWarn(String.format("size %d", size));
              l0=0;
          }
      }
//-------------------------------------------------------------------------------HB EQ all
    dismiss();
  }
}
