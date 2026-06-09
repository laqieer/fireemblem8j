	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C55EC, 0x080C55EC + 1
	.section .text.sub_80BE930, "ax", %progbits
@ sub_80BE930 @ JP 0x080BE930 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE930
	.thumb_func
sub_80BE930:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C55EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BE944
	adds r0, r4, #0
	bl sub_8002DE4
_080BE944:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

