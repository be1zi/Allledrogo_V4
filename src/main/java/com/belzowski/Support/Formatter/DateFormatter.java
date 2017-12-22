package com.belzowski.Support.Formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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

        this.date = tmp;
        return this.stringToCalendar();
    }

    public String calendarToString(){
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return  format.format(calendar.getTime());
    }

}
