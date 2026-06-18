	.syntax unified
	.set GetGameOption, 0x080B6A00 + 1
	.set StartBgm, 0x08002424 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_80160DC, 0x080160DC + 1
	.set sub_80B6934, 0x080B6934 + 1
	.set sub_80BEE54, 0x080BEE54 + 1
	.section .text.sub_80B68CC, "ax", %progbits
@ MusicOptionChangeHandler @ JP 0x080B68CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MusicOptionChangeHandler
	.thumb_func
MusicOptionChangeHandler:
	push {r4, lr}
	bl sub_80B6934
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B692A
	ldr r1, _080B68F8 @ =0x08AAF6DC
	ldr r4, _080B68FC @ =0x08AAF6D8
	ldr r0, [r4]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetGameOption
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B6900
	movs r0, #1
	bl sub_800226C
	b _080B692A
	.align 2, 0
_080B68F8: .4byte 0x08AAF6DC
_080B68FC: .4byte 0x08AAF6D8
_080B6900:
	ldr r0, [r4]
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B6918
	movs r0, #0x34
	movs r1, #0
	bl StartBgm
	b _080B692A
_080B6918:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B6926
	bl sub_80BEE54
	b _080B692A
_080B6926:
	bl sub_80160DC
_080B692A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

