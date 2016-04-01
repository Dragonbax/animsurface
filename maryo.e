note
	description: "[
					Our main character.
					Using animation with 4 states using 3 sub images
				]"
	author: "Louis Marchand"
	date: "Wed, 01 Apr 2015 18:46:46 +0000"
	revision: "2.0"

class
	MARYO

inherit
	GAME_LIBRARY_SHARED
		redefine
			default_create
		end

create
	default_create


feature {NONE} -- Initialization

default_create

			-- Initialization of `Current'
		local
			l_image:IMG_IMAGE_FILE
		do

			has_error := False
			create l_image.make ("bird.png")
			if l_image.is_openable then
				l_image.open

			else
				has_error := False

			end
		end






feature -- Access


	has_error:BOOLEAN
			-- Is an error happen when initializing the `surface'

	update(a_timestamp:NATURAL_32)
			-- Update the surface depending on the present `a_timestamp'.
			-- Each 100 ms, the image change; each 10ms `Current' is moving
		local
			l_coordinate:TUPLE[x,y:INTEGER]
			l_delta_time:NATURAL_32
		do
					if going_right then

						y := y + 5
					else

						y := y - 5
					end
					old_timestamp := old_timestamp + (l_delta_time // movement_delta) * movement_delta


		end

	go_left(a_timestamp:NATURAL_32)
			-- Make `Current' starting to move left
		do
			old_timestamp := a_timestamp
			going_left := True
		end

	go_right(a_timestamp:NATURAL_32)
			-- Make `Current' starting to move right
		do
			old_timestamp := a_timestamp
			going_right := True
		end




	going_left:BOOLEAN
			-- Is `Current' moving left

	going_right:BOOLEAN
			-- Is `Current' moving right

	x:INTEGER assign set_x
			-- Vertical position of `Current'

	y:INTEGER assign set_y
			-- Horizontal position of `Current'

	set_x(a_x:INTEGER)
			-- Assign the value of `x' with `a_x'
		do
			x := a_x
		ensure
			Is_Assign: x = a_x
		end

	set_y(a_y:INTEGER)
			-- Assign the value of `y' with `a_y'
		do
			y := a_y
		ensure
			Is_Assign: y = a_y
		end

	surface:GAME_SURFACE



feature {NONE} -- implementation
			-- Every coordinate of portion of images in `surface'

	old_timestamp:NATURAL_32
			-- When appen the last movement (considering `movement_delta')

feature {NONE} -- constants

	movement_delta:NATURAL_32 = 10
			-- The delta time between each movement of `Current'

	animation_delta:NATURAL_32 = 100
			-- The delta time between each animation of `Current'


end
