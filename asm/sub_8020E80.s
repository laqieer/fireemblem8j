	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set WfxFlamesInitGradientPublic, 0x080306A8 + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8030B90, 0x08030B90 + 1
	.section .text.sub_8020E80, "ax", %progbits
@ sub_8020E80 @ JP 0x08020E80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020E80
	.thumb_func
sub_8020E80:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08020EB4
	bl j_ColorFadeTick
	ldr r0, _08020EBC @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020EAA
	bl WfxFlamesInitGradientPublic
_08020EAA:
	bl sub_8030B90
	adds r0, r4, #0
	bl sub_8002DE4
_08020EB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020EBC: .4byte 0x0202BCEC

