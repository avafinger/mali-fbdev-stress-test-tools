# mali-fbdev-stress-test-tools
Mali framebuffer stress test tools and some experiments ( fbdev ) - RK3399 / H2+ / A64 - OpenGL ES2

    * yagears-fbdev
    * glmark2-2014.03-fbdev
    

# yagears-fbdev
yagears is a version of the popular gears OpenGL ES 2.0 demo ported to framebuffer (fbdev)

# glmark2-2014.03-fbdev
glmark2 is an OpenGL 2.0 and ES 2.0 benchmark ported to framebuffer (fbdev)

# Benchmark samples (for reference)

|  SBC Dev Board sample  |      NanoPi M4                |      OrangePi H6              |   BananaPi M2 Zero            |      NanoPi A64               |
|------------------------|-------------------------------|-------------------------------|-------------------------------|-------------------------------|
| kernel version         |      4.4.163                  |      3.10.65                  |      4.18.17                  |      4.4.111                  |
| cpu model              |      RK3399                   |      H6                       |      H2+                      |      A64                      |
| cpu % usage            |     ~92.1% (yagears-fbdev avg)|     ~91.6% (yagears-fbdev avg)|      %                        |      %                        |
| mali model             |      Mali-T860                |      Mali-T720                |      Mali-400                 |      Mali-400                 |
| mali gpu ver. (kernel) |Mali-T86x MP4 r2p0 0x0860      |Mali-T72x MP2 r1p1 0x0720      |    Mali-400 MP                |      TBC                      |
| yagears-fbdev          |60 FPS / 1920x1080 surface size|11 FPS / 1920x1080 surface size|46 FPS / 1920x1080 surface size|      NA                       |
| yagears-x11            |58 FPS / 1920x1080 surface size|      NA                       |      NA                       |      TBC                      |
| glmark2-2014.03-fbdev  |       55 (score) 1920x1080    |      10 (score) 1920x1080     |      43 (score) 1920x1080     |      TBC                      |
| glmark2-2014.03-x11    |       TBC                     |      NA                       |      NA                       |      NA                       |

ps: For some weird reason, the mali performance was poor on the OrangePi H6 Plus, i tried to increase CMA memory but that did not help.

# Running the tools on mali framebuffer setup

Before you run the tools you need to have a valid mali device running in framebuffer mode.

* yagears-fbdev (running on NanoPi M4 RK3399)

        sudo su
        export KEYBOARD=/dev/input/event2
        ./yagears-fbdev -b egl-fbdev -e glesv2
    
output:


        Gears demo: 60.00 fps
        OpenGL ES 3.2 v1.r14p0-01rel0-git(966ed26).8ddd46e6c6dd560a57bab225c837a596
        OpenGL ES GLSL ES 3.20
        EGL 1.4 (depth 24, red 8, green 8, blue 8, alpha 8)



You can use the keyboard to change the view and camera position


* glmark2-2014.03-fbdev

bionic (arm64)

	cd mali-fbdev-stress-test-tools/deb/arm64/bionic
	sudo dpkg -i glmark2-data_2014.03+git20150611.fa71af2d-0ubuntu5_all.deb
	sudo dpkg -i glmark2-es2-fbdev_2014.03+git20150611.fa71af2d-0ubuntu5_arm64.deb 



xenial (arm64)

	cd mali-fbdev-stress-test-tools/deb/arm64/xenial
	sudo dpkg -i glmark2-data_2014.03+git20150611.fa71af2d-0ubuntu5_all.deb
	sudo dpkg -i glmark2-es2-fbdev_2014.03+git20150611.fa71af2d-0ubuntu5_arm64.deb


xenial (armhf)

	cd mali-fbdev-stress-test-tools/deb/armhf/xenial
	sudo dpkg -i glmark2-data_2014.03+git20150611.fa71af2d-0ubuntu5_all.deb
	sudo dpkg -i glmark2-es2-fbdev_2014.03+git20150611.fa71af2d-0ubuntu5_armhf.deb


run:


        sudo glmark2-es2-fbdev 

        
output:


        =======================================================
            glmark2 2014.03+git20150611.fa71af2d
        =======================================================
            OpenGL Information
            GL_VENDOR:     ARM
            GL_RENDERER:   Mali-T860
            GL_VERSION:    OpenGL ES 3.2 v1.r14p0-01rel0-git(966ed26).8ddd46e6c6dd560a57bab225c837a596
        =======================================================
        [build] use-vbo=false: FPS: 60 FrameTime: 16.667 ms
        [build] use-vbo=true: FPS: 60 FrameTime: 16.667 ms
        [texture] texture-filter=nearest: FPS: 60 FrameTime: 16.667 ms
        [texture] texture-filter=linear: FPS: 60 FrameTime: 16.667 ms
        [texture] texture-filter=mipmap: FPS: 60 FrameTime: 16.667 ms
        [shading] shading=gouraud: FPS: 60 FrameTime: 16.667 ms
        [shading] shading=blinn-phong-inf: FPS: 60 FrameTime: 16.667 ms
        [shading] shading=phong: FPS: 60 FrameTime: 16.667 ms
        [shading] shading=cel: FPS: 60 FrameTime: 16.667 ms
        [bump] bump-render=high-poly: FPS: 59 FrameTime: 16.949 ms
        [bump] bump-render=normals: FPS: 60 FrameTime: 16.667 ms
        [bump] bump-render=height: FPS: 60 FrameTime: 16.667 ms
        [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 60 FrameTime: 16.667 ms
        [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 35 FrameTime: 28.571 ms
        [pulsar] light=false:quads=5:texture=false: FPS: 60 FrameTime: 16.667 ms
        [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 58 FrameTime: 17.241 ms
        [desktop] effect=shadow:windows=4: FPS: 60 FrameTime: 16.667 ms
        [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 29 FrameTime: 34.483 ms
        [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 29 FrameTime: 34.483 ms
        [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 49 FrameTime: 20.408 ms
        [ideas] speed=duration: FPS: 59 FrameTime: 16.949 ms
        [jellyfish] <default>: FPS: 60 FrameTime: 16.667 ms
        [terrain] <default>: FPS: 19 FrameTime: 52.632 ms
        [shadow] <default>: FPS: 59 FrameTime: 16.949 ms
        [refract] <default>: FPS: 56 FrameTime: 17.857 ms
        [conditionals] fragment-steps=0:vertex-steps=0: FPS: 60 FrameTime: 16.667 ms
        [conditionals] fragment-steps=5:vertex-steps=0: FPS: 60 FrameTime: 16.667 ms
        [conditionals] fragment-steps=0:vertex-steps=5: FPS: 60 FrameTime: 16.667 ms
        [function] fragment-complexity=low:fragment-steps=5: FPS: 60 FrameTime: 16.667 ms
        [function] fragment-complexity=medium:fragment-steps=5: FPS: 59 FrameTime: 16.949 ms
        [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 59 FrameTime: 16.949 ms
        [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 60 FrameTime: 16.667 ms
        [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 59 FrameTime: 16.949 ms
        =======================================================
                                          glmark2 Score: 55 
        =======================================================



# Building from source

Build instructions are provided for Ubuntu 18.04 (bionic) / Ubuntu 16.04 (xenial) and *arm64* and *armhf*

Please install all the dependencies first and then run in shell:



	cd mali-fbdev-stress-test-tools/src/glmark2-2014.03-fbdev
	sudo dpkg-buildpackage -uc -us


the packages will be built in /arm/temp/temp/mali-fbdev-stress-test-tools/src

# Credits

