	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_800BC84, "ax", %progbits
@ sub_800BC84 @ JP 0x0800BC84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BC84
	.thumb_func
sub_800BC84:
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r0, #0x13
	ldr r3, _0800BCA4 @ =0x020228A8
	adds r0, r0, r3
	lsrs r1, r1, #0x13
	adds r1, r1, r3
	lsrs r2, r2, #0x15
	bl sub_80D636C
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_0800BCA4: .4byte 0x020228A8

