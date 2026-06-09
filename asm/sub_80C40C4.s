	.syntax unified
	.set _DivArm2, 0x0800BB3C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C40C4, "ax", %progbits
@ sub_80C40C4 @ JP 0x080C40C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C40C4
	.thumb_func
sub_80C40C4:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080C40DC
	subs r0, r2, #1
	strh r0, [r1]
	b _080C4156
_080C40DC:
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldr r1, [r7, #0x30]
	ands r0, r1
	cmp r0, #0
	beq _080C40F0
	ldr r0, [r7, #0x40]
	str r0, [r7, #0x44]
	adds r1, r0, #0
	b _080C40FC
_080C40F0:
	ldr r0, [r7, #0x44]
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [r7, #0x44]
	ldr r1, [r7, #0x40]
_080C40FC:
	ldr r0, [r7, #0x44]
	cmp r0, r1
	bge _080C4150
	movs r3, #0x34
	ldrsh r2, [r7, r3]
	bl _DivArm2
	adds r5, r0, #0
	movs r6, #0x80
	lsls r6, r6, #5
	movs r1, #0x3a
	ldrsh r0, [r7, r1]
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	movs r3, #0x36
	ldrsh r4, [r7, r3]
	adds r4, r4, r0
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	movs r2, #0x38
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	movs r3, #0x38
	ldrsh r1, [r7, r3]
	adds r1, r1, r0
	ldr r0, _080C414C @ =0x03005270
	strh r4, [r0, #2]
	strh r1, [r0, #4]
	b _080C4156
	.align 2, 0
_080C414C: .4byte 0x03005270
_080C4150:
	adds r0, r7, #0
	bl sub_8002DE4
_080C4156:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

