	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80B62FC, 0x080B62FC + 1
	.section .text.sub_80B63A4, "ax", %progbits
@ sub_80B63A4 @ JP 0x080B63A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B63A4
	.thumb_func
sub_80B63A4:
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _080B63F4 @ =0x08AAF6D8
	ldr r0, [r4]
	adds r0, #0xa8
	bl sub_8003CF8
	ldr r5, _080B63F8 @ =0x08AAF700
	bl sub_80B62FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	ldr r2, _080B63FC @ =0x08AAF6DC
	ldr r1, [r4]
	movs r3, #0x2a
	ldrsh r1, [r1, r3]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r1, #0x2c
	muls r1, r2, r1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, #0xa8
	ldr r1, _080B6400 @ =0x02023130
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B63F4: .4byte 0x08AAF6D8
_080B63F8: .4byte 0x08AAF700
_080B63FC: .4byte 0x08AAF6DC
_080B6400: .4byte 0x02023130

