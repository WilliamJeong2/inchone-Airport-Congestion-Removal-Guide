package kr.ac.chosun.test;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
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

import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.List;

public class delay extends AppCompatActivity {


    ArrayAdapter<CharSequence> adspin3, adspin4;
    String choice_year1 = ""; //선택된 연도가 들어갈 string 변수 선언
    String choice_month1 = ""; //선택된 월이 들어갈 string 변수 선언
    private LineChart lineChart, lineChart1;

    @Override
    protected void onCreate(Bundle savedInstaceState) {
        super.onCreate(savedInstaceState);
        setContentView(R.layout.delay);


        lineChart = (LineChart)findViewById(R.id.chart);

        List<Entry> entries1 = new ArrayList<>();
        entries1.add(new Entry(1, 3108702));
        entries1.add(new Entry(2, 2947987));
        entries1.add(new Entry(3, 2590096));
        entries1.add(new Entry(4, 2723480));
        entries1.add(new Entry(5, 2500159));
        entries1.add(new Entry(6, 2751390));
        entries1.add(new Entry(7, 3084710));
        entries1.add(new Entry(8, 3170200));
        entries1.add(new Entry(9, 2903792));
        entries1.add(new Entry(10, 2750012));
        entries1.add(new Entry(11, 2912331));
        entries1.add(new Entry(12, 3159810));

        LineDataSet lineDataSet = new LineDataSet(entries1, "2018년 월별 이용객 수 (왼쪽부터 1월~12월)");
        lineDataSet.setLineWidth(2);
        lineDataSet.setCircleRadius(6);
        lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
        lineDataSet.setCircleColorHole(Color.BLUE);
        lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
        lineDataSet.setDrawCircleHole(true);
        lineDataSet.setDrawCircles(true);
        lineDataSet.setDrawHorizontalHighlightIndicator(false);
        lineDataSet.setDrawHighlightIndicators(false);
        lineDataSet.setDrawValues(false);

        LineData lineData = new LineData(lineDataSet);
        lineChart.setData(lineData);

        XAxis xAxis = lineChart.getXAxis();
        xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
        xAxis.setTextColor(Color.BLACK);
        xAxis.enableGridDashedLine(12, 36, 0);

        YAxis yLAxis = lineChart.getAxisLeft();
        yLAxis.setTextColor(Color.BLACK);

        YAxis yRAxis = lineChart.getAxisRight();
        yRAxis.setDrawLabels(false);
        yRAxis.setDrawAxisLine(false);
        yRAxis.setDrawGridLines(false);

        Description description = new Description();
        description.setText("");

        lineChart.setDoubleTapToZoomEnabled(false);
        lineChart.setDrawGridBackground(false);
        lineChart.setDescription(description);
        lineChart.animateY(0, Easing.EasingOption.EaseInCubic);
        lineChart.invalidate();

        TextView textView2 = (TextView) findViewById(R.id.textView2);
        TextView textView3 = (TextView) findViewById(R.id.textView3);
        TextView textView4 = (TextView) findViewById(R.id.textView4);
        TextView textView5 = (TextView) findViewById(R.id.textView5);
        TextView textView6 = (TextView) findViewById(R.id.textView6);
        TextView textView7 = (TextView) findViewById(R.id.textView7);
        TextView textView8 = (TextView) findViewById(R.id.textView8);

        textView2.setVisibility(View.GONE);
        textView3.setVisibility(View.GONE);
        textView4.setVisibility(View.GONE);
        textView5.setVisibility(View.GONE);
        textView6.setVisibility(View.GONE);
        textView7.setVisibility(View.GONE);
        textView8.setVisibility(View.GONE);

        final Spinner spin3 = (Spinner) findViewById(R.id.spinner3);
        final Spinner spin4 = (Spinner) findViewById(R.id.spinner4);
        Button btn_refresh2 = (Button) findViewById(R.id.btn_refresh2);

        adspin3 = ArrayAdapter.createFromResource(delay.this, R.array.year_list1, android.R.layout.simple_spinner_dropdown_item);
        adspin3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        spin3.setAdapter(adspin3);
        spin3.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (adspin3.getItem(position).equals("2018년")) { //년도 spinner에서 2014년을 선택하였을 경우
                    choice_year1 = "2018년"; //choice_year1에 선택된 문자열 저장

                    adspin4 = ArrayAdapter.createFromResource(delay.this, R.array.month_list, android.R.layout.simple_spinner_dropdown_item);  //adspin4에 month_list를 연결
                    adspin4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                    spin4.setAdapter(adspin4);

                    spin4.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {  //spin4에 있는 month 아이템 선택 시 실행되는 리스너
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            choice_month1 = adspin4.getItem(position).toString(); //선택된 문자열을 choice_month1에 저장
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


        btn_refresh2.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {

                //TextView y_m;
                String error = "준비되지 않은 자료입니다."; //준비되지 않은 자료 선택 시 띄울 메세지
                //y_m = (TextView) findViewById(R.id.textview1);

                TextView textView2 = (TextView) findViewById(R.id.textView2);
                TextView textView3 = (TextView) findViewById(R.id.textView3);
                TextView textView4 = (TextView) findViewById(R.id.textView4);
                TextView textView5 = (TextView) findViewById(R.id.textView5);
                TextView textView6 = (TextView) findViewById(R.id.textView6);
                TextView textView7 = (TextView) findViewById(R.id.textView7);
                TextView textView8 = (TextView) findViewById(R.id.textView8);

                textView2.setVisibility(View.VISIBLE);
                textView3.setVisibility(View.VISIBLE);
                textView4.setVisibility(View.VISIBLE);
                textView5.setVisibility(View.VISIBLE);
                textView6.setVisibility(View.VISIBLE);
                textView7.setVisibility(View.VISIBLE);
                textView8.setVisibility(View.VISIBLE);

                //y_m.setText(choice_year1 + choice_month1); //선택된 년도와 월을 y_m에 저장

                //아래는 선택된 년도와 월이 다음과 같을 경우 해당하는 기간의 요일별 혼잡도를 불러오는 함수
                if ((choice_year1 + choice_month1).equals("2018년1월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 519285));
                    entries.add(new Entry(2, 512869));
                    entries.add(new Entry(3, 394360));
                    entries.add(new Entry(4, 386667));
                    entries.add(new Entry(5, 395753));
                    entries.add(new Entry(6, 335169));
                    entries.add(new Entry(7, 512890));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 1월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년2월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 474090));
                    entries.add(new Entry(2, 376169));
                    entries.add(new Entry(3, 392160));
                    entries.add(new Entry(4, 416163));
                    entries.add(new Entry(5, 421604));
                    entries.add(new Entry(6, 423089));
                    entries.add(new Entry(7, 438770));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 2월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년3월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 306395));
                    entries.add(new Entry(2, 265695));
                    entries.add(new Entry(3, 443659));
                    entries.add(new Entry(4, 395977));
                    entries.add(new Entry(5, 436224));
                    entries.add(new Entry(6, 315890));
                    entries.add(new Entry(7, 324553));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 3월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년4월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 309986));
                    entries.add(new Entry(2, 291461));
                    entries.add(new Entry(3, 297714));
                    entries.add(new Entry(4, 366281));
                    entries.add(new Entry(5, 417875));
                    entries.add(new Entry(6, 508545));
                    entries.add(new Entry(7, 328627));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 4월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년5월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 381845));
                    entries.add(new Entry(2, 351293));
                    entries.add(new Entry(3, 294232));
                    entries.add(new Entry(4, 290462));
                    entries.add(new Entry(5, 336222));
                    entries.add(new Entry(6, 300073));
                    entries.add(new Entry(7, 398265));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 5월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년6월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 326060));
                    entries.add(new Entry(2, 302561));
                    entries.add(new Entry(3, 341622));
                    entries.add(new Entry(4, 354771));
                    entries.add(new Entry(5, 315283));
                    entries.add(new Entry(6, 327417));
                    entries.add(new Entry(7, 281868));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 6월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년7월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 337378));
                    entries.add(new Entry(2, 275189));
                    entries.add(new Entry(3, 362391));
                    entries.add(new Entry(4, 331435));
                    entries.add(new Entry(5, 504282));
                    entries.add(new Entry(6, 364968));
                    entries.add(new Entry(7, 384216));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 7월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년8월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 483451));
                    entries.add(new Entry(2, 385810));
                    entries.add(new Entry(3, 412089));
                    entries.add(new Entry(4, 334254));
                    entries.add(new Entry(5, 329763));
                    entries.add(new Entry(6, 357294));
                    entries.add(new Entry(7, 388754));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 8월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년9월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 314626));
                    entries.add(new Entry(2, 313585));
                    entries.add(new Entry(3, 389313));
                    entries.add(new Entry(4, 448683));
                    entries.add(new Entry(5, 452160));
                    entries.add(new Entry(6, 304623));
                    entries.add(new Entry(7, 331016));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 9월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년10월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 433749));
                    entries.add(new Entry(2, 288632));
                    entries.add(new Entry(3, 313411));
                    entries.add(new Entry(4, 301191));
                    entries.add(new Entry(5, 340834));
                    entries.add(new Entry(6, 457615));
                    entries.add(new Entry(7, 435767));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 10월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년11월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 358845));
                    entries.add(new Entry(2, 421461));
                    entries.add(new Entry(3, 461621));
                    entries.add(new Entry(4, 304734));
                    entries.add(new Entry(5, 345932));
                    entries.add(new Entry(6, 326370));
                    entries.add(new Entry(7, 353144));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 11월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();

                }
                else if ((choice_year1 + choice_month1).equals("2018년12월")) {
                    lineChart1 = (LineChart)findViewById(R.id.chart);

                    List<Entry> entries = new ArrayList<>();
                    entries.add(new Entry(1, 337989));
                    entries.add(new Entry(2, 305864));
                    entries.add(new Entry(3, 301298));
                    entries.add(new Entry(4, 448330));
                    entries.add(new Entry(5, 498805));
                    entries.add(new Entry(6, 439504));
                    entries.add(new Entry(7, 342163));


                    LineDataSet lineDataSet = new LineDataSet(entries, "2018년 12월 이용객 수 (1부터 7까지 차례대로 월요일부터 일요일)");
                    lineDataSet.setLineWidth(2);
                    lineDataSet.setCircleRadius(6);
                    lineDataSet.setCircleColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setCircleColorHole(Color.BLUE);
                    lineDataSet.setColor(Color.parseColor("#FFA1B4DC"));
                    lineDataSet.setDrawCircleHole(true);
                    lineDataSet.setDrawCircles(true);
                    lineDataSet.setDrawHorizontalHighlightIndicator(false);
                    lineDataSet.setDrawHighlightIndicators(false);
                    lineDataSet.setDrawValues(false);

                    LineData lineData = new LineData(lineDataSet);
                    lineChart1.setData(lineData);

                    XAxis xAxis = lineChart1.getXAxis();
                    xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
                    xAxis.setTextColor(Color.BLACK);
                    xAxis.enableGridDashedLine(12, 36, 0);

                    YAxis yLAxis = lineChart1.getAxisLeft();
                    yLAxis.setTextColor(Color.BLACK);

                    YAxis yRAxis = lineChart1.getAxisRight();
                    yRAxis.setDrawLabels(false);
                    yRAxis.setDrawAxisLine(false);
                    yRAxis.setDrawGridLines(false);

                    Description description = new Description();
                    description.setText("");

                    lineChart1.setDoubleTapToZoomEnabled(true);
                    lineChart1.setDrawGridBackground(true);
                    lineChart1.setDescription(description);
                    lineChart1.animateY(0, Easing.EasingOption.EaseInCubic);
                    lineChart1.invalidate();
                }
            }
        });

    }
}
