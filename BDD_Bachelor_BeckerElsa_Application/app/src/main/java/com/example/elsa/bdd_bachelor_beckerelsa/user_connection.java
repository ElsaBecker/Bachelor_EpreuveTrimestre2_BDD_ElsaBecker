package com.example.elsa.bdd_bachelor_beckerelsa;


import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;



public class user_connection extends AppCompatActivity {

    EditText login;
    EditText password;
    Button connect;
    Button createaccount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_connection);

        login = (EditText) findViewById(R.id.edit_log);
        password = (EditText) findViewById(R.id.edit_mdp);
        connect = (Button) findViewById(R.id.button_connect);
        createaccount = (Button) findViewById(R.id.button_newuser);

        connect.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){

                String log = login.getText().toString();
                String mdp = password.getText().toString();

                Toast.makeText(user_connection.this, "Connexion...", Toast.LENGTH_SHORT).show();
                new ConnectUser(user_connection.this).execute(log, mdp);
                /*Toast.makeText(this, "Connexion...", Toast.LENGTH_SHORT).show();
                new ConnectUser(this).execute(log, mdp);*/

            }
        });


        createaccount.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){

                String log = login.getText().toString();
                String mdp = password.getText().toString();

                Toast.makeText(user_connection.this, "Création...", Toast.LENGTH_SHORT).show();
                new CreateUser(user_connection.this).execute(log, mdp);

            }
        });

    }

}