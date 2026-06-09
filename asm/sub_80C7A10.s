	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80C7A10, "ax", %progbits
@ sub_80C7A10 @ JP 0x080C7A10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7A10
	.thumb_func
sub_80C7A10:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C7A34 @ =0x08B2699C
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7A34: .4byte 0x08B2699C

