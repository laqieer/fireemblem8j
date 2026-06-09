	.syntax unified
	.set CheckRoundCrit, 0x0805B00C + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.set sub_80748E4, 0x080748E4 + 1
	.section .text.sub_80749E0, "ax", %progbits
@ sub_80749E0 @ JP 0x080749E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80749E0
	.thumb_func
sub_80749E0:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08074A1C
	cmp r0, #0
	blt _08074A1C
	adds r0, r5, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08074A1C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl sub_8073F94
_08074A1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

