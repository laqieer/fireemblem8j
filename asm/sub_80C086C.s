	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80C086C, "ax", %progbits
@ sub_80C086C @ JP 0x080C086C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C086C
	.thumb_func
sub_80C086C:
	push {lr}
	cmp r0, #0x1c
	bls _080C087C
	ldr r0, _080C0878 @ =0x000005FF
	b _080C0884
	.align 2, 0
_080C0878: .4byte 0x000005FF
_080C087C:
	lsls r0, r0, #5
	ldr r1, _080C088C @ =0x081F5D7C
	adds r0, r0, r1
	ldrh r0, [r0, #0x1c]
_080C0884:
	bl sub_8009FA8
	pop {r1}
	bx r1
	.align 2, 0
_080C088C: .4byte 0x081F5D7C

