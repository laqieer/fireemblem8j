	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_8056858, "ax", %progbits
@ sub_8056858 @ JP 0x08056858 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056858
	.thumb_func
sub_8056858:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _08056884
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r1, r0
_0805686C:
	cmp r2, r5
	blo _08056872
	movs r2, #0
_08056872:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _0805686C
_08056884:
	bl sub_8001EE4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

