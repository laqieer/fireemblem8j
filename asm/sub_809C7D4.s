	.syntax unified
	.set sub_809C3E8, 0x0809C3E8 + 1
	.section .text.sub_809C7D4, "ax", %progbits
@ sub_809C7D4 @ JP 0x0809C7D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C7D4
	.thumb_func
sub_809C7D4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	ldrh r0, [r5, #0x34]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _0809C7FE
_0809C7E6:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_809C3E8
	adds r4, #1
	ldrh r0, [r5, #0x34]
	lsrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809C7E6
_0809C7FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

