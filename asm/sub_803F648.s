	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_803F648, "ax", %progbits
@ sub_803F648 @ JP 0x0803F648 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F648
	.thumb_func
sub_803F648:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0803F6A8 @ =0x0203AA00
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnit
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, _0803F6AC @ =0x03004DF0
	ldr r1, [r1]
	movs r3, #0x10
	ldrsb r3, [r1, r3]
	subs r7, r2, r3
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	subs r0, r0, r2
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r5, r0, r3
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r6, r0, r2
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F6B0
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r0, #0
	blt _0803F6B0
	mov r0, r8
	muls r0, r6, r0
	cmp r0, #0
	blt _0803F6B0
	movs r0, #1
	b _0803F6B2
	.align 2, 0
_0803F6A8: .4byte 0x0203AA00
_0803F6AC: .4byte 0x03004DF0
_0803F6B0:
	movs r0, #0
_0803F6B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

