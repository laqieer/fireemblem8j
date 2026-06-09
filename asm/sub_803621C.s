	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80358A8, 0x080358A8 + 1
	.set sub_8086604, 0x08086604 + 1
	.set sub_8086694, 0x08086694 + 1
	.section .text.sub_803621C, "ax", %progbits
@ sub_803621C @ JP 0x0803621C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803621C
	.thumb_func
sub_803621C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	bl sub_80358A8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _08036284 @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl sub_8018E64
	cmp r0, #0
	bne _0803626A
	bl sub_8086604
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803626A
	bl sub_8086694
_0803626A:
	ldr r0, _08036284 @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl sub_8018E64
	cmp r0, #0
	bgt _0803627E
	bl sub_8027144
_0803627E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036284: .4byte 0x0203A954

