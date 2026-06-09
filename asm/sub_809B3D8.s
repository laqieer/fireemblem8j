	.syntax unified
	.set sub_8097954, 0x08097954 + 1
	.set sub_809A8F8, 0x0809A8F8 + 1
	.set sub_809C360, 0x0809C360 + 1
	.section .text.sub_809B3D8, "ax", %progbits
@ sub_809B3D8 @ JP 0x0809B3D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B3D8
	.thumb_func
sub_809B3D8:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809A8F8
	bl sub_8097954
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809C360
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

