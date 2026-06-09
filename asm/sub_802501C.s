	.syntax unified
	.set InitTargets, 0x08050618 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.set sub_8024E5C, 0x08024E5C + 1
	.section .text.sub_802501C, "ax", %progbits
@ sub_802501C @ JP 0x0802501C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802501C
	.thumb_func
sub_802501C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _08025068 @ =0x02033F38
	ldr r0, [r6]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl InitTargets
	ldr r0, [r6]
	bl sub_8018730
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	mov r0, r8
	bl sub_8024E5C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025068: .4byte 0x02033F38

