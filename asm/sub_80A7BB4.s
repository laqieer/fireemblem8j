	.syntax unified
	.set sub_80860F4, 0x080860F4 + 1
	.set sub_80860FC, 0x080860FC + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A7BB4, "ax", %progbits
@ sub_80A7BB4 @ JP 0x080A7BB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7BB4
	.thumb_func
sub_80A7BB4:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080A7BD8 @ =0x03006790
	bl sub_80860F4
	adds r5, r0, #0
	bl sub_80860FC
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80D65C8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BD8: .4byte 0x03006790

