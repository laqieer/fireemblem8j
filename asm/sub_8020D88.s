	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8020D88, "ax", %progbits
@ sub_8020D88 @ JP 0x08020D88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020D88
	.thumb_func
sub_8020D88:
	push {lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _08020D9C
	adds r0, r3, #0
	bl sub_8002DE4
	b _08020DB2
_08020D9C:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _08020DB2
	adds r0, r3, #0
	bl sub_8002DE4
_08020DB2:
	pop {r0}
	bx r0
	.align 2, 0

