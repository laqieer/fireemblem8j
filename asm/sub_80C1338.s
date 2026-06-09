	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_80D4178, 0x080D4178 + 1
	.section .text.sub_80C1338, "ax", %progbits
@ sub_80C1338 @ JP 0x080C1338 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1338
	.thumb_func
sub_80C1338:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r1, #0x63
	ldrb r2, [r1]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _080C13A4
	bl sub_80D4178
	lsls r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x34
	cmp r0, #0
	bne _080C1362
	adds r0, r4, #0
	movs r1, #4
	bl sub_8003D90
_080C1362:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _080C1374
	adds r0, r4, #0
	movs r1, #1
	bl sub_8003D90
_080C1374:
	ldr r0, [r5, #0x30]
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_8003F28
	adds r0, r6, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_080C13A4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

