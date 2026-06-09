	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80A2858, 0x080A2858 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A28E8, "ax", %progbits
@ sub_80A28E8 @ JP 0x080A28E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A28E8
	.thumb_func
sub_80A28E8:
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _080A290C @ =0x085775CC
	ldr r3, [r6]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A2910
	cmp r5, #0
	bne _080A291C
	adds r0, r1, #0
	bl sub_80A2858
	b _080A2982
	.align 2, 0
_080A290C: .4byte 0x085775CC
_080A2910:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080A293C
_080A291C:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A2938 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2982
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A2982
	.align 2, 0
_080A2938: .4byte 0x0202BCEC
_080A293C:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A2948
	strb r2, [r4]
_080A2948:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A2958
	movs r0, #1
	strb r0, [r4]
_080A2958:
	ldrb r0, [r4]
	cmp r5, r0
	beq _080A2982
	ldr r0, _080A2988 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2970
	movs r0, #0x67
	bl m4aSongNumStart
_080A2970:
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl sub_80B1FBC
_080A2982:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2988: .4byte 0x0202BCEC

