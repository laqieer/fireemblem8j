	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80C9B0C, 0x080C9B0C + 1
	.section .text.sub_80C9F60, "ax", %progbits
@ sub_80C9F60 @ JP 0x080C9F60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9F60
	.thumb_func
sub_80C9F60:
	push {lr}
	movs r0, #2
	bl sub_80C9B0C
	ldr r0, _080C9F7C @ =0x08B3B72C
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_080C9F7C: .4byte 0x08B3B72C

