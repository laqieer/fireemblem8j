	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024F54, 0x08024F54 + 1
	.section .text.sub_8025854, "ax", %progbits
@ sub_8025854 @ JP 0x08025854 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025854
	.thumb_func
sub_8025854:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0x10
	ldrsb r5, [r4, r5]
	movs r6, #0x11
	ldrsb r6, [r4, r6]
	ldr r0, _080258A4 @ =0x02033F38
	str r4, [r0]
	ldr r0, _080258A8 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r2, _080258AC @ =sub_8025814
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8024F54
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _080258B0 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _0802589E
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x21
	movs r3, #0
	bl AddTarget
_0802589E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080258A4: .4byte 0x02033F38
_080258A8: .4byte 0x0202E4E0
_080258AC: .4byte 0x08025815  @ sub_8025814
_080258B0: .4byte 0x0202E4D8

