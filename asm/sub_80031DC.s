	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80031DC, "ax", %progbits
@ sub_80031DC @ JP 0x080031DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80031DC
	.thumb_func
sub_80031DC:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x24]
	subs r0, #1
	strh r0, [r1, #0x24]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080031F2
	adds r0, r1, #0
	bl sub_8002DE4
_080031F2:
	pop {r0}
	bx r0
	.align 2, 0

