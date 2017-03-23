package com.example.elsa.bdd_bachelor_beckerelsa;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * Created by Elsa on 23/03/2017.
 */

public class ConnectUser extends AsyncTask<String, Void, String> {

    private Context context;

    public ConnectUser(Context context){
        this.context = context;
    }

    protected void onPreExecute(){

    }


    @Override
    protected String doInBackground(String... arg0){
        String log = arg0[0];
        String mdp = arg0[1];

        String lien;
        String stock;
        BufferedReader bufferedReader;
        String result;

        try{
            stock = "?Login=" + URLEncoder.encode(log, "UTF-8");
            stock += "&Password=" + URLEncoder.encode(mdp, "UTF-8");

            lien = "http://10.0.2.2/Bdd_ngl/signin.php" + stock;
            URL url = new URL(lien);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();

            bufferedReader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            result = bufferedReader.readLine().toString();
            return result;

        }catch (Exception e){
            return new String("Exception: " + e.getMessage());
        }
    }


    @Override
    protected void onPostExecute(String result){
        String jsonString = result;
        if (jsonString != null){
            try{
                JSONObject jsonObj = new JSONObject(jsonString);
                String query_result = jsonObj.getString("query_result");
                if (query_result.equals("SUCCESS")){
                    Toast.makeText(context, "Connexion réussie", Toast.LENGTH_SHORT).show();
                    //goToNextActivity();
                }else if (query_result.equals("FAILURE")){
                    Toast.makeText(context, "Connexion échouée", Toast.LENGTH_SHORT).show();
                }else{
                    Toast.makeText(context, "Connexion à la base de données échouée", Toast.LENGTH_SHORT).show();
                }
            }catch (JSONException e){
                e.printStackTrace();
                Toast.makeText(context, "Erreur analyse données JSON.", Toast.LENGTH_SHORT).show();
            }
        }else{
            Toast.makeText(context, "Données JSON introuvables.", Toast.LENGTH_SHORT).show();
        }
    }

   /* private void private void goToNextActivity(){
        Intent intent = new Intent(user_connection.class, MainActivity.class);
        startActivity(intent);
    }*/
}
