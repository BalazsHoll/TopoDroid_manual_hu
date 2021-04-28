;Eamples: https://forums.autodesk.com/t5/visual-lisp-autolisp-and-general/hex-utilities/td-p/904865
;(decimaltobase 16 32) returns "20"
;(basetodecimal 16 "20") returns 32

(defun baseToDecimal (base val / pos power result tmp)
(setq pos (1+ (strlen val))
power -1
result 0
val (strcase val)
)
(while (> (setq pos (1- pos)) 0)
(setq result
(+
result
(* (if (> (setq tmp (ascii (substr val pos 1))) 64)
(- tmp 55)
(- tmp 48)
)
(expt base (setq power (1+ power)))
)
)
)
)
result
)

(defun decimalToBase (base val / result tmp result1)
(setq result "")
(if (< val base) (setq result1 "0")(setq result1 ""));ff form
(if (= val 0) (setq result "00" result1 ""))
(while (> val 0)
  (setq result (strcat (if (> (setq tmp (rem val base)) 9)
                           (chr (+ tmp 55))
                           (itoa tmp)
                       )
                 result
               )
       val (fix (/ val base))
  )
)
(setq result (strcat result1 result))
result
)


(defun svgshp1 (fn dir1)
  (progn
    (print fn)
    (print "ide1")
    (setq fn1 (VL-FILENAME-BASE fn))
    (print fn1)
    (setq fp (open (strcat dir1 "\\" fn1) "r"))
    (while (setq data (read-line fp))				;-Loop until the end of file Read the next data line
      (progn
	(setq data (vl-string-trim " " data))			; remove any spaces from both ends
	(while (/= data (setq data (vl-string-subst " " "  " data))));remove duble space
	(setq data1 (read (strcat "(" data ")")))
	 ;(princ data1)

	  (if (= (car data1) 'ADDCIRCLE );"addCircle X Y R"
	    (progn
	      (print "circle")
	    )
	  )
	

      )
    )
    (close fp)
  )
)


(defun svgshp (fn dir1)
  (progn
    (setq crd 1.5)   ;color reduction white background
    (setq erra "")
    (setq pt1 (list 0 0))
    (setq xmax 0)
    (setq dd 0)
    (setq dn 0)
    (setq fn1 (VL-FILENAME-BASE fn))
    (setq fp (open (strcat dir1 "\\" fn1) "r"))
    (setq ferr0 (open (strcat dir1 "\\error.txt") "a"))
    (while (setq data (read-line fp))                 		;-Loop until the end of file Read the next data line
      (progn						 
	(setq data (vl-string-trim " " data))			; remove any spaces from both ends
	(while (/= data (setq data (vl-string-subst " " "  " data))));remove duble space
	(setq data1 (read (strcat "(" data ")")))
	;(print data1)
	(if (= (car data1) 'SYMBOL );"symbol line"
	    (progn
	      (mapcar 'set '(pd pm) data1)

	      (if (= pm 'AUDIO );audio extra point
		(setq pm 'POINT)
	      )

	      (if (= pm 'POINT )
		(progn
	          (setq fo2 (open (strcat dir1 "\\" "P_" fn1 ".svg") "w"))
                  (setq fo (open (strcat dir1 "\\" "P_" fn1 ".shp") "w"))
		)
              )
	      (if (= pm 'LINE )
		(progn
	          (setq fo2 (open (strcat dir1 "\\" "L_" fn1 ".svg") "w"))
                  (setq fo (open (strcat dir1 "\\" "L_" fn1 ".shp") "w"))
		)
              )
	      (if (= pm 'AREA )
		(progn
	          ;(setq fo (open (strcat dir1 "\\" "A_" fn1 ".xpm") "w"))
                  ;(princ "/* XPM */" fo)(princ "\n" fo)
                  ;(princ "static char * XFACE[] = {" fo)(princ "\n" fo)
		)
              )
	      (setq svgl "")
	      (setq shpl "")
	      (setq shpn 0)
	      (setq shpln 0)
	      ;(princ " ")
	    )
	  )
	(if (= (car data1) 'NAME );"name water-flow-intermittent"
	    (progn
	      (mapcar 'set '(pd pn) data1)
	      ;(if (= pm 'LINE )
	        ;(princ data1)
              ;)
	    )
	  )
	(if (= (car data1) 'BITMAP );bitmap 40 30
	    (progn
	      (setq fo (open (strcat dir1 "\\" "A_" fn1 ".xpm") "w"))
              (princ "/* XPM */" fo)(princ "\n" fo)
              (princ "static char * XFACE[] = {" fo)(princ "\n" fo)

	      (mapcar 'set '(pd bx by) data1)
	      (princ (strcat "\"" (rtos bx 2 0) " " (rtos by 2 0) " 2 1\"") fo)
	      (princ "," fo)(princ "\n" fo)
	      (princ (strcat "\"1 c #" color0 "\"") fo)
	      (princ "," fo)(princ "\n" fo)
              (princ (strcat "\"0 c #" color2 "\"") fo)
	      (while (/= (setq data (read-line fp)) "endbitmap")
		(progn
                  (setq data (vl-string-trim " " data))
		  (princ "," fo)(princ "\n" fo)
		  (princ (strcat "\"" data "\"") fo)
		)		
              )
	      (princ "\n" fo)
              (princ "};" fo)
              (princ "\n" fo)
              (close fo)
	    )
	  )
	(if (= (car data1) 'DASH );"dash 17 15"
	    (progn
	      (mapcar 'set '(pd dd dn) data1)
	      ;(if (= pm 'LINE )
	        ;(princ data1)
              ;)
	    )
	  )
	(if (= (car data1) 'COLOR );"color 0xffcc00 0xff"
	    (progn
	      (mapcar 'set '(pd color ca) data1)
	      (setq color0 (substr (vl-princ-to-string color) 3 6))
	      (setq cr (fix (/ (basetodecimal 16 (substr color0 1 2)) crd)) )
	      (setq cg (fix (/ (basetodecimal 16 (substr color0 3 2)) crd)) )
	      (setq cb (fix (/ (basetodecimal 16 (substr color0 5 2)) crd)) )
	      (setq color1 (strcat (decimaltobase 16 cr) (decimaltobase 16 cg) (decimaltobase 16 cb)))
	      
	      (if (= pm 'AREA )
		(progn
                  ;(princ (strcat "\"1 c #" color1 "\"") fo)
		  ;(princ "," fo)(princ "\n" fo)
		  (setq bkg 3)
		  (setq cr (fix (/ (basetodecimal 16 (substr color0 1 2)) bkg)) )
		  (setq cg (fix (/ (basetodecimal 16 (substr color0 3 2)) bkg)) )
		  (setq cb (fix (/ (basetodecimal 16 (substr color0 5 2)) bkg)) )
		  (setq color2 (strcat (decimaltobase 16 cr) (decimaltobase 16 cg) (decimaltobase 16 cb)))
		  ;(princ (strcat "\"0 c #" color2 "\"") fo)
		)
	      )
	      ;(if (= pm 'POINT )
	       	;(mapcar 'set '(pd color) data1)
	        ;(mapcar 'set '(pd color colora) data1)
		;(set colora (substr
	      ;)
	      ;(princ color)
	    )
	  )
	(if (= (car data1) 'MOVETO );"moveTo X Y"
	    (progn
	      (mapcar 'set '(pd px py) data1)
 	      (if (> px xmax) (setq xmax px))
	      (setq pxo (car pt1))
	      (setq pyo (cadr pt1))
	      (setq svgl (strcat svgl "M " (rtos px 2 2) "," (rtos py 2 2) " " ))
	      (setq shpl (strcat shpl "2,8,(" (rtos (- px pxo) 2 0) "," (rtos (- (- py) pyo) 2 0) ")," ))
	      (setq shpn (+ shpn 4))
	      (setq shpln (+ shpln 12))
	      (setq pt1 (list px (- py)))
	      (setq pdo pd)
	    )
	  )
	(if (= (car data1) 'LINETO );"lineTo X Y"
	    (progn
	      (mapcar 'set '(pd px py) data1)
 	      (if (> px xmax) (setq xmax px))
	      (setq pt2 (list px (- py)))
	      (command "_line" pt1 pt2 "")
              (setq pxo (car pt1))
	      (setq pyo (cadr pt1))
	      (if (= pdo 'LINETO )
		(progn
	          (setq svgl (strcat svgl (rtos px 2 2) "," (rtos py 2 2) " " ))
	          (setq shpl (strcat shpl "8,(" (rtos (- px pxo) 2 0) "," (rtos (- (- py) pyo) 2 0) ")," ))
	          (setq shpn (+ shpn 3))
		  (setq shpln (+ shpln 12))
		)
		(progn
	          (setq svgl (strcat svgl "L " (rtos px 2 2) "," (rtos py 2 2) " " ))
	          (setq shpl (strcat shpl "1,8,(" (rtos (- px pxo) 2 0) "," (rtos (- (- py) pyo) 2 0) ")," ))
	          (setq shpn (+ shpn 4))
		  (setq shpln (+ shpln 12))
		)
	      )
	      (if (> shpln 100)
		(progn
		  (setq shpl (strcat shpl "\n" ))
		  (setq shpln 0)
		)
	      )
	      (setq pdo pd)
	      (setq pt1 pt2)
	    )
	  )
	(if (= (car data1) 'ADDCIRCLE );"addCircle X Y R"
	    (progn
	      (mapcar 'set '(pd px py r) data1)
	      (setq pt1 (list px (- py)) )
	      (command "_circle" pt1 r )

              (setq svgl (strcat svgl "M " (rtos (- px r) 2 2) "," (rtos py 2 2) " " ))
              (setq svgl (strcat svgl "A " (rtos r 2 2) "," (rtos r 2 2) " 0 1 1 " (rtos (+ px r) 2 2) "," (rtos py 2 2) " " ))	      
              (setq svgl (strcat svgl "A " (rtos r 2 2) "," (rtos r 2 2) " 0 1 1 " (rtos (- px r) 2 2) "," (rtos py 2 2) " " ))	      
	      ; A rx ry x-axis-rotation large-arc-flag sweep-flag x y
	    )
	  )
	
	(if (= (car data1) 'CUBICTO ); "cubicTo X1 Y1 X2 Y2 X Y"
	    (progn
	      (mapcar 'set '(pd px1 py1 px2 py2 px py) data1)
	      (setq pt2 (list px1 (- py1)) )
	      (setq pt3 (list px2 (- py2)) );(princ pt3)
	      (setq pt4 (list px (- py)) );(princ pt4)
	      (command "_pline" pt1 pt2 pt3 pt4 "")
	      (command "_pedit" "_last" "_spline" "_exit")
              (setq pxo (car pt1))
	      (setq pyo (cadr pt1))
	      (if (= pdo 'CUBICTO )
		(progn
	          (setq svgl (strcat svgl (rtos px1 2 2) "," (rtos py1 2 2) " " (rtos px2 2 2) "," (rtos py2 2 2) " " (rtos px 2 2) "," (rtos py 2 2) " " ))
	          ;(setq shpl (strcat shpl "8,(" (rtos (- px pxo) 2 0) "," (rtos (- (- py) pyo) 2 0) ")," ))
	          ;(setq shpn (+ shpn 4))
		  ;(setq shpln (+ shpln 12))
		)
		(progn
	          (setq svgl (strcat svgl "C " (rtos px1 2 2) "," (rtos py1 2 2) " " (rtos px2 2 2) "," (rtos py2 2 2) " " (rtos px 2 2) "," (rtos py 2 2) " " ))
	          ;(setq shpl (strcat shpl "1,8,(" (rtos (- px pxo) 2 0) "," (rtos (- (- py) pyo) 2 0) ")," ))
	          ;(setq shpn (+ shpn 3))
		  ;(setq shpln (+ shpln 12))
		)
	      )
	      (setq pdo pd)
	      (setq pt1 pt4)
	    )
	  )
	(if (= (car data1) 'ARCTO ); "arcTo X1 Y1 X2 Y2 A0 DA"
	    (progn
	      (mapcar 'set '(pd px1 py1 px2 py2 pa0 pda) data1)
	      (setq pt2 (list (/ (+ px1 px2) 2) (/(+ py1 py2) 2)) );(princ pt2)
	      (setq rx (/ (- px2 px1) 2) );(princ rx)
	      (setq ry (/ (- py2 py1) 2) );(princ ry)
	      (command "_ellipse" "_a" "_c" pt2 (strcat "@" (rtos rx 2 2) ",0") (strcat "@0," (rtos rx 2 2)) (-(+ pa0 pda)) (- pa0) )
	      (setq erra (print "arcto" ferr0))
	      (print fn1 ferr0)
	    )
	  )
        ;(princ data1)
	;(princ pt1)
	;(princ "\n\r")
      )
    )
    
    (if (= pm 'AREA )
      (progn
        ;(princ "\n" fo)
        ;(princ "};" fo)
        ;(princ "\n" fo)
        ;(close fo)
      )
      (progn
        ;SVG export
        (princ "<svg>" fo2)(princ "\n" fo2)
        ;(princ "  <metadata id=\"1\">" fo2)(princ "\n" fo2)
        ;(princ "  </metadata>" fo2)(princ "\n" fo2)
        (if (= pm 'POINT )
          (progn
            (princ "  <g style=\"overflow:hidden;fill:none;stroke:#" fo2)
            (princ color1 fo2)
            (princ ";stroke-width:1\" id=\"2\" >" fo2)(princ "\n" fo2)
          )
          (progn
            (princ "  <g style=\"overflow:hidden;fill:#" fo2)
	    (princ color1 fo2)
            (princ ";stroke:#" fo2)
            (princ color1 fo2)
            (princ ";stroke-width:0\" id=\"2\" >" fo2)(princ "\n" fo2)
          )
        )
        (princ "    <g id=\"3\">" fo2)(princ "\n" fo2)
        (princ "		 <path d=\"" fo2)
        (princ svgl fo2)
        (princ "\" id=\"4\" />" fo2)(princ "\n" fo2)
        (princ "    </g>" fo2)(princ "\n" fo2)
        (princ "  </g>" fo2)(princ "\n" fo2)
        (princ "</svg>" fo2)(princ "\n" fo2)
        (close fo2)

        ;DWG SHP export
        (setq shpl (strcat shpl "0" ))
        (setq shpn (+ shpn 1))
        (setq shpl0 (strcat "*1," (rtos shpn 2 0) "," ) )
        (princ shpl0 fo)
        (princ pn fo)
        (princ "\n" fo)
        (princ shpl fo)
        (princ "\n" fo)
        (close fo)
        (close fp)
        (if (= pm 'LINE ) (command "_compile" (strcat dir1 "\\" "L_" fn1 ".shp"))
                      (command "_compile" (strcat dir1 "\\" "P_" fn1 ".shp"))
          )
        (if (= pm 'LINE )
          (if (= xmax 0) 
            (if (> dd 0)
              (progn
                (setq fo (open (strcat dir1 "\\" "TDline.lin") "a"))
	        (princ "*L_" fo)
        	(princ pn fo)
	        (princ "," fo)
	        (princ pn fo)
	        (princ "\n" fo)
	        (princ "A," fo)
	        (princ dd fo)
	        (princ ",-" fo)
	        (princ dn fo)	
	        (princ "\n" fo)
	        (close fo)
              )
	    )
            (if (= dd 0)
              (progn
                (setq fo (open (strcat dir1 "\\" "TDline.lin") "a"))
	        (princ "*L_" fo)
	        (princ pn fo)
	        (princ "," fo)
	        (princ pn fo)
	        (princ "\n" fo)
	        (princ "A,.000" fo)
	        (princ (rtos xmax 2 0) fo)
	        (princ ",[" fo)
	        (princ pn fo)
	        (princ "," fo)
	        (princ (strcat dir1 "\\" "L_" fn1) fo)
	        (princ ",s=1],-" fo)
	        (princ xmax fo)	
	        (princ "\n" fo)
	        (close fo)
              )
              (progn
                (setq fo (open (strcat dir1 "\\" "TDline.lin") "a"))
	        (princ "*L_" fo)
	        (princ pn fo)
	        (princ "," fo)
	        (princ pn fo)
	        (princ "\n" fo)
	        (princ "A,.000" fo)
	        (princ (rtos (+ dd dn) 2 0) fo)
	        (princ ",[" fo)
	        (princ pn fo)
	        (princ "," fo)
	        (princ (strcat dir1 "\\" "L_" fn1) fo)
	        (princ ",s=1],-" fo)
	        (princ (+ dd dn) fo)	
	        (princ "\n" fo)
	        (close fo)
              );progn
	    );if dd
          );if xmax
        );if line
      );progn
    );if area
    
  )
  (close ferr0)
  (print erra)
 )



(defun c:TDl()
  (setvar "blipmode" 0)
  (setvar "cmdecho" 0)
  (progn
    (setq fn (getfiled "SYMBOL FILES" "" "" (+ 2 4))) ;"E:\\TopoDroid_teljes\\DXF\\Sym\\line0\\abyss-entrance"
    (setq dir1 (VL-FILENAME-DIRECTORY fn));"E:\\TopoDroid_teljes\\DXF\\Sym\\line0" 
    ;(print fn)
    (svgshp1 fn dir1)
    
    (setq fn1 (VL-FILENAME-BASE fn));"abyss-entrance"
    ;(print fn1)
    
    (print dir1)
    ;(getpoint)

    (setq dirlist (cddr (vl-directory-files dir1 "*.")))
    ;(setq dirlists (prin1 dirlist))
    ;(foreach n 'dirlists (svgshp (strcat dir1 "\\" n)))    
    ;(foreach n dirlists (prin1 (strcat dir1 "\\" n)))
    
    (foreach n dirlist (print (vl-princ-to-string (strcat dir1 "\\" n))))
    (foreach n dirlist (svgshp (vl-princ-to-string (strcat dir1 "\\" n)) dir1 ))
    
    ;(setq ext1 (VL-FILENAME-EXTENSION fn))
  )
  (setvar "blipmode" 1)
  (setvar "cmdecho" 1)
  (princ)
)


