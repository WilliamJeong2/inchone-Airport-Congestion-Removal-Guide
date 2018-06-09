package kr.ac.chosun.test;

import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.github.mikephil.charting.animation.Easing;
import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.Description;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;

import java.util.ArrayList;
import java.util.List;

import uk.co.senab.photoview.PhotoViewAttacher;

public class congestion extends AppCompatActivity {

    ArrayAdapter<CharSequence> adspin1, adspin2;
    String choice_year = ""; //선택된 연도가 들어갈 string 변수 선언
    String choice_month = ""; //선택된 월이 들어갈 string 변수 선언
    PhotoViewAttacher mAttacher;

    @Override
    protected void onCreate(Bundle savedInstaceState) {
        super.onCreate(savedInstaceState);
        setContentView(R.layout.congestion);

        final Spinner spin1 = (Spinner)findViewById(R.id.spinner1);
        final Spinner spin2 = (Spinner)findViewById(R.id.spinner2);
        Button btn_refresh = (Button)findViewById(R.id.btn_refresh);
        final ImageView imageview = (ImageView)findViewById(R.id.imageview0);
        mAttacher = new PhotoViewAttacher(imageview);

        adspin1 = ArrayAdapter.createFromResource(congestion.this, R.array.year_list,android.R.layout.simple_spinner_dropdown_item);
        adspin1.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        spin1.setAdapter(adspin1);
        spin1.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(adspin1.getItem(position).equals("2014년")){ //년도 spinner에서 2014년을 선택하였을 경우
                    choice_year = "2014년"; //choice_year에 선택된 문자열 저장

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);  //adspin2에 month_list를 연결
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {  //spin2에 있는 month 아이템 선택 시 실행되는 리스너
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString(); //선택된 문자열을 choice_month에 저장
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2015년")){  //년도 spinner에서 2015년을 선택하였을 경우
                    choice_year = "2015년";  //choice_year에 선택된 문자열 저장

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);  //adspin2에 month_list를 연결
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {  //spin2에 있는 month 아이템 선택 시 실행되는 리스너
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();  //선택된 문자열을 choice_month에 저장
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2016년")){  //년도 spinner에서 2016년을 선택하였을 경우
                    choice_year = "2016년";  //choice_year에 선택된 문자열 저장

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);  //adspin2에 month_list를 연결
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {  //spin2에 있는 month 아이템 선택 시 실행되는 리스너
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();  //선택된 문자열을 choice_month에 저장
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2017년")){  //년도 spinner에서 2017년을 선택하였을 경우
                    choice_year = "2017년";  //choice_year에 선택된 문자열 저장

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);  //adspin2에 month_list를 연결
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {  //spin2에 있는 month 아이템 선택 시 실행되는 리스너
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();  //선택된 문자열을 choice_month에 저장
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2018년")){  //년도 spinner에서 2018년을 선택하였을 경우
                    choice_year = "2018년";  //choice_year에 선택된 문자열 저장

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);  //adspin2에 month_list를 연결
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {  //spin2에 있는 month 아이템 선택 시 실행되는 리스너
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();  //선택된 문자열을 choice_month에 저장
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }



            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        btn_refresh.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View view){

                TextView y_m;
                String error = "준비되지 않은 자료입니다."; //준비되지 않은 자료 선택 시 띄울 메세지
                y_m = (TextView)findViewById(R.id.textview1);


                y_m.setText(choice_year+choice_month); //선택된 년도와 월을 y_m에 저장

                //아래는 선택된 년도와 월이 다음과 같을 경우 해당하는 기간의 요일별 혼잡도를 불러오는 함수
                if((choice_year+choice_month).equals("2014년1월")){
                    imageview.setImageResource(R.drawable.w2014_01);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년2월")){
                    imageview.setImageResource(R.drawable.w2014_02);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년3월")){
                    imageview.setImageResource(R.drawable.w2014_03);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년4월")){
                    imageview.setImageResource(R.drawable.w2014_04);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년5월")){
                    imageview.setImageResource(R.drawable.w2014_05);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년6월")){
                    imageview.setImageResource(R.drawable.w2014_06);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년7월")){
                    imageview.setImageResource(R.drawable.w2014_07);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년8월")){
                    imageview.setImageResource(R.drawable.w2014_08);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년9월")){
                    imageview.setImageResource(R.drawable.w2014_09);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년10월")){
                    imageview.setImageResource(R.drawable.w2014_10);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년11월")){
                    imageview.setImageResource(R.drawable.w2014_11);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2014년12월")){
                    imageview.setImageResource(R.drawable.w2014_12);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }

                else if((choice_year+choice_month).equals("2015년1월")){
                    imageview.setImageResource(R.drawable.w2015_01);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년2월")){
                    imageview.setImageResource(R.drawable.w2015_02);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년3월")){
                    imageview.setImageResource(R.drawable.w2015_03);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년4월")){
                    imageview.setImageResource(R.drawable.w2015_04);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년5월")){
                    imageview.setImageResource(R.drawable.w2015_05);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년6월")){
                    imageview.setImageResource(R.drawable.w2015_06);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년7월")){
                    imageview.setImageResource(R.drawable.w2015_07);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년8월")){
                    imageview.setImageResource(R.drawable.w2015_08);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년9월")){
                    imageview.setImageResource(R.drawable.w2015_09);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년10월")){
                    imageview.setImageResource(R.drawable.w2015_10);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년11월")){
                    imageview.setImageResource(R.drawable.w2015_11);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2015년12월")){
                    imageview.setImageResource(R.drawable.w2015_12);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }

                else if((choice_year+choice_month).equals("2016년1월")){
                    imageview.setImageResource(R.drawable.w2016_01);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년2월")){
                    imageview.setImageResource(R.drawable.w2016_02);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년3월")){
                    imageview.setImageResource(R.drawable.w2016_03);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년4월")){
                    imageview.setImageResource(R.drawable.w2016_04);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년5월")){
                    imageview.setImageResource(R.drawable.w2016_05);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년6월")){
                    imageview.setImageResource(R.drawable.w2016_06);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년7월")){
                    imageview.setImageResource(R.drawable.w2016_07);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년8월")){
                    imageview.setImageResource(R.drawable.w2016_08);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년9월")){
                    imageview.setImageResource(R.drawable.w2016_09);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년10월")){
                    imageview.setImageResource(R.drawable.w2016_10);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년11월")){
                    imageview.setImageResource(R.drawable.w2016_11);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2016년12월")){
                    imageview.setImageResource(R.drawable.w2016_12);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }

                else if((choice_year+choice_month).equals("2017년1월")){
                    imageview.setImageResource(R.drawable.w2017_01);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년2월")){
                    imageview.setImageResource(R.drawable.w2017_02);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년3월")){
                    imageview.setImageResource(R.drawable.w2017_03);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년4월")){
                    imageview.setImageResource(R.drawable.w2017_04);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년5월")){
                    imageview.setImageResource(R.drawable.w2017_05);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년6월")){
                    imageview.setImageResource(R.drawable.w2017_06);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년7월")){
                    imageview.setImageResource(R.drawable.w2017_07);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년8월")){
                    imageview.setImageResource(R.drawable.w2017_08);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년9월")){
                    imageview.setImageResource(R.drawable.w2017_09);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년10월")){
                    imageview.setImageResource(R.drawable.w2017_10);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년11월")){
                    imageview.setImageResource(R.drawable.w2017_11);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2017년12월")){
                    imageview.setImageResource(R.drawable.w2017_12);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }

                else if((choice_year+choice_month).equals("2018년1월")){
                    imageview.setImageResource(R.drawable.w2018_01);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2018년2월")){
                    imageview.setImageResource(R.drawable.w2018_02);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }
                else if((choice_year+choice_month).equals("2018년3월")){
                    imageview.setImageResource(R.drawable.w2018_03);
                    Toast.makeText(congestion.this, choice_year + choice_month, Toast.LENGTH_SHORT).show();
                }

                else if((choice_year+choice_month).equals("2018년4월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_04);
                }
                else if((choice_year+choice_month).equals("2018년5월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_05);
                }
                else if((choice_year+choice_month).equals("2018년6월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_06);
                }
                else if((choice_year+choice_month).equals("2018년7월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_07);
                }
                else if((choice_year+choice_month).equals("2018년8월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_08);
                }
                else if((choice_year+choice_month).equals("2018년9월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_09);
                }
                else if((choice_year+choice_month).equals("2018년10월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_10);
                }
                else if((choice_year+choice_month).equals("2018년11월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_11);
                }
                else if((choice_year+choice_month).equals("2018년12월")) {
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show(); //준비되지 않은 자료를 선택하여 error Toast 메세지 출력
                    //imageview.setImageResource(R.drawable.w2018_12);
                }
            }

        });
    }

    }
