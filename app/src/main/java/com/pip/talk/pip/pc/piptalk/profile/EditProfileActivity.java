package com.pip.talk.pip.pc.piptalk.profile;

import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.pip.talk.pip.pc.piptalk.ApplicationClass;
import com.pip.talk.pip.pc.piptalk.R;
import com.pip.talk.pip.pc.piptalk.User_Model.UserPreference;
import com.pip.talk.pip.pc.piptalk.xmpp.util.Util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;



public class EditProfileActivity extends AppCompatActivity {

    private EditText statusTxt;
    private EditText phoneTxt;
    private EditText dateTxt;
    private Spinner genderSpinner;
    private Spinner languageSpinner;
    private Button saveBtn;
    private Context context;
    private Typeface typeface;
   private   ArrayList<String> languageOptinsList;
   private ArrayList<String> languageValuesOfOptions;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar_edit_profile);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);

        context = this;
        statusTxt=(EditText)findViewById(R.id.editStatusTxt);
        phoneTxt=(EditText)findViewById(R.id.editphoneTxt);
        dateTxt=(EditText)findViewById(R.id.editBirthDate);
        genderSpinner=(Spinner)findViewById(R.id.EditProfile_gender_spinner);
        languageSpinner=(Spinner)findViewById(R.id.EditProfile_language_spinner);
        saveBtn=(Button)findViewById(R.id.editprofile_saveBtn);

        typeface = Typeface.createFromAsset(this.getAssets(),"Raleway-Regular.ttf");

        statusTxt.setTypeface(typeface);
        phoneTxt.setTypeface(typeface);
        dateTxt.setTypeface(typeface);

        languageOptinsList=new ArrayList<>(Arrays.asList(getResources().getStringArray(R.array.language_options)));
        languageValuesOfOptions=new ArrayList<>(Arrays.asList(getResources().getStringArray(R.array.languages_values)));
        languageSpinner.setSelection(languageOptinsList.indexOf(languageSpinner.getSelectedItem().toString()));

    }

    @Override
    protected void onResume() {
        super.onResume();

        saveBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //update data on Preference

                UserPreference userPreference = new UserPreference(context);
                if (phoneTxt.getText().length()>0 ){
                   userPreference.setKEY_UER_PHONE(phoneTxt.getText().toString());
                }
                if (dateTxt.getText().length()>0 ){
                    userPreference.setKEY_UER_BIRTH_DATE(dateTxt.getText().toString());
                }
                if (statusTxt.getText().length()>0 ){
                    userPreference.setKEY_UER_STATUS(statusTxt.getText().toString());
                }

                userPreference.setKEY_UER_GENDER(genderSpinner.getSelectedItem().toString());

                // update setting

                int langValIndex=languageOptinsList.indexOf(languageSpinner.getSelectedItem().toString());

                PreferenceManager.getDefaultSharedPreferences(context).
                        edit().putString(getString(R.string.pref_language_key),
                        languageValuesOfOptions.get(langValIndex)).apply();

                userPreference.setKEY_USER_NATIVE_LANGUAGE(languageSpinner.getSelectedItem().toString());

                //update data on cloud
                updateUserData();

                Intent intent=new Intent(EditProfileActivity.this,ProfileActivity.class);
                startActivity(intent);

            }
        });


    }

    private void updateUserData() {
        String URL="http://"+ Util.WAMP_SERVER_DOMAIN+"/piptalk/update_profile.php";
        StringRequest updateDataRequest=new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                finish();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params=new HashMap<>();
                params.put("status",statusTxt.getText().toString());
                params.put("lang",languageSpinner.getSelectedItem().toString());
                params.put("gender",genderSpinner.getSelectedItem().toString());
                params.put("phone",phoneTxt.getText().toString());
                params.put("birth_date",dateTxt.getText().toString());
                params.put("user_id",String.valueOf(new UserPreference(getApplicationContext()).getUser().getId()));
                return params;
            }
        };
        ApplicationClass.getInstance().addToRequestQueue(updateDataRequest);
    }
}
