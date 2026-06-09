	.syntax unified
	.set sub_8025490, 0x08025490 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_802299C, "ax", %progbits
@ sub_802299C @ JP 0x0802299C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802299C
	.thumb_func
sub_802299C:
	push {lr}
	ldr r0, _080229B4 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025490
	ldr r0, _080229B8 @ =0x085C5918
	bl sub_80507B0
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080229B4: .4byte 0x03004DF0
_080229B8: .4byte 0x085C5918

