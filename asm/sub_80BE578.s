	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C41E0, 0x080C41E0 + 1
	.section .text.sub_80BE578, "ax", %progbits
@ sub_80BE578 @ JP 0x080BE578 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE578
	.thumb_func
sub_80BE578:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C41E0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BE58C
	adds r0, r4, #0
	bl sub_8002DE4
_080BE58C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

