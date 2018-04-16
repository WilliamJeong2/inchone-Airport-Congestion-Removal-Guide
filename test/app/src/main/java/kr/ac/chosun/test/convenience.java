package kr.ac.chosun.test;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

public class convenience extends MainActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.convenience); //해당 아이디에 자신이 만든 레이아웃의 이름을 쓴다

        ImageButton eat = (ImageButton) findViewById(R.id.eat_btn);
        eat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Uri gotoeat = Uri.parse("https://www.airport.kr/ap/ko/shp/getFoodInfoMain.do");
                Intent goeat = new Intent(Intent.ACTION_VIEW, gotoeat);
                startActivity(goeat); //액티비티 이동
            }
        });
    }
}
