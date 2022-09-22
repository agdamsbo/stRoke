# Logo creation

logo_path <- "/Users/au301842/Downloads/Logoer/DSC-logo.png"

hexSticker::sticker(logo_path, package="stRoke", 
                    p_size=10, s_x=1, s_y=.7, s_width=.6,
                    h_fill = "coral", # Fill color
                    h_color = "maroon", # Border color
                    dpi = 100,
                    filename="man/figures/hexlogo.png")
