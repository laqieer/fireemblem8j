	.syntax unified
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.section .text.sub_8045484, "ax", %progbits
@ sub_8045484 @ JP 0x08045484 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045484
	.thumb_func
sub_8045484:
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, _080454C4 @ =0x02023CA8
	adds r1, r2, #0
	adds r1, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r0, [r4]
	subs r3, r0, #1
	lsls r0, r3, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080454D4
	ldr r2, _080454C8 @ =0x080DEDF2
	lsls r0, r3, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, _080454CC @ =0x085D8128
	ldr r2, _080454D0 @ =0x00002078
	bl j_TmApplyTsa
	b _080454FE
	.align 2, 0
_080454C4: .4byte 0x02023CA8
_080454C8: .4byte 0x080DEDF2
_080454CC: .4byte 0x085D8128
_080454D0: .4byte 0x00002078
_080454D4:
	movs r2, #0
	ldr r7, _08045504 @ =0x080DEDF2
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, _08045508 @ =0x00001034
	adds r4, r5, #0
_080454E0:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble _080454E0
_080454FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045504: .4byte 0x080DEDF2
_08045508: .4byte 0x00001034

