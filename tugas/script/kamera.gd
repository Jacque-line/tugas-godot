extends Camera2D

func _ready():
	# 1. Cari node peta lewat group "peta"
	var peta = get_tree().get_first_node_in_group("peta")
	if peta == null:
		print("Peta tidak ditemukan! Cek group 'peta' di level ini.")
		return

	# 2. Ambil data peta
	var area = peta.get_used_rect()            # area tile yang digambar (satuan tile)
	var ukuran_tile = peta.tile_set.tile_size  # ukuran 1 tile (piksel)
	var skala = peta.global_scale              # jika peta diperbesar/diperkecil (global_scale mencakup skala parent/LevelRoot)
	var posisi = peta.global_position          # posisi peta di dunia game

	# 3. Ubah ke piksel lalu pasang sebagai batas kamera
	limit_left   = int(posisi.x + area.position.x * ukuran_tile.x * skala.x)
	limit_top    = int(posisi.y + area.position.y * ukuran_tile.y * skala.y)
	limit_right  = int(posisi.x + area.end.x * ukuran_tile.x * skala.x)
	limit_bottom = int(posisi.y + area.end.y * ukuran_tile.y * skala.y)

	print("Batas kamera: ", limit_left, ", ", limit_top, ", ", limit_right, ", ", limit_bottom)
