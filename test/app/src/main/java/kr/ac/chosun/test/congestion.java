package kr.ac.chosun.test;

import android.content.res.TypedArray;
import android.media.Image;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;


public class congestion extends MainActivity {


    ArrayAdapter<CharSequence> adspin1, adspin2;
    String choice_year = "";
    String choice_month = "";





    @Override
    protected void onCreate(Bundle savedInstaceState) {
        super.onCreate(savedInstaceState);
        setContentView(R.layout.congestion);
        final Spinner spin1 = (Spinner)findViewById(R.id.spinner1);
        final Spinner spin2 = (Spinner)findViewById(R.id.spinner2);
        Button btn_refresh = (Button)findViewById(R.id.btn_refresh);
        final ImageView imageview = (ImageView)findViewById(R.id.imageview1);

        adspin1 = ArrayAdapter.createFromResource(congestion.this, R.array.year_list,android.R.layout.simple_spinner_dropdown_item);

        adspin1.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        spin1.setAdapter(adspin1);
        spin1.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(adspin1.getItem(position).equals("2014년")){
                    choice_year = "2014년";

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2015년")){
                    choice_year = "2015년";

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2016년")){
                    choice_year = "2016년";

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2017년")){
                    choice_year = "2017년";

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {

                        }
                    });

                }
                else if(adspin1.getItem(position).equals("2018년")){
                    choice_year = "2018년";

                    adspin2 = ArrayAdapter.createFromResource(congestion.this, R.array.month_list,android.R.layout.simple_spinner_dropdown_item);
                    adspin2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin2.setAdapter(adspin2);

                    spin2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month = adspin2.getItem(position).toString();
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
                String error = "준비되지 않은 자료입니다.";
                y_m = (TextView)findViewById(R.id.textview1);


                y_m.setText(choice_year+choice_month);
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

                if((choice_year+choice_month).equals("2016년1월")){
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
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_04);
                }
                else if((choice_year+choice_month).equals("2018년5월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_05);
                }
                else if((choice_year+choice_month).equals("2018년6월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_06);
                }
                else if((choice_year+choice_month).equals("2018년7월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_07);
                }
                else if((choice_year+choice_month).equals("2018년8월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_08);
                }
                else if((choice_year+choice_month).equals("2018년9월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_09);
                }
                else if((choice_year+choice_month).equals("2018년10월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_10);
                }
                else if((choice_year+choice_month).equals("2018년11월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_11);
                }
                else if((choice_year+choice_month).equals("2018년12월")){
                    Toast.makeText(congestion.this, error, Toast.LENGTH_SHORT).show();
                    //imageview.setImageResource(R.drawable.w2018_12);
                }

}

        });
    }

    }
