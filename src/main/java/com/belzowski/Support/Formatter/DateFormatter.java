package com.belzowski.Support.Formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import static java.lang.System.out;

public class DateFormatter {

    private String date;
    private String pattern;
    private Calendar calendar;

    public DateFormatter(String date, String pattern){
        this.date = date;
        this.pattern = pattern;
        calendar = Calendar.getInstance();
    }

    public DateFormatter(Calendar calendar, String pattern){
        this.calendar = calendar;
        this.pattern = pattern;
    }

    public DateFormatter(String pattern){
        this.pattern = pattern;
        calendar = Calendar.getInstance();
    }

    public Calendar stringToCalendar(){

        SimpleDateFormat format = new SimpleDateFormat(pattern);

        try {
            calendar.setTime(format.parse(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }


        return calendar;
    }

    public Calendar dateToCalendar(){

        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date date = new Date();
        String tmp = format.format(date);

        try {
            calendar.setTime(format.parse(tmp));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return calendar;

    }

    public String calendarToString(){
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return  format.format(calendar.getTime());
    }

}
