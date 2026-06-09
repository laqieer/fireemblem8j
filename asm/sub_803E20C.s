	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803E20C, "ax", %progbits
@ sub_803E20C @ JP 0x0803E20C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E20C
	.thumb_func
sub_803E20C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, _0803E25C @ =0x085D315C
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _0803E260 @ =0x0000270F
	cmp r0, r1
	beq _0803E278
	mov r8, r1
_0803E226:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, _0803E264 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E26E
	ldr r0, _0803E268 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E26C
	adds r5, #5
	b _0803E26E
	.align 2, 0
_0803E25C: .4byte 0x085D315C
_0803E260: .4byte 0x0000270F
_0803E264: .4byte 0x0202E4D4
_0803E268: .4byte 0x0202BE40
_0803E26C:
	subs r5, #5
_0803E26E:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne _0803E226
_0803E278:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

