	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803B334, "ax", %progbits
@ sub_803B334 @ JP 0x0803B334 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B334
	.thumb_func
sub_803B334:
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0803B3A0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803B398
_0803B344:
	ldr r0, _0803B3A0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803B392
	lsls r5, r1, #2
_0803B354:
	ldr r0, _0803B3A4 @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B38C
	ldr r0, _0803B3A8 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B38C
	ldr r0, _0803B3AC @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803B38C
	adds r6, #1
_0803B38C:
	subs r4, #1
	cmp r4, #0
	bge _0803B354
_0803B392:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803B344
_0803B398:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B3A0: .4byte 0x0202E4D0
_0803B3A4: .4byte 0x0202E4E0
_0803B3A8: .4byte 0x0202E4D4
_0803B3AC: .4byte 0x0202BE40

