;This BB file is actually defining the weapons and all their functions. You can easily add your own weapon by first putting it as a new type variable into
;the "InitGuns" function. After this, you need to update your gun using the "UpdateGuns" function. If you still not know how to add a new gun into the game,
;then write me a PM at the UnderTowGames Forum (my username on this forum: PXLSHN). But if you really wanna add a new weapon into that game, then you should
;try it out first by yourself (just using the code inside the "InitGuns" and "UpdateGuns" functions as a template.
;BTW: You need to let the worldmodel load by creating a item that is the gun, so it can be held in the inventory. The viewmodel of the gun must be loaded inside
;the main.bb file (also changing the scale values and other things there).

Global USPViewModel,P90Viewmodel,CrowbarViewmodel,M9ViewModel,GunPivot,GunParticle,P90Scope
Global AimCrossIMG
Global ExtraKevlarIMG
Global HoldingGun = 0

Global ShootEmptySFX

Global MuzzleFlash

Global P90Ammo% = 200
Global USPAmmo% = 200
Global M9Ammo% = 0

Global KEY_RELOAD = 19

Global Weapon_InSlot1$
Global Weapon_InSlot2$
Global Weapon_InSlot3$
Global Weapon_CurrSlot% = 1

Global DustParticle

Global GunPickPivot

Global GunPivot_Y#
Global GunPivot_YSide% = 0
Global GunPivot_X#
Global GunPivot_XSide% = 0

Global GunAnimFLAG = False

Global GunChangeFLAG = False

Global GunUpdateFLAG = 0

Global UsingScope%
Global ScopeTexture
Global ScopeCam

Global GunSFX,GunSFX2,GunCHN,GunCHN2

Global CanPlayerUseGuns% = True
;Type defination for the weapon + info
Type Guns
	Field ID					;<--- The ID of the gun. WARNING: Overwriting existing IDs could cause to the game would be glitched or at the worst case a MAV
	Field IMG					;<--- The HUD Image of the gun (not the item IMG!)
	Field CurrAmmo				;<--- Current ammo in a magazine
	Field MaxCurrAmmo			;<--- Max ammo in a magazine
	;Field CurrReloadAmmo		;<--- How much reload ammo the gun has (when picked up, etc...)
	;Field MaxReloadAmmo		;<--- How much magazines can be carried by the player
	Field DamageOnEntity		;<--- How much damage the gun makes, when the bullet you shot hit an hurtable entity
	Field FlySpeed = 100		;<--- How fast the bullet will fly (optional, default fly speed is 100)
	Field Accuracy = 100		;<--- How good the accuracy of the guns is (optional, but would be better to change it, max amount is 100 (best accuracy), and lowest is 1 (the lowest accuracy))
	Field CanHaveSilencer = 0	;<--- Does the gun has the ability to have a silencer atached to it?
	Field ShootState# = 0.0		;<--- Dont change this variables in the "CreateGun" or "InitGuns" functions!
	Field ReloadState# = 0.0	;<--- 								"-"
	Field DeployState# = 0.0	;<---								"-"
	Field GunState = 0			;<---								"-"
	Field Deployed% = 0			;<---								"-"
	Field Holster% = 0			;<---								"-"
	Field ShootAnim = 0			;<---								"-"
	Field HasSilencer% = 0		;<---								"-"
	Field SilenState# = 0.0		;<---								"-"
End Type
Global EqquipedGun.Guns
;Type defination for the bullets. You dont need to work with those

;Dont put anything inside this function, unless you want to make a special weapon like a rocket launcher or a nuke
Function CreateGun.Guns(id, ammo1, maxammo1, ammo2, maxammo2, dmgentity, accuracy = 100, flyspeed = 100, canhavesilencer = 0)
	Local g.Guns = New Guns
	
	g\ID = id
	g\CurrAmmo = ammo1
	g\MaxCurrAmmo = maxammo1
	;g\CurrReloadAmmo = ammo2
	;g\MaxReloadAmmo = maxammo2
	g\DamageOnEntity = dmgentity
	g\FlySpeed = flyspeed
	g\Accuracy = accuracy
	g\CanHaveSilencer = canhavesilencer
	
	Return g
End Function

;Here you need to define your weapon (look for the other guns as a sample)
Function InitGuns()
	Local g.Guns
	
	NTF_InfiniteStamina% = False
	
	GunAnimFLAG = False
	
	GunChangeFLAG = False
	
	GunUpdateFLAG = 0
	
	UsingScope% = False
	
	CanPlayerUseGuns% = True
	
	HoldingGun = 0
	Kevlar_Health% = 100
	Kevlar_ExtraHealth% = 0
	
	P90Ammo% = 200
	USPAmmo% = 200
	M9Ammo% = 0
	
	Weapon_InSlot1$ = "p90"
	Weapon_InSlot2$ = "usp"
	Weapon_InSlot3$ = "crowbar"
	If (Not IntroEnabled%)
		Weapon_CurrSlot% = 1
	Else
		Weapon_CurrSlot% = 4
		HoldingGun = 0
		CanPlayerUseGuns% = False
	EndIf
	
	ShootEmptySFX = LoadSound_Strict("SFX\Guns\shoot_empty.ogg")

	GunPivot = CreatePivot()
	
	GunPickPivot = CreatePivot()
	EntityParent GunPickPivot,GunPivot
	
	MuzzleFlash = LoadTexture("GFX\flash.jpg",1+2)
	
	USPViewModel = LoadAnimMesh_Strict("GFX\Items\USP_Tactical_Viewmodel.b3d")
	ScaleEntity USPViewModel,0.015,0.015,0.015
	EntityParent USPViewModel,GunPivot
	MoveEntity USPViewModel,0.01,0.0,0.02
	HideEntity USPViewModel
	
	P90Viewmodel = LoadAnimMesh_Strict("GFX\Items\P90_Viewmodel.b3d")
	ScaleEntity P90Viewmodel,0.015,0.015,0.015
	EntityParent P90Viewmodel,GunPivot
	MoveEntity P90Viewmodel,0.01,0.0,0.02
	HideEntity P90Viewmodel
	
	GunParticle = CreateSprite()
	EntityParent GunParticle,GunPivot
	MoveEntity GunParticle,0.06,-0.03,0.17
	EntityTexture(GunParticle, MuzzleFlash)
	EntityFX(GunParticle, 1 + 8)
	SpriteViewMode (GunParticle, 3)
	EntityBlend(GunParticle, BLEND_ADD)
	ScaleSprite(GunParticle, 0.08, 0.08)
	HideEntity GunParticle
	
	g.Guns = CreateGun(1, 12, 12, 3, 5, 39, 90, 100, 1)		;<---- USP Tactical
	g.Guns = CreateGun(2, 50, 50, 3, 5, 31, 85, 100, 0)		;<---- FN P90
	
End Function

Function DeleteGuns()
	
	For g.Guns = Each Guns
		Delete g
	Next
	
	FreeSound_Strict ShootEmptySFX : ShootEmptySFX = 0
	
End Function

;Here you need to make your gun work
Function UpdateGuns()
	Local g.Guns = EqquipedGun, n.NPCs
	If g = Null Then Return
	Local de.Decals
	Local USPprevframe# = AnimTime(USPViewModel)
	Local P90prevframe# = AnimTime(P90Viewmodel)
	RotateEntity GunPivot,EntityPitch(Camera), EntityYaw(Camera), 0
	AnimateGuns()
	GunAnimFLAG = True
	UsingScope% = False
	Select g\ID
		Case 1 ;<--- USP
			HideEntity P90Viewmodel
			ShowEntity USPViewModel
			
			If g\ReloadState# = 0.0 And g\ShootState# = 0.0
				If g\Deployed = 1
					If g\CurrAmmo < 12 And USPAmmo% > 0
						If AnimTime(USPViewModel) = 41.0 Or AnimTime(USPViewModel) = 225.0
							If KeyHit(KEY_RELOAD)
								g\CurrAmmo = 0
								;PlaySound USPSounds(1)
								;PlaySound USPSounds(Rand(3,5))
								PlayGunSound("USP\reload",1,3,1,False)
								USPprevframe# = 105.0
								Animate2(USPViewModel,AnimTime(USPViewModel),105,105,0.5,False)
								g\ReloadState# = 1.0
							EndIf
						Else
							If KeyHit(KEY_RELOAD)
								FlushKeys()
							EndIf
						EndIf
					Else
						If KeyHit(KEY_RELOAD)
							FlushKeys()
						EndIf
					EndIf
				Else
					If KeyHit(KEY_RELOAD)
						FlushKeys()
					EndIf
				EndIf
			Else
				Animate2(USPViewModel,AnimTime(USPViewModel),105,168,0.5,False)
				;AnimateGun(USPViewModel,105,168,0.5,False)
				If USPprevframe# < 167.5 And AnimTime(USPViewModel)=> 167.5
					g\CurrAmmo = 12
					USPAmmo% = USPAmmo% - 1
					g\ReloadState# = 0.0
				EndIf
			EndIf
			
			If g\CurrAmmo > 0
				If g\ReloadState# = 0.0
					If g\Deployed = 0
						Animate2(USPViewModel,AnimTime(USPViewModel),1,37,0.5,False)
						;AnimateGun(USPViewModel,1,37,0.5,False)
						If USPprevframe# < 12.0 And AnimTime(USPViewModel)=>12.0
							;PlaySound USPSounds(2)
							PlayGunSound("USP\deploy",0,0,1,False)
						ElseIf USPprevframe# < 36.5 And AnimTime(USPViewModel)=>36.5
							USPprevframe# = 0.0
							g\Deployed = 1
						EndIf
					Else
						If g\ShootAnim = 1
							Animate2(USPViewModel,AnimTime(USPViewModel),171,197,0.5,False)
							;AnimateGun(USPViewModel,171,197,0.5,False)
							If USPprevframe# < 196.5 And AnimTime(USPViewModel)=>196.5
								Animate2(USPViewModel,AnimTime(USPViewModel),41,41,0.5,False)
								;SetGunFrame(USPViewModel,41)
								USPprevframe# = 40.0
								g\ShootAnim = 0
							EndIf
						EndIf
						
						If g\ShootState# = 0.0 And g\SilenState# = 0.0
							If MouseHit1
								If ClosestButton=0 And ClosestItem=Null And GrabbedEntity%=0
									g\ShootAnim = 0
									Animate2(USPViewModel,AnimTime(USPViewModel),41,41,0.5,False)
									;SetGunFrame(USPViewModel,41)
									USPprevframe# = 170.0
									g\ShootState# = 1.0
								Else
									GunAnimFLAG = False
								EndIf
							ElseIf MouseHit2
								g\ShootAnim = 0
								g\SilenState# = 1.0
							Else
								If g\ShootAnim = 0
									Animate2(USPViewModel,AnimTime(USPViewModel),41,41,0.5,False)
									;SetGunFrame(USPViewModel,41)
									GunAnimFLAG = False
								EndIf
							EndIf
						ElseIf g\ShootState# = 1.0 And g\SilenState# = 0.0
							;PlaySound USPSounds(0)
							If g\HasSilencer% = 0
								If PlayerRoom\RoomTemplate\Name="gatea" Or PlayerRoom\RoomTemplate\Name="exit1" Or PlayerRoom\RoomTemplate\Name = "pocketdimension" Or PlayerRoom\RoomTemplate\Name = "dimension1499"
									;PlaySound USPShootSounds_Out(Rand(0,6))
									PlayGunSound("USP\shoot_out_0",1,7,0,True)
								Else
									;PlaySound USPShootSounds_In(Rand(0,6))
									PlayGunSound("USP\shoot_in_0",1,7,0,True)
								EndIf
							Else
								PlayGunSound("shoot_slienced",0,0,0,True)
							EndIf
							ShowEntity GunParticle
							RotateEntity GunParticle,0,0,Rnd(360)
							RotateEntity GunPickPivot,Rnd(-0.6,0.6),Rnd(-0.6,0.6),0
							EntityPick GunPickPivot,10000.0
							temp = 0
							If temp = 2
								p.Particles = CreateParticle(PickedX(),PickedY(),PickedZ(), 5, 0.06, 0.2, 80)
								p\speed = 0.001
								p\SizeChange = 0.003
								p\A = 0.8
								p\Achange = -0.02
								DebugLog "shot"
							ElseIf temp = 1
								p.Particles = CreateParticle(PickedX(),PickedY(),PickedZ(), 0, 0.03, 0, 80)
								p\speed = 0.001
								p\SizeChange = 0.003
								p\A = 0.8
								p\Achange = -0.01
								RotateEntity p\pvt, EntityPitch(GunPivot)-180, EntityYaw(GunPivot),0
								
								PlaySound2(Gunshot3SFX, Camera, p\pvt, 0.4, Rnd(0.8,1.0))
								
								For i = 0 To Rand(2,3)
									p.Particles = CreateParticle(PickedX(),PickedY(),PickedZ(), 0, 0.006, 0.003, 80)
									p\speed = 0.02
									p\A = 0.8
									p\Achange = -0.01
									RotateEntity p\pvt, EntityPitch(GunPivot)+Rnd(170,190), EntityYaw(GunPivot)+Rnd(-10,10),0	
								Next
								
								;bullet hole decal
								de.Decals = CreateDecal(Rand(13,14), PickedX(),PickedY(),PickedZ(), 0,0,0)
								AlignToVector de\obj,-PickedNX(),-PickedNY(),-PickedNZ(),3
								MoveEntity de\obj, 0,0,-0.001
								EntityFX de\obj, 1
								de\lifetime = 70*20
								EntityBlend de\obj, 2
								de\Size = Rnd(0.028,0.034)
								ScaleSprite de\obj, de\Size, de\Size
							EndIf
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 1.0 And g\ShootState# < 3.0 And g\SilenState# = 0.0
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 2.99 And g\SilenState# = 0.0
							HideEntity GunParticle
							g\CurrAmmo = g\CurrAmmo - 1
							g\ShootAnim = 1
							g\ShootState# = 0.0
						ElseIf g\ShootState# = 0.0 And g\SilenState# = 1.0
							
						EndIf
					EndIf
				EndIf
			ElseIf g\CurrAmmo = 0
				If g\ReloadState# = 0.0
					If g\Deployed = 0
						Animate2(USPViewModel,AnimTime(USPViewModel),1,37,0.5,False)
						;AnimateGun(USPViewModel,1,37,0.5,False)
						If USPprevframe# < 12.0 And AnimTime(USPViewModel)=>12.0
							;PlaySound USPSounds(2)
							PlayGunSound("USP\deploy",0,0,1,False)
						ElseIf USPprevframe# < 36.5 And AnimTime(USPViewModel)=>36.5
							USPprevframe# = 0.0
							g\Deployed = 1
						EndIf
					Else
						If g\ShootAnim = 1
							Animate2(USPViewModel,AnimTime(USPViewModel),199,225,0.5,False)
							;AnimateGun(USPViewModel,199,225,0.5,False)
							If USPprevframe# < 224.5 And AnimTime(USPViewModel)=>224.5
								Animate2(USPViewModel,AnimTime(USPViewModel),225,225,0.5,False)
								;SetGunFrame(USPViewModel,225)
								USPprevframe# = 225.0
								g\ShootAnim = 0
							EndIf
						EndIf
						
						If g\ShootState# = 0.0
							If MouseHit1%
								If ClosestButton=0 And ClosestItem=Null And GrabbedEntity%=0
									g\ShootAnim = 0
									Animate2(USPViewModel,AnimTime(USPViewModel),225,225,0.5,False)
									;SetGunFrame(USPViewModel,255)
									USPprevframe# = 199.0
									g\ShootState# = 1.0
								Else
									GunAnimFLAG = False
								EndIf
							Else
								If g\ShootAnim = 0
									Animate2(USPViewModel,AnimTime(USPViewModel),225,225,0.5,False)
									;SetGunFrame(USPViewModel,225)
									GunAnimFLAG = False
								EndIf
							EndIf
						ElseIf g\ShootState# = 1.0
							PlaySound_Strict ShootEmptySFX
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 1.0 And g\ShootState# < 4
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 3.99
							HideEntity GunParticle
							g\ShootAnim = 1
							g\ShootState# = 0.0
						EndIf
					EndIf
				EndIf
			EndIf
		Case 2 ;<--- P90
			ShowEntity P90Viewmodel
			HideEntity USPViewModel
			UsingScope% = True

			If g\ReloadState# = 0.0 And g\ShootState# = 0.0
				If g\Deployed = 1
					If g\CurrAmmo < 50 And P90Ammo% > 0
						If AnimTime(P90Viewmodel) = 32.0
							If KeyHit(KEY_RELOAD)
								g\CurrAmmo = 0
								;PlaySound P90Sounds(1)
								PlayGunSound("P90\reload",0,0,1,False)
								P90prevframe# = 50.0
								Animate2(P90Viewmodel,AnimTime(P90Viewmodel),50,50,0.5,False)
								;SetGunFrame(P90ViewModel,50)
								g\ReloadState# = 1.0
							EndIf
						Else
							If KeyHit(KEY_RELOAD)
								FlushKeys()
							EndIf
						EndIf
					Else
						If KeyHit(KEY_RELOAD)
							FlushKeys()
						EndIf
					EndIf
				Else
					If KeyHit(KEY_RELOAD)
						FlushKeys()
					EndIf
				EndIf
			ElseIf g\ReloadState# > 0.0 And g\ShootState# = 0.0
				Animate2(P90Viewmodel,AnimTime(P90Viewmodel),50,199,0.5,False)
				;AnimateGun(P90ViewModel,50,199,0.5,False)
				If P90prevframe# < 198.5 And AnimTime(P90Viewmodel)=> 198.5
					g\CurrAmmo = 50
					P90Ammo% = P90Ammo% - 1
					g\ReloadState# = 0.0
				EndIf
			EndIf
			
			If g\CurrAmmo > 0
				If g\ReloadState# = 0.0
					If g\Deployed = 0
						Animate2(P90Viewmodel,AnimTime(P90Viewmodel),1,30,0.5,False)
						;AnimateGun(P90ViewModel,1,30,0.5,False)
						If P90prevframe# < 2.0 And AnimTime(P90Viewmodel)=>2.0
							;PlaySound P90Sounds(2)
							PlayGunSound("P90\deploy",0,0,1,False)
						ElseIf P90prevframe# < 29.5 And AnimTime(P90Viewmodel)=>29.5
							P90prevframe# = 0.0
							g\Deployed = 1
						EndIf
					Else
						If g\ShootAnim = 1
							Animate2(P90Viewmodel,AnimTime(P90Viewmodel),200,228,0.5,False)
							;AnimateGun(P90ViewModel,200,228,0.5,False)
							If USPprevframe# < 227.5 And AnimTime(P90Viewmodel)=>227.5
								Animate2(P90Viewmodel,AnimTime(P90Viewmodel),32,32,0.5,False)
								;SetGunFrame(P90ViewModel,32)
								P90prevframe# = 32.0
								g\ShootAnim = 0
							EndIf
						EndIf
						
						If g\ShootState# = 0.0
							If MouseDown1%
								If ClosestButton=0 And ClosestItem=Null And GrabbedEntity%=0
									g\ShootAnim = 0
									Animate2(P90Viewmodel,AnimTime(P90Viewmodel),200,200,0.5,False)
									;SetGunFrame(P90ViewModel,200)
									P90prevframe# = 200.0
									g\ShootState# = 1.0
								Else
									GunAnimFLAG = False
								EndIf
							Else
								If g\ShootAnim = 0
									Animate2(P90Viewmodel,AnimTime(P90Viewmodel),32,32,0.5,False)
									;SetGunFrame(P90ViewModel,32)
									GunAnimFLAG = False
								EndIf
							EndIf
						ElseIf g\ShootState# = 1.0
							;PlaySound P90Sounds(0)
							If PlayerRoom\RoomTemplate\Name="gatea" Or PlayerRoom\RoomTemplate\Name="exit1" Or PlayerRoom\RoomTemplate\Name = "pocketdimension" Or PlayerRoom\RoomTemplate\Name = "dimension1499"
								;PlaySound P90ShootSounds_Out(Rand(0,6))
								PlayGunSound("P90\shoot_out_0",1,7,0,True)
							Else
								PlayGunSound("P90\shoot_in_0",1,7,0,True)
							EndIf
							ShowEntity GunParticle
							RotateEntity GunParticle,0,0,Rnd(360)
							RotateEntity GunPickPivot,Rnd(-1,1),Rnd(-1,1),0
							EntityPick GunPickPivot,10000.0
							temp = 0
							If temp = 2
								p.Particles = CreateParticle(PickedX(),PickedY(),PickedZ(), 5, 0.06, 0.2, 80)
								p\speed = 0.001
								p\SizeChange = 0.003
								p\A = 0.8
								p\Achange = -0.02
								DebugLog "shot"
							ElseIf temp = 1
								p.Particles = CreateParticle(PickedX(),PickedY(),PickedZ(), 0, 0.03, 0, 80)
								p\speed = 0.001
								p\SizeChange = 0.003
								p\A = 0.8
								p\Achange = -0.01
								RotateEntity p\pvt, EntityPitch(GunPivot)-180, EntityYaw(GunPivot),0
								
								PlaySound2(Gunshot3SFX, Camera, p\pvt, 0.4, Rnd(0.8,1.0))
								
								For i = 0 To Rand(2,3)
									p.Particles = CreateParticle(PickedX(),PickedY(),PickedZ(), 0, 0.006, 0.003, 80)
									p\speed = 0.02
									p\A = 0.8
									p\Achange = -0.01
									RotateEntity p\pvt, EntityPitch(GunPivot)+Rnd(170,190), EntityYaw(GunPivot)+Rnd(-10,10),0	
								Next
								
								;bullet hole decal
								de.Decals = CreateDecal(Rand(13,14), PickedX(),PickedY(),PickedZ(), 0,0,0)
								AlignToVector de\obj,-PickedNX(),-PickedNY(),-PickedNZ(),3
								MoveEntity de\obj, 0,0,-0.001
								EntityFX de\obj, 1
								de\lifetime = 70*20
								EntityBlend de\obj, 2
								de\Size = Rnd(0.028,0.034)
								ScaleSprite de\obj, de\Size, de\Size
							EndIf
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 1.0 And g\ShootState# < 5
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 4.99
							HideEntity GunParticle
							g\CurrAmmo = g\CurrAmmo - 1
							g\ShootAnim = 1
							g\ShootState# = 0.0
						EndIf
					EndIf
				EndIf
			ElseIf g\CurrAmmo = 0
				If g\ReloadState# = 0.0
					If g\Deployed = 0
						Animate2(P90Viewmodel,AnimTime(P90Viewmodel),1,30,0.5,False)
						;AnimateGun(P90ViewModel,1,30,0.5,False)
						If P90prevframe# < 29.5 And AnimTime(P90Viewmodel)=>29.5
							P90prevframe# = 0.0
							g\Deployed = 1
						EndIf
					Else
						If g\ShootAnim = 1
							Animate2(P90Viewmodel,AnimTime(P90Viewmodel),200,228,0.5,False)
							;AnimateGun(P90ViewModel,200,228,0.5,False)
							If P90prevframe# < 227.5 And AnimTime(P90Viewmodel)=>227.5
								Animate2(P90Viewmodel,AnimTime(P90Viewmodel),32,32,0.5,False)
								;SetGunFrame(P90ViewModel,32)
								P90prevframe# = 32.0
								g\ShootAnim = 0
							EndIf
						EndIf
						
						If g\ShootState# = 0.0
							;If MouseDown1%
							If MouseHit1%
								If ClosestButton=0 And ClosestItem=Null And GrabbedEntity%=0
									g\ShootAnim = 0
									Animate2(P90Viewmodel,AnimTime(P90Viewmodel),32,32,0.5,False)
									;SetGunFrame(P90ViewModel,32)
									P90prevframe# = 200.0
									g\ShootState# = 1.0
								Else
									GunAnimFLAG = False
								EndIf
							Else
								If g\ShootAnim = 0
									Animate2(P90Viewmodel,AnimTime(P90Viewmodel),32,32,0.5,False)
									;SetGunFrame(P90ViewModel,32)
									GunAnimFLAG = False
								EndIf
							EndIf
						ElseIf g\ShootState# = 1.0
							PlaySound_Strict ShootEmptySFX
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 1.0 And g\ShootState# < 5
							g\ShootState# = g\ShootState# + FPSfactor#
						ElseIf g\ShootState# > 4.99
							HideEntity GunParticle
							g\ShootAnim = 1
							g\ShootState# = 0.0
						EndIf
					EndIf
				EndIf
			EndIf
	End Select
End Function

Function AnimateGuns()
	
	If (Not GunAnimFLAG) And CurrSpeed=0.0
		If GunPivot_YSide%=0
			If GunPivot_Y# > -0.005
				GunPivot_Y# = GunPivot_Y# - (0.00005*FPSFactor)
			Else
				GunPivot_Y# = -0.005
				GunPivot_YSide% = 1
			EndIf
		Else
			If GunPivot_Y# < 0.0
				GunPivot_Y# = GunPivot_Y# + (0.00005*FPSFactor)
			Else
				GunPivot_Y# = 0.0
				GunPivot_YSide% = 0
			EndIf
		EndIf
		
		If GunPivot_X# < -0.001
			GunPivot_X# = GunPivot_X# + (0.0001*FPSFactor)
		ElseIf GunPivot_X# > 0.001
			GunPivot_X# = GunPivot_X# - (0.0001*FPSFactor)
		Else
			GunPivot_X# = 0.0
		EndIf
	ElseIf (Not GunAnimFLAG) And CurrSpeed<>0.0
		If GunPivot_YSide%=0
			If GunPivot_Y# > -0.005
				GunPivot_Y# = GunPivot_Y# - (0.0001*FPSFactor)
			Else
				GunPivot_Y# = -0.005
				GunPivot_YSide% = 1
			EndIf
		Else
			If GunPivot_Y# < 0.0
				GunPivot_Y# = GunPivot_Y# + (0.0001*FPSFactor)
			Else
				GunPivot_Y# = 0.0
				GunPivot_YSide% = 0
			EndIf
		EndIf
		
		If GunPivot_XSide%=0
			If GunPivot_X# > -0.0025
				GunPivot_X# = GunPivot_X# - (0.000075*FPSFactor)
			Else
				GunPivot_X# = -0.0025
				GunPivot_XSide% = 1
			EndIf
		Else
			If GunPivot_X# < 0.0025
				GunPivot_X# = GunPivot_X# + (0.000075*FPSFactor)
			Else
				GunPivot_X# = 0.0025
				GunPivot_XSide% = 0
			EndIf
		EndIf
	Else
		If GunPivot_Y# < 0.0
			GunPivot_Y# = GunPivot_Y# + (0.0001*FPSFactor)
		Else
			GunPivot_Y# = 0.0
		EndIf
		
		If GunPivot_X# < -0.001
			GunPivot_X# = GunPivot_X# + (0.0001*FPSFactor)
		ElseIf GunPivot_X# > 0.001
			GunPivot_X# = GunPivot_X# - (0.0001*FPSFactor)
		Else
			GunPivot_X# = 0.0
		EndIf
	EndIf
	
	PositionEntity GunPivot,EntityX(Camera), EntityY(Camera)+GunPivot_Y#, EntityZ(Camera)
	MoveEntity GunPivot,GunPivot_X#,0,0
	
End Function

Function PlayGunSound(file$,min_amount%=0,max_amount%=0,sfx%=0,pitchshift%=False)
	
	If sfx%=0
		If GunSFX <> 0 Then FreeSound_Strict GunSFX:GunSFX=0
		If ChannelPlaying(GunCHN) Then StopChannel(GunCHN) : GunCHN = 0
		If min_amount% = max_amount%
			GunSFX = LoadSound_Strict("SFX\guns\"+file$+".ogg")
		Else
			GunSFX = LoadSound_Strict("SFX\guns\"+file$+Rand(min_amount%,max_amount%)+".ogg")
		EndIf
		GunCHN = PlaySound_Strict(GunSFX)
		If GunPitchShift% = 1
			If pitchshift%
				ChannelPitch GunCHN,Rand(35000,43000)
			EndIf
		EndIf
	Else
		If GunSFX2 <> 0 Then FreeSound_Strict GunSFX2:GunSFX2=0
		If ChannelPlaying(GunCHN2) Then StopChannel(GunCHN2) : GunCHN2 = 0
		If min_amount% = max_amount%
			GunSFX2 = LoadSound_Strict("SFX\guns\"+file$+".ogg")
		Else
			GunSFX2 = LoadSound_Strict("SFX\guns\"+file$+Rand(min_amount%,max_amount%)+".ogg")
		EndIf
		GunCHN2 = PlaySound_Strict(GunSFX2)
	EndIf
	
End Function
Function IsAGun(tempname$)
	Select Lower(tempname)
		Case "usp"
			Return 1
		Case "p90"
			Return 2
	End Select
	Return False
End Function
;~IDEal Editor Parameters:
;~C#Blitz3D