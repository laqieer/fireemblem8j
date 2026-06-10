	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetUnit, 0x08019108 + 1
	.set InitTargets, 0x08050618 + 1
	.set NextRN_N, 0x08000C58 + 1
	.section .text.sub_802599C, "ax", %progbits
@ sub_802599C @ JP 0x0802599C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802599C
	.thumb_func
sub_802599C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	mov r7, r8
	b _080259FA
_080259B0:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080259FA
	ldr r0, [r2]
	cmp r0, #0
	beq _080259FA
	ldr r0, [r2, #0xc]
	ldr r1, _08025A10 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080259FA
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _080259FA
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl NextRN_N
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl AddTarget
_080259FA:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080259B0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025A10: .4byte 0x0001002C

