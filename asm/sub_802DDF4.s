	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_802DDF4, "ax", %progbits
@ sub_802DDF4 @ JP 0x0802DDF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DDF4
	.thumb_func
sub_802DDF4:
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802DE0E
	adds r0, r2, #0
	bl sub_8002DE4
_0802DE0E:
	pop {r0}
	bx r0
	.align 2, 0

