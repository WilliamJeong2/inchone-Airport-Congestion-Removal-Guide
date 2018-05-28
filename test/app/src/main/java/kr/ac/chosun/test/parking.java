package kr.ac.chosun.test;

import android.os.Bundle;
import android.widget.ImageView;

import uk.co.senab.photoview.PhotoViewAttacher;

public class parking extends MainActivity {
    PhotoViewAttacher mAttacher;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.parkinginfo); //해당 아이디에 자신이 만든 레이아웃의 이름을 쓴다

        final ImageView imageview2 = (ImageView)findViewById(R.id.imageview2);
        mAttacher = new PhotoViewAttacher(imageview2);
        imageview2.setImageResource(R.drawable.map_parking_info);
    }
}

