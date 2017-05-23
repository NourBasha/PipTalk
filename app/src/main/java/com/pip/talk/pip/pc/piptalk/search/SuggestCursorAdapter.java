package com.pip.talk.pip.pc.piptalk.search;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Typeface;
import android.support.v4.graphics.drawable.RoundedBitmapDrawable;
import android.support.v4.graphics.drawable.RoundedBitmapDrawableFactory;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.pip.talk.pip.pc.piptalk.R;

import java.util.ArrayList;

public class SuggestCursorAdapter extends android.support.v4.widget.CursorAdapter {
    private ArrayList<String> items = new ArrayList<String>();
    String username ="";

    public SuggestCursorAdapter(Context context, Cursor cursor, ArrayList items) {
        super(context, cursor, false);
        this.items = items;
    }

    public void changeData(ArrayList<String> array){

        items = array;
        notifyDataSetChanged();
    }

    @Override
    public void changeCursor(Cursor cursor) {
        super.changeCursor(cursor);
    }

    @Override
    public int getCount() {
        return items.size();
    }


    @Override
    public void bindView(View view, Context context, Cursor cursor) {
        ViewHolder holder = (ViewHolder) view.getTag();
        Log.e("TT","cursor position >> "+cursor.getPosition());


        username = items.get(cursor.getPosition()).toString();
        if(username.length()>17){
            holder.textView.setText(username.substring(0,16)+"...");
        }else {
            holder.textView.setText(username);
        }


            Typeface ralewayName = Typeface.createFromAsset(mContext.getAssets(),"Raleway-Bold.ttf");
            holder.textView.setTypeface(ralewayName);

            Bitmap bm = BitmapFactory.decodeResource(mContext.getResources(), R.drawable.unknown_male);
            Bitmap resized = Bitmap.createScaledBitmap(bm,(int)(bm.getWidth()*0.1), (int)(bm.getHeight()*0.1), true);
            RoundedBitmapDrawable drawable = RoundedBitmapDrawableFactory.create(mContext.getResources(),resized);
            drawable.setCircular(true);
            holder.imageView.setImageDrawable(drawable);





    }

    public class ViewHolder {
        public TextView textView;
        public ImageView imageView;
    }

    @Override
    public View newView(Context context, Cursor cursor, ViewGroup parent) {
        ViewHolder holder = new ViewHolder();
        View v = null;

        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        v = inflater.inflate(R.layout.search_result_item, parent, false);
        holder.textView = (TextView) v.findViewById(R.id.foundContactName);
        holder.imageView = (ImageView)v.findViewById(R.id.foundContactImage);

        v.setTag(holder);
        return v;

    }


}
