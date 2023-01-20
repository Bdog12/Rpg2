extends Node2D





#Update the color of the markers 
func UpdateMap():
	for _Makers in self.get_children():
		print(_Makers)
		_Makers.setColor()

