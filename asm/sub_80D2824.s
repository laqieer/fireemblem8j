	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set StartMenuExt, 0x0804F9C0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_8037B04, 0x08037B04 + 1
	.section .text.sub_80D2824, "ax", %progbits
@ sub_80D2824 @ JP 0x080D2824 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2824
	.thumb_func
sub_80D2824:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x14]
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D28EA
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	adds r3, r6, #0
	adds r3, #0x3c
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt _080D2868
	ldr r2, _080D2864 @ =0x089CDD18
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	b _080D2896
	.align 2, 0
_080D2864: .4byte 0x089CDD18
_080D2868:
	adds r2, r4, #0
	adds r2, #0x3b
	cmp r0, #2
	bne _080D289E
	cmp r1, #0x3e
	beq _080D288A
	cmp r1, #0x3e
	bgt _080D287E
	cmp r1, #0x3d
	beq _080D2884
	b _080D2896
_080D287E:
	cmp r1, #0x47
	beq _080D2890
	b _080D2896
_080D2884:
	movs r0, #0x7e
	strb r0, [r2]
	b _080D289E
_080D288A:
	movs r0, #0x7f
	strb r0, [r2]
	b _080D289E
_080D2890:
	movs r0, #0x37
	strb r0, [r2]
	b _080D289E
_080D2896:
	adds r0, r4, #0
	adds r0, #0x3b
	strb r1, [r0]
	adds r2, r0, #0
_080D289E:
	ldrb r0, [r2]
	cmp r0, #0x1e
	bgt _080D28BA
	cmp r0, #0x1d
	blt _080D28BA
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080D28BA
	adds r0, r5, #0
	bl sub_8037B04
_080D28BA:
	ldr r0, _080D28F4 @ =0x03005350
	ldr r1, _080D28F8 @ =0x06001000
	movs r2, #0x80
	movs r3, #5
	bl sub_8003BE8
	ldr r0, _080D28FC @ =0x02022DB8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080D2900 @ =0x08BAB980
	movs r1, #0
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartMenuExt
_080D28EA:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D28F4: .4byte 0x03005350
_080D28F8: .4byte 0x06001000
_080D28FC: .4byte 0x02022DB8
_080D2900: .4byte 0x08BAB980

