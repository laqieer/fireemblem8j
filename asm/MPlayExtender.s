	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.MPlayExtender, "ax", %progbits
@ MPlayExtender @ JP 0x080D512C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MPlayExtender
	.thumb_func
MPlayExtender:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080D51F4 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _080D51F8 @ =0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _080D51FC @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _080D5200 @ =0x03007FF0
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _080D5204 @ =0x68736D53
	cmp r6, r0
	bne _080D51EC
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _080D5208 @ =0x03006470
	ldr r0, _080D520C @ =sub_80D60E8
	str r0, [r1, #0x20]
	ldr r0, _080D5210 @ =ply_lfos
	str r0, [r1, #0x44]
	ldr r0, _080D5214 @ =ply_mod
	str r0, [r1, #0x4c]
	ldr r0, _080D5218 @ =sub_80D6240
	str r0, [r1, #0x70]
	ldr r0, _080D521C @ =ply_endtie
	str r0, [r1, #0x74]
	ldr r0, _080D5220 @ =sub_80D5368
	str r0, [r1, #0x78]
	ldr r0, _080D5224 @ =TrackStop
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _080D5228 @ =FadeOutBody
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _080D522C @ =TrkVolPitSet
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _080D5230 @ =CgbSound
	str r0, [r4, #0x28]
	ldr r0, _080D5234 @ =CgbOscOff
	str r0, [r4, #0x2c]
	ldr r0, _080D5238 @ =MidiKeyToCgbFreq
	str r0, [r4, #0x30]
	ldr r0, _080D523C @ =0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _080D5240 @ =0x05000040
	mov r0, sp
	adds r1, r5, #0
	bl sub_80D6370
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_080D51EC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D51F4: .4byte 0x04000084
_080D51F8: .4byte 0x04000080
_080D51FC: .4byte 0x04000063
_080D5200: .4byte 0x03007FF0
_080D5204: .4byte 0x68736D53
_080D5208: .4byte 0x03006470
_080D520C: .4byte 0x080D60E9  @ sub_80D60E8
_080D5210: .4byte 0x080D4DA5  @ ply_lfos
_080D5214: .4byte 0x080D4DB9  @ ply_mod
_080D5218: .4byte 0x080D6241  @ sub_80D6240
_080D521C: .4byte 0x080D4D3D  @ ply_endtie
_080D5220: .4byte 0x080D5369  @ sub_80D5368
_080D5224: .4byte 0x080D4AC9  @ TrackStop
_080D5228: .4byte 0x080D574D  @ FadeOutBody
_080D522C: .4byte 0x080D5815  @ TrkVolPitSet
_080D5230: .4byte 0x080D5A29  @ CgbSound
_080D5234: .4byte 0x080D5971  @ CgbOscOff
_080D5238: .4byte 0x080D58C9  @ MidiKeyToCgbFreq
_080D523C: .4byte 0x00000000
_080D5240: .4byte 0x05000040
_080D5244:
	.byte 0x2A, 0xDF, 0x70, 0x47

