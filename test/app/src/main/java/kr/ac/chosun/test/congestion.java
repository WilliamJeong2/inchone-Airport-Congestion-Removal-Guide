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
        setContentView(R.layout.congestion);

        states = getResources().getStringArray(R.array.week_list); //String.xml에 저장된 week_list 열을 states에 저장
        imgs = getResources().obtainTypedArray(R.array.week_flag_list); //String.xml에 저장된 ggplot이미지 배열을 imgs에 저장

        image = (ImageView) findViewById(R.id.imageview1); //ggplot이미지를 표시할 이미지 뷰 연결
        spinner = (Spinner) findViewById(R.id.spinner1);  // 스피너 연결

        //스피너를 클릭하였을 경우 states 배열에 저장된 week_list를 표시
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, states);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(dataAdapter);

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { //스피너를 눌렀을 경우 발생되는 리스너
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
