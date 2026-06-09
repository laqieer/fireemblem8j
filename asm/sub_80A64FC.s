	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.section .text.sub_80A64FC, "ax", %progbits
@ sub_80A64FC @ JP 0x080A64FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A64FC
	.thumb_func
sub_80A64FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _080A656C @ =0x02023CA8
	mov sl, r0
_080A6510:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _080A6580
	adds r3, r4, #1
	mov sb, r3
	ldr r2, _080A6570 @ =0x020136EC
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _080A6574 @ =0x02022CA8
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _080A6578 @ =0x020234A8
	mov r8, r0
	movs r4, #0x13
_080A653C:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _080A657C @ =0x02013EEC
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A653C
	b _080A65A8
	.align 2, 0
_080A656C: .4byte 0x02023CA8
_080A6570: .4byte 0x020136EC
_080A6574: .4byte 0x02022CA8
_080A6578: .4byte 0x020234A8
_080A657C: .4byte 0x02013EEC
_080A6580:
	adds r1, r4, #1
	mov sb, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _080A65C4 @ =0x020234A8
	adds r1, r0, r4
	ldr r4, _080A65C8 @ =0x02022CA8
	adds r0, r0, r4
	movs r4, #0x13
_080A6596:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A6596
_080A65A8:
	mov r4, sb
	cmp r4, #0x1d
	ble _080A6510
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A65C4: .4byte 0x020234A8
_080A65C8: .4byte 0x02022CA8

