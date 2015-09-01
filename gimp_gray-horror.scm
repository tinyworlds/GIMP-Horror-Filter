; Script to apply a grayscale horror filter to images
; by Rick Hoppmann (www.tinyworlds.org)
; licensed under MIT License

(define (gray-horror image
					 drawable)

(let* ()

; Start an undo group so the image can be restored with one undo
(gimp-image-undo-group-start image)

; Make IMAGE grayscale
(gimp-image-convert-grayscale image)

; Apply noise to DRAWABLE
(plug-in-rgb-noise 0 image drawable 0 0 0 0 0 0)

; Finish the undo group for the process
(gimp-image-undo-group-end image)

; Display the updated image
(gimp-displays-flush)


))

(script-fu-register "gray-horror"
_"<Image>/tinyworlds/gray-horror"
                    "Grayscale Horror"
                    "Gives an image a grayscale horror effect."
                    "Rick Hoppmann <www.tinyworlds.org>"
                    "September the 1st, 2015"
                    ""
					SF-IMAGE		"Image"     0
          		    SF-DRAWABLE		"Drawable"  0
)
