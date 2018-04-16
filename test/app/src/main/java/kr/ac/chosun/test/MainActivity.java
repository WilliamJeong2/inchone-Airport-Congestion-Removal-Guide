package kr.ac.chosun.test;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.net.UrlQuerySanitizer;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.net.URL;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageButton congestion = (ImageButton) findViewById(R.id.congestion_button); //해당 버튼을 지정합니다.
        congestion.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { //버튼이 눌렸을 때
                Intent intent = new Intent(MainActivity.this, congestion.class);
                startActivity(intent); //액티비티 이동
            }
        });

        ImageButton landing = (ImageButton) findViewById(R.id.flight_land_button); //해당 버튼을 지정합니다.
        landing.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { //버튼이 눌렸을 때
                Intent intent = new Intent(MainActivity.this, landing.class);
                startActivity(intent); //액티비티 이동
            }
        });

        ImageButton delay = (ImageButton) findViewById(R.id.delay_button); //해당 버튼을 지정합니다.
        delay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { //버튼이 눌렸을 때
                Intent intent = new Intent(MainActivity.this, delay.class);
                startActivity(intent); //액티비티 이동
            }
        });

        ImageButton parking = (ImageButton) findViewById(R.id.parking_button); //해당 버튼을 지정합니다.
        parking.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { //버튼이 눌렸을 때
                Intent intent = new Intent(MainActivity.this, parking.class);
                startActivity(intent); //액티비티 이동
            }
        });

        ImageButton takeoff = (ImageButton) findViewById(R.id.flight_takeoff_button); //해당 버튼을 지정합니다.
        takeoff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { //버튼이 눌렸을 때
                Intent intent = new Intent(MainActivity.this, takeoffinfo.class);
                startActivity(intent); //액티비티 이동
            }
        });

        ImageButton convenience = (ImageButton) findViewById(R.id.convenience_button); //해당 버튼을 지정합니다.
        convenience.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) { //버튼이 눌렸을 때
                Intent intent = new Intent(MainActivity.this, convenience.class);
                startActivity(intent); //액티비티 이동
            }
        });



        /*StrictMode.enableDefaults();

        TextView status1 = (TextView)findViewById(R.id.result); //파싱된 결과확인!

        boolean initem = false, inAtime = false, inT1sum1 = false, inT1sum2 = false, inT1sum3 = false;
        boolean inT1sum4 = false, inT1sum5 = false, inT1sum6 = false, inT1sum7 = false, inT1sum8=false, inT1sumset1 = false, inT1sumset2 = false;
        boolean inT2sum1 = false, inT2sum2 = false, inT2sum3 = false, inT2sum4 = false, inT2sumset1 = false, inT2sumset2 = false;

        String atime = null, t1sum1 = null, t1sum2 = null, t1sum3 = null, t1sum4 = null, t1sum5=null, t1sum6=null, t1sum7=null;
        String t1sum8 = null, t1sumset1 = null, t1sumset2 = null;
        String t2sum1 = null, t2sum2 = null, t2sum3 = null, t2sum4 = null, t2sumset1 = null, t2sumset2 = null;


        try{

            URL url = new URL("http://openapi.airport.kr/openapi/service/PassengerNoticeKR/getfPassengerNoticeIKR?ServiceKey="
                    + "Nb%2BV2BcVQ%2BjSh4zZQkvreUtW0lbjoMq4kmUkR3Inc0OHZXmUTxvqXKaDhBoqvV0HGIx0%2BodRUS8K4Vyg7qiOwg%3D%3D"
            ); //검색 URL부분

            XmlPullParserFactory parserCreator = XmlPullParserFactory.newInstance(); // 위에서 생성된 URL을 통하여 서버에 요청하면 결과가 XML Resource로 전달됨
            XmlPullParser parser = parserCreator.newPullParser(); //XML Resource 를 파싱할 parser를 parserCreator로 생성

            parser.setInput(url.openStream(), null); // 파서 통하여 각 요소들의 이벤트성 처리를 반복수행


            int parserEvent = parser.getEventType();
            System.out.println("파싱시작합니다.");

            while (parserEvent != XmlPullParser.END_DOCUMENT){ //XML문이 끝날 때까지 정보를 읽는다.

                switch(parserEvent){
                    case XmlPullParser.START_TAG: //parser가 시작 태그를 만나면 실행
                        if(parser.getName().equals("atime")){ //title 만나면 내용을 받을수 있게 하자
                            System.out.println("여기는 걸리나?");
                            inAtime = true;
                        }
                        if(parser.getName().equals("t1sum1")){ //address 만나면 내용을 받을수 있게 하자
                            inT1sum1 = true;
                        }
                        if(parser.getName().equals("t1sum2")){ //mapx 만나면 내용을 받을수 있게 하자
                            inT1sum2 = true;
                        }
                        if(parser.getName().equals("t1sum3")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sum3 = true;
                        }
                        if(parser.getName().equals("t1sum4")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sum4 = true;
                        }
                        if(parser.getName().equals("t1sum5")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sum5 = true;
                        }
                        if(parser.getName().equals("t1sum6")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sum6 = true;
                        }
                        if(parser.getName().equals("t1sum7")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sum7 = true;
                        }
                        if(parser.getName().equals("t1sum8")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sum8 = true;
                        }
                        if(parser.getName().equals("t1sumset1")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sumset1 = true;
                        }
                        if(parser.getName().equals("t1sumset2")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT1sumset2 = true;
                        }
                        if(parser.getName().equals("t2sum1")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT2sum1 = true;
                        }
                        if(parser.getName().equals("t2sum2")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT2sum2 = true;
                        }
                        if(parser.getName().equals("t2sum3")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT2sum3 = true;
                        }
                        if(parser.getName().equals("t2sum4")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT2sum4 = true;
                        }
                        if(parser.getName().equals("t2sumset1")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT2sumset1 = true;
                        }
                        if(parser.getName().equals("t2sumset2")){ //mapy 만나면 내용을 받을수 있게 하자
                            inT2sumset2 = true;
                        }
                        if(parser.getName().equals("message")){ //message 태그를 만나면 에러 출력
                            status1.setText(status1.getText()+"에러");
                            //여기에 에러코드에 따라 다른 메세지를 출력하도록 할 수 있다.
                        }
                        break;

                    case XmlPullParser.TEXT://parser가 내용에 접근했을때

                        if(inAtime){ //isTitle이 true일 때 태그의 내용을 저장.
                            atime = parser.getText();
                            inAtime = false;
                        }
                        if(inT1sum1){ //isAddress이 true일 때 태그의 내용을 저장.
                            t1sum1 = parser.getText();
                            inT1sum1 = false;
                        }
                        if(inT1sum2){ //isMapx이 true일 때 태그의 내용을 저장.
                            t1sum2 = parser.getText();
                            inT1sum2 = false;
                        }
                        if(inT1sum3){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sum3 = parser.getText();
                            inT1sum3 = false;
                        }
                        if(inT1sum4){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sum4 = parser.getText();
                            inT1sum4 = false;
                        }
                        if(inT1sum5){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sum5 = parser.getText();
                            inT1sum5 = false;
                        }
                        if(inT1sum6){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sum6 = parser.getText();
                            inT1sum6 = false;
                        }
                        if(inT1sum7){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sum7 = parser.getText();
                            inT1sum7 = false;
                        }
                        if(inT1sum8){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sum8 = parser.getText();
                            inT1sum8 = false;
                        }
                        if(inT1sumset1){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sumset1 = parser.getText();
                            inT1sumset1 = false;
                        }
                        if(inT1sumset2){ //isMapy이 true일 때 태그의 내용을 저장.
                            t1sumset2 = parser.getText();
                            inT1sumset2 = false;
                        }
                        if(inT2sum1){ //isMapy이 true일 때 태그의 내용을 저장.
                            t2sum1 = parser.getText();
                            inT2sum1 = false;
                        }
                        if(inT2sum2){ //isMapy이 true일 때 태그의 내용을 저장.
                            t2sum2 = parser.getText();
                            inT2sum2 = false;
                        }
                        if(inT2sum3){ //isMapy이 true일 때 태그의 내용을 저장.
                            t2sum3 = parser.getText();
                            inT2sum3 = false;
                        }
                        if(inT2sum4){ //isMapy이 true일 때 태그의 내용을 저장.
                            t2sum4 = parser.getText();
                            inT2sum4 = false;
                        }
                        if(inT2sumset1){ //isMapy이 true일 때 태그의 내용을 저장.
                            t2sumset1 = parser.getText();
                            inT2sumset1 = false;
                        }
                        if(inT2sumset2){ //isMapy이 true일 때 태그의 내용을 저장.
                            t2sumset2 = parser.getText();
                            inT2sumset2 = false;
                        }
                        break;
                    case XmlPullParser.END_TAG:
                        if(parser.getName().equals("item")){
                            status1.setText(status1.getText()+" 시간대 : "+ atime + "\n T1입국장 동편(A,B) 현황: " + t1sum1 + "\n T1입국장 서편(E,F) 현황 : " + t1sum2
                                    + "\n T1입국심사(C) 현황 : " + t1sum3 +  "\n T1입국심사(D) 현황 : " + t1sum4 + "\n T1출국장1,2 현황 : " + t1sum5
                                    + "\n T1출국장3 현황 : " + t1sum6 + "\n T1출국장4 현황 : " + t1sum7 + "\n T1출국장5,6 현황 : " + t1sum8
                                    + "\n T1입국장 합계 : " + t1sumset1 + "\n T1출국장 합계 : " + t1sumset2 + "\n T2입국장 1 현황 : " + t2sum1 + "\n T2입국장 2 현황 : " + t2sum2
                                    + "\n T2출국당 1 현황 : " + t2sum3 + "\n T2 출국장 2 현황 : " + t2sum4 + "\n T2입국장 합계 : " +t2sumset1 + "\n T2출국장 합계 : " + t2sumset2 + "\n" );
                            initem = false;
                        }
                        break;
                }
                parserEvent = parser.next();
            }
        } catch(Exception e){
            status1.setText("에러가..났습니다...");
        }*/
    }
}







