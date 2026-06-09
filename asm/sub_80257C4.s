	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F54, 0x08024F54 + 1
	.section .text.sub_80257C4, "ax", %progbits
@ sub_80257C4 @ JP 0x080257C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80257C4
	.thumb_func
sub_80257C4:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _080257F4 @ =0x02033F38
	str r0, [r1]
	ldr r0, _080257F8 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	cmp r4, #0x14
	beq _08025800
	cmp r4, #0x1e
	bne _0802580A
	ldr r2, _080257FC @ =sub_8025744
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8024F54
	b _0802580A
	.align 2, 0
_080257F4: .4byte 0x02033F38
_080257F8: .4byte 0x0202E4E0
_080257FC: .4byte 0x08025745  @ sub_8025744
_08025800:
	ldr r2, _08025810 @ =sub_8025784
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8024F54
_0802580A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025810: .4byte 0x08025785  @ sub_8025784

