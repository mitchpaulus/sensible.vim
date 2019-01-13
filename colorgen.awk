BEGIN {
    HUE[1] = 0   # Red
    HUE[2] = 100 # Green
    HUE[3] = 50  # Yellow
    HUE[4] = 200 # Blue
    HUE[5] = 300 # Magenta
    HUE[6] = 150 # Cyan

    SAT=80
    VAL=80  

    for (i = 1; i < 7; i++) {
        hsv2rgb(HUE[i], SAT/100.0, VAL/100.0, arr)
        printf("color%d  #%s%s%s\n", i, dec2hex(to256(arr[0])) , dec2hex(to256(arr[1])) , dec2hex(to256(arr[2])) )
    }

    SAT=100
    VAL=100
    for (i = 1; i < 7; i++) {
        hsv2rgb(HUE[i], SAT/100.0, VAL/100.0, arr)
        printf("color%d  #%s%s%s\n", i + 8, dec2hex(to256(arr[0])) , dec2hex(to256(arr[1])) , dec2hex(to256(arr[2])) )
    }

    #hsv2rgb(0.0, SAT/100.0, VAL/100.0, arr)

    #print to256(arr[0])
    #print to256(arr[1])
    #print to256(arr[2])

    #printf("r:%f, g:%f, b:%f", arr[0], arr[1], arr[2]); 
}

function dec2hex(n, firstChar) {
    firstChar = int2hexchar(int(n / 16))
    return firstChar int2hexchar(n % 16)
}

function int2hexchar(i) {
    if (i < 10) {
        return "" i
    }
    else if (i == 10) {
        return "A"
    }
    else if (i == 11) {
        return "B"
    }
    else if (i == 12) {
        return "C"
    }
    else if (i == 13) {
        return "D"
    }
    else if (i == 14) {
        return "E"
    }
    else if (i == 15) {
        return "F"
    }
}

function to256(n) {
    if (n == 1) {
        return 255
    }
    return round(n*255)
}

function round(x,   ival, aval, fraction)
{
   ival = int(x)    # integer part, int() truncates

   # see if fractional part
   if (ival == x)   # no fraction
      return ival   # ensure no decimals

   if (x < 0) {
      aval = -x     # absolute value
      ival = int(aval)
      fraction = aval - ival
      if (fraction >= .5)
         return int(x) - 1   # -2.5 --> -3
      else
         return int(x)       # -2.3 --> -2
   } else {
      fraction = x - ival
      if (fraction >= .5)
         return ival + 1
      else
         return ival
   }
}

# h = hue (0-360), s = saturation (0-1), v = value (0-1)
function hsv2rgb(h,s,v, arr) {
    # RGB array.
    arr[0] = colorfunc(5, h, s, v)
    arr[1] = colorfunc(3, h, s, v)
    arr[2] = colorfunc(1, h, s, v)
}

function colorfunc(n, h, s, v,    k, firstarg) {
    k = kfunc(n, h)
    firstarg=min(min(k, 4.0-k), 1.0)
    return v - v*s*max(firstarg, 0)
}

function kfunc(n, h) {
    return (n + (h/60.0)) % 6.0 
}

function max(a, b) {
    if (a > b) { return a }
    else { return b }
}

function min(a, b) {
    if (a < b) { return a }
    else { return b }
}
