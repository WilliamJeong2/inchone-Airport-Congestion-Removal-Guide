package kr.ac.chosun.test;

import android.content.res.TypedArray;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.ArrayList;


public class congestion extends MainActivity {

    private ImageView image;
    private String[] states;
    private Spinner spinner;
    private TypedArray imgs;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.congestion); //해당 아이디에 자신이 만든 레이아웃의 이름을 쓴다

        states = getResources().getStringArray(R.array.week_list);
        imgs = getResources().obtainTypedArray(R.array.week_flag_list);

        image = (ImageView) findViewById(R.id.imageview1);
        spinner = (Spinner) findViewById(R.id.spinner1);

        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, states);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(dataAdapter);

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                image.setImageResource(imgs.getResourceId(spinner.getSelectedItemPosition(),-1));
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        };
    }
