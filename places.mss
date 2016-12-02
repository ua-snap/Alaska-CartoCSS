/* Stylesheet for only showing place labels. */


Map {
  background-color: #00000000;
  buffer-size: 128;
}

/* set up font sets for various weights and styles */
@sans_lt:       "Noto Sans Regular",
		"Noto Sans Canadian Aboriginal Regular",
		"DejaVu Sans Book",
                "Unifont Medium", "unifont Medium";

@sans_lt_italic:    "Noto Sans Italic", "Noto Sans Canadian Aboriginal Regular", "DejaVu Sans Book",
                "Unifont Medium", "unifont Medium";
@sans:              "Noto Sans Regular", "Noto Sans Canadian Aboriginal Regular", "DejaVu Sans Book",
                "Unifont Medium", "unifont Medium";
@sans_italic:       "Noto Sans Italic", "Noto Sans Canadian Aboriginal Regular", "DejaVu Sans Oblique", "DejaVu Sans Book",
                "Unifont Medium", "unifont Medium";
@sans_bold:         "Noto Sans Bold", "Noto Sans Canadian Aboriginal Regular", "DejaVu Sans Bold", "DejaVu Sans Book",
                "Unifont Medium", "unifont Medium";
@sans_bold_italic:  "Noto Sans Bold Italic", "Noto Sans Canadian Aboriginal Regular", "DejaVu Sans" "DejaVu Sans Book",
                "Unifont Medium", "unifont Medium";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 2;

@place_halo:        fadeout(#fff,34%);

@country_text:      #435;
@country_halo:      @place_halo;

@capital_text:      @country_text;
@capital_halo:      @country_halo;

@state_text:        #a6a6aa;
@state_halo:        @place_halo;

@city_text:         #222;
@city_halo:         @place_halo;

@town_text:         #444;
@town_halo:         @place_halo;

@poi_text:          #537076;
@poi_text2:         #868E90;
@poi_halo:          @place_halo;

@road_text:         #525252;
@road_halo:         rgba(255,255,255,0.8);

@housenumber_text:  #797979;

@other_text:        #888;
@other_halo:        @place_halo;

@locality_text:     #aaa;
@locality_halo:     @place_halo;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888;
@village_halo:      @place_halo;



/* ---- Cities and Towns ----------------------------------------------- */

#low_place[is_capital='country'][zoom>=4][zoom<=10],
#low_place[type='city'][zoom>=4][zoom<=10],
#low_place[type='town'][zoom>=4][zoom<=10] {
  shield-file: url('icons/place/town.png');
  [type='city'] {
    shield-file: url('icons/place/city.png');
  }
  [is_capital='country'] {
    shield-file: url('icons/place/country_capital.png');
  }
  shield-name:'[name]';
  shield-size: 9+@text_adjust;
  shield-face-name: @sans;
  shield-halo-radius: 1;
  shield-wrap-width: 50;
  shield-fill: @town_text;
  shield-halo-fill: @town_halo;
  shield-placement-type: simple;
  shield-placements: 'NE,SW,NW,SE,E,W';
  shield-text-dy: 3;
  shield-text-dx: 3;
  shield-unlock-image: true;
  shield-min-distance: 10;
  [type='city'] {
    shield-fill: @city_text;
    shield-halo-fill: @city_halo;
    shield-size: 10+@text_adjust;
  }
  [is_capital='country'] {
    shield-face-name: @sans_bold;
    shield-fill: @capital_text;
    shield-halo-fill: @capital_halo;
    shield-size: 11+@text_adjust;
    shield-line-spacing: -2;
    shield-text-dx: 4;
  }
  [zoom>=10] {
    shield-halo-radius: 2;
    shield-size: 10+@text_adjust;
    [type='city'] { shield-size: 11+@text_adjust;}
    [is_capital='country'] { shield-size: 11+@text_adjust;}
  }
}

#place[type='city'][zoom>=11][zoom<=15],
#place[type='town'][zoom>=11][zoom<=17] {
  text-name:'[name]';
  text-size: 11+@text_adjust;
  text-face-name: @sans;
  text-halo-radius: 2;
  text-wrap-width: 50;
  text-fill: @town_text;
  text-halo-fill: @town_halo;
  text-character-spacing: -1;
  [type='city'] {
    text-fill: @city_text;
    text-halo-fill: @city_halo;
    text-size: 12+@text_adjust;
  }
  [is_capital='country'] {
    text-face-name: @sans_bold;
    text-fill: @capital_text;
    text-halo-fill: @capital_halo;
    text-line-spacing: -2;
    text-transform: uppercase;
  }
  [zoom>=12] {
    text-size: 12+@text_adjust;
    [type='city'],
    [is_capital='country'] { text-size: 13+@text_adjust;}
  }
  [zoom>=13] {
    text-transform: uppercase;
    text-character-spacing: 0;
    [type='city'],
    [is_capital='country'] { text-size: 14+@text_adjust;}
  }
  [zoom>=14]{
    text-size:13+@text_adjust;
    text-character-spacing: 1;
    [type='city'],
    [is_capital='country'] { text-size: 15+@text_adjust;}
  }
  [zoom>=15]{
    text-size:14+ @text_adjust;
    text-character-spacing: 2;
    [type='city'],
    [is_capital='country'] { text-size: 16+@text_adjust;}
  }
  [zoom>=16]{
    text-size:15+@text_adjust;
    text-line-spacing: 5+@text_adjust;
  }
  [zoom>=17]{
    text-size:16+@text_adjust;
    text-line-spacing: 6+@text_adjust;
  }
}



/* ---- Other small places ------------------------------------------ */

#place::small[type='village'][zoom>=5][zoom<=20],
#place::small[type='suburb'][zoom>=6][zoom<=20],
#place::small[type='hamlet'][zoom>=6][zoom<=20],
#place::small[type='neighbourhood'][zoom>=13][zoom<=20] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:10+@text_adjust;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-min-distance: 100;
  text-label-position-tolerance: 10;
  [zoom>=13] {
    text-min-distance: 50;
  }
  [zoom>=14] {
    text-size:11+@text_adjust;
    text-character-spacing: 0;
    text-wrap-width: 40;
    text-line-spacing: 1;
  }
  [zoom>=15] {
    text-halo-radius: 2;
    text-transform: uppercase;
    text-character-spacing: 0;
    text-wrap-width: 60;
    text-line-spacing: 1;
    text-min-distance: 30;
  }
  [zoom>=16] {
    text-size:12+@text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 120;
    text-line-spacing: 2;
    text-min-distance: 10;
  }
  [zoom>=17] {
    text-size:13+@text_adjust;
    text-character-spacing: 2;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=18] {
    text-size:14+@text_adjust;
    text-character-spacing: 3;
    text-line-spacing: 6;
  }
}

#place::small[type='locality'][zoom>=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-size:9+@text_adjust;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=16] {
    text-size:10+@text_adjust;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size:11+@text_adjust;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:12+@text_adjust;
    text-character-spacing: 0;
    text-line-spacing: 4;
  }
}


