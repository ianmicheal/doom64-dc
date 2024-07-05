(define (doom64-tile-crop filename palname iw ih tileno w h ox oy)
(let* ((image (car (gimp-file-load 1 filename filename)))
       (drawable (car (gimp-image-get-active-layer image))))
    (gimp-context-set-background (car (gimp-palette-entry-get-color palname 0)))
    (gimp-image-resize image iw ih 0 0)
	(gimp-layer-resize (car (gimp-image-get-active-layer image)) iw ih 0 0)
	(set! drawable (car (gimp-image-get-active-layer image)))
	(gimp-file-save 1 image drawable filename filename)
	(file-raw-save2 1 image drawable (morph-filename filename "raw") (morph-filename filename "raw") 6 0)
))
