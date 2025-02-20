;nyquist plug-in 
;version 4 
;type process 
;name "Paulstretch..." 
;author Mikołaj Grodoń
;copyright "Released under terms of the GNU General Public License version 2 or later"

;debugbutton true
;debugflags trace


;control delay "Time resolution" float "seconds" 0.1 0.1 1
;control count "Stretching factor" int "times" 5 1 200


(defun delays (sig delay count)
 (if (= count 0)
 (cue sig)
 (sim (cue sig)
  (at delay (delays sig delay (- count 1))))))

(delays *track* delay count)